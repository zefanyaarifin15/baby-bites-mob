//
//  Ingredient.swift
//  baby-bites-mob
//
//  Created by Mika S Rahwono on 20/08/24.
//
import CloudKit

struct Ingredient: Equatable, Identifiable {
    typealias Identifier = String

    enum FlavorProfile: String {
        case bland
        case mildlySweet
        case mildlySavory
        case neutral
        case slightlySour
    }
    
    let id: Identifier
    let name: String
    let flavorProfile: FlavorProfile?
    
    init(record: CKRecord) {
        self.id = record.recordID.recordName
        self.name = record["name"] as? String ?? ""
        if let flavorProfileRaw = record["flavorProfile"] as? String {
            self.flavorProfile = FlavorProfile(rawValue: flavorProfileRaw)
        } else {
            self.flavorProfile = nil
        }
    }

    func toCKRecord() -> CKRecord {
        let record = CKRecord(recordType: "Ingredient")
        record["name"] = name as CKRecordValue
        record["flavorProfile"] = flavorProfile?.rawValue as CKRecordValue?
        return record
    }
}
