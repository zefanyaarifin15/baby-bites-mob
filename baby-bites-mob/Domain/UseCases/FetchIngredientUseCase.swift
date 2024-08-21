//
//  IngredientUseCase.swift
//  baby-bites-mob
//
//  Created by Mika S Rahwono on 20/08/24.
//

class FetchIngredientUseCase {
    private let ingredientRepository: IngredientRepository

    init(ingredientRepository: IngredientRepository) {
        self.ingredientRepository = ingredientRepository
    }

    func execute(ingredientID: String, completion: @escaping (Result<Ingredient, Error>) -> Void) {
        ingredientRepository.fetchIngredient(by: ingredientID, completion: completion)
    }
}
