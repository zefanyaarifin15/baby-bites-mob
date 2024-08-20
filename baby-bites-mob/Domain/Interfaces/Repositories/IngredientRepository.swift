//
//  IngredientRepository.swift
//  baby-bites-mob
//
//  Created by Mika S Rahwono on 20/08/24.
//

protocol IngredientRepository {
    func saveIngredient(_ ingredient: Ingredient, completion: @escaping (Result<Void, Error>) -> Void)
    func fetchIngredient(by id: String, completion: @escaping (Result<Ingredient, Error>) -> Void)
    func fetchIngredients(completion: @escaping (Result<[Ingredient], Error>) -> Void)
}
