//
//  SaveIngredientUseCase.swift
//  baby-bites-mob
//
//  Created by Mika S Rahwono on 20/08/24.
//

class SaveIngredientUseCase {
    private let ingredientRepository: IngredientRepository

    init(ingredientRepository: IngredientRepository) {
        self.ingredientRepository = ingredientRepository
    }

    func execute(ingredient: Ingredient, completion: @escaping (Result<Void, Error>) -> Void) {
        ingredientRepository.saveIngredient(ingredient, completion: completion)
    }
}
