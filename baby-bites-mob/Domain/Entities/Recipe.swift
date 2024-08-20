//
//  Recipe.swift
//  baby-bites-mob
//
//  Created by Mika S Rahwono on 20/08/24.
//

import Foundation
import CloudKit

class Recipe: Equatable, Identifiable {
    typealias Identifier = String

    enum Category: String {
        case firstFoods
        case stageOne
        case stageTwo
        case stageThree
    }
    
    enum Texture: String {
        case pureed
        case mashed
        case softChunks
        case smooth
        case lumpy
    }
    
    let id: Identifier
    var title: String?
    var category: Category?
    var imageUrl: String?
    var description: String?
    var cookingTime: TimeInterval?
    var texture: Texture?
    var ingredients: Ingredient?
    var preparationInstructions: NSAttributedString?
    
    init(record: CKRecord, fetchIngredient: @escaping (CKRecord.ID, @escaping (Ingredient?) -> Void) -> Void) {
        self.id = record.recordID.recordName
        self.title = record["title"] as? String
        self.category = (record["category"] as? String).flatMap { Category(rawValue: $0) }
        self.imageUrl = record["imageUrl"] as? String
        self.description = record["description"] as? String
        self.cookingTime = record["cookingTime"] as? TimeInterval
        self.texture = (record["texture"] as? String).flatMap { Texture(rawValue: $0) }
        
        if let ingredientRecordReference = record["ingredients"] as? CKRecord.Reference {
            fetchIngredient(ingredientRecordReference.recordID) { ingredient in
                self.ingredients = ingredient
            }
        }
        
        if let instructionsData = record["preparationInstructions"] as? Data {
            self.preparationInstructions = NSKeyedUnarchiver.unarchiveObject(with: instructionsData) as? NSAttributedString
        }
    }

    func toCKRecord() -> CKRecord {
        let record = CKRecord(recordType: "Recipe")
        record["title"] = title as CKRecordValue?
        record["category"] = category?.rawValue as CKRecordValue?
        record["imageUrl"] = imageUrl as CKRecordValue?
        record["description"] = description as CKRecordValue?
        record["cookingTime"] = cookingTime as CKRecordValue?
        record["texture"] = texture?.rawValue as CKRecordValue?
        if let instructions = preparationInstructions {
            record["preparationInstructions"] = NSKeyedArchiver.archivedData(withRootObject: instructions) as CKRecordValue
        }
        if let ingredient = ingredients {
            let ingredientRecord = ingredient.toCKRecord()
            let reference = CKRecord.Reference(recordID: ingredientRecord.recordID, action: .none)
            record["ingredients"] = reference
        }
        return record
    }
    
    static func == (lhs: Recipe, rhs: Recipe) -> Bool {
        return lhs.id == rhs.id
    }
}
