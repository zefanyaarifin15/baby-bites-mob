//
//  FetchIngredientsUseCase.swift
//  baby-bites-mob
//
//  Created by Mika S Rahwono on 20/08/24.
//

class FetchAllIngredientsUseCase {
    private let ingredientRepository: IngredientRepository

    init(ingredientRepository: IngredientRepository) {
        self.ingredientRepository = ingredientRepository
    }

    func execute(completion: @escaping (Result<[Ingredient], Error>) -> Void) {
        ingredientRepository.fetchIngredients(completion: completion)
    }
}
