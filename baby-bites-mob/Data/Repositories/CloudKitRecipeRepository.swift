//
//  Untitled.swift
//  baby-bites-mob
//
//  Created by Mika S Rahwono on 20/08/24.
//

import CloudKit

class CloudKitRecipeRepository: RecipeRepository {
    
    private let ingredientRepository: CloudKitIngredientRepository
    
    init(ingredientRepository: CloudKitIngredientRepository) {
        self.ingredientRepository = ingredientRepository
    }
    
    func fetchAllRecipes(completion: @escaping (Result<[Recipe], Error>) -> Void) {
        let privateDatabase = CKContainer.default().privateCloudDatabase
        let query = CKQuery(recordType: "Recipe", predicate: NSPredicate(value: true))
        let sortDescriptor = NSSortDescriptor(key: "title", ascending: true)
        query.sortDescriptors = [sortDescriptor]

        privateDatabase.perform(query, inZoneWith: nil) { [weak self] results, error in
            if let error = error {
                completion(.failure(error))
            } else if let records = results {
                
                // Create a fetchIngredient closure
                let fetchIngredient: (CKRecord.ID, @escaping (Ingredient?) -> Void) -> Void = { ingredientID, completion in
                    self?.ingredientRepository.fetchIngredient(by: ingredientID.recordName) { result in
                        switch result {
                        case .success(let ingredient):
                            completion(ingredient)
                        case .failure:
                            completion(nil)
                        }
                    }
                }

                let recipesGroup = DispatchGroup()
                var recipes = [Recipe]()
                var fetchError: Error?

                for record in records {
                    recipesGroup.enter()
                    let recipe = Recipe(record: record, fetchIngredient: fetchIngredient)
                    recipes.append(recipe)
                    recipesGroup.leave()
                }

                recipesGroup.notify(queue: .main) {
                    if let error = fetchError {
                        completion(.failure(error))
                    } else {
                        completion(.success(recipes))
                    }
                }
            }
        }
    }

    func fetchRecipesByIngredients(by ingredientID: String, completion: @escaping (Result<[Recipe], Error>) -> Void) {
            let privateDatabase = CKContainer.default().privateCloudDatabase
            let query = CKQuery(recordType: "Recipe", predicate: NSPredicate(value: true))
            let sortDescriptor = NSSortDescriptor(key: "title", ascending: true)
            query.sortDescriptors = [sortDescriptor]

            privateDatabase.perform(query, inZoneWith: nil) { [weak self] results, error in
                if let error = error {
                    completion(.failure(error))
                } else if let records = results {
                    
                    // Create a fetchIngredient closure
                    let fetchIngredient: (CKRecord.ID, @escaping (Ingredient?) -> Void) -> Void = { ingredientID, completion in
                        self?.ingredientRepository.fetchIngredient(by: ingredientID.recordName) { result in
                            switch result {
                            case .success(let ingredient):
                                completion(ingredient)
                            case .failure:
                                completion(nil)
                            }
                        }
                    }

                    let recipesGroup = DispatchGroup()
                    var recipes = [Recipe]()
                    var fetchError: Error?

                    for record in records {
                        recipesGroup.enter()
                        let recipe = Recipe(record: record, fetchIngredient: fetchIngredient)
                        recipesGroup.leave()
                        recipes.append(recipe)
                    }

                    recipesGroup.notify(queue: .main) {
                        if let error = fetchError {
                            completion(.failure(error))
                        } else {
                            // Filter recipes based on the ingredientID
                            let filteredRecipes = recipes.filter { recipe in
                                return recipe.ingredients?.id == ingredientID
                            }
                            completion(.success(filteredRecipes))
                        }
                    }
                }
            }
        }
    
    func saveRecipe(_ recipe: Recipe, completion: @escaping (Result<Void, Error>) -> Void) {
        let record = recipe.toCKRecord()
        let privateDatabase = CKContainer.default().privateCloudDatabase
        privateDatabase.save(record) { savedRecord, error in
            if let error = error {
                completion(.failure(error))
            } else {
                completion(.success(()))
            }
        }
    }

    func fetchRecipe(by id: String, completion: @escaping (Result<Recipe, Error>) -> Void) {
        let privateDatabase = CKContainer.default().privateCloudDatabase
        let recordID = CKRecord.ID(recordName: id)
        privateDatabase.fetch(withRecordID: recordID) { [weak self] record, error in
            if let error = error {
                completion(.failure(error))
            } else if let record = record {
                // Define fetchIngredient closure
                let fetchIngredient: (CKRecord.ID, @escaping (Ingredient?) -> Void) -> Void = { ingredientID, completion in
                    self?.ingredientRepository.fetchIngredient(by: ingredientID.recordName) { result in
                        switch result {
                        case .success(let ingredient):
                            completion(ingredient)
                        case .failure:
                            completion(nil)
                        }
                    }
                }

                // Create Recipe instance
                let recipe = Recipe(record: record, fetchIngredient: fetchIngredient)
                completion(.success(recipe))
            }
        }
    }
}
