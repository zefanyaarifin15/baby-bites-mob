//
//  Untitled.swift
//  baby-bites-mob
//
//  Created by Mika S Rahwono on 20/08/24.
//
import CloudKit

class CloudKitRecipeRepository: RecipeRepository {
    func fetchRecipes(completion: @escaping (Result<[Recipe], Error>) -> Void) {
        let privateDatabase = CKContainer.default().privateCloudDatabase
        let query = CKQuery(recordType: "Recipe", predicate: NSPredicate(value: true))
        let sortDescriptor = NSSortDescriptor(key: "name", ascending: true) // Adjust key as needed
        query.sortDescriptors = [sortDescriptor]
        
        privateDatabase.perform(query, inZoneWith: nil) { results, error in
            if let error = error {
                completion(.failure(error))
            } else if let records = results {
                let recipes = records.map { Recipe(record: $0) }
                completion(.success(recipes))
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
        privateDatabase.fetch(withRecordID: recordID) { record, error in
            if let error = error {
                completion(.failure(error))
            } else if let record = record {
                let recipe = Recipe(record: record)
                completion(.success(recipe))
            }
        }
    }
}
