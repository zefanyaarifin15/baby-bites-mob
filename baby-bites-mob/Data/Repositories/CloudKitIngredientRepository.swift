//
//  CloudKitIngredientRepository.swift
//  baby-bites-mob
//
//  Created by Mika S Rahwono on 20/08/24.
//

import CloudKit

class CloudKitIngredientRepository {
    
    // Fetch all ingredients
    func fetchIngredients(completion: @escaping (Result<[Ingredient], Error>) -> Void) {
        let privateDatabase = CKContainer.default().privateCloudDatabase
        let query = CKQuery(recordType: "Ingredient", predicate: NSPredicate(value: true))
        let sortDescriptor = NSSortDescriptor(key: "name", ascending: true) // Adjust key as needed
        query.sortDescriptors = [sortDescriptor]
        
        privateDatabase.perform(query, inZoneWith: nil) { results, error in
            if let error = error {
                completion(.failure(error))
            } else if let records = results {
                let ingredients = records.map { Ingredient(record: $0) }
                completion(.success(ingredients))
            } else {
                completion(.success([])) // Handle the case where no ingredients are found
            }
        }
    }
    
    // Save an ingredient
    func saveIngredient(_ ingredient: Ingredient, completion: @escaping (Result<Void, Error>) -> Void) {
        let record = ingredient.toCKRecord()
        let privateDatabase = CKContainer.default().privateCloudDatabase
        privateDatabase.save(record) { savedRecord, error in
            if let error = error {
                completion(.failure(error))
            } else {
                completion(.success(()))
            }
        }
    }
    
    // Fetch a specific ingredient by ID
    func fetchIngredient(by id: String, completion: @escaping (Result<Ingredient, Error>) -> Void) {
        let privateDatabase = CKContainer.default().privateCloudDatabase
        let recordID = CKRecord.ID(recordName: id)
        privateDatabase.fetch(withRecordID: recordID) { record, error in
            if let error = error {
                completion(.failure(error))
            } else if let record = record {
                let ingredient = Ingredient(record: record)
                completion(.success(ingredient))
            }
        }
    }
}
