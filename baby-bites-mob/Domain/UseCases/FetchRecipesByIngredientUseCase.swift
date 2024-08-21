//
//  FetchRecipesByUser.swift
//  baby-bites-mob
//
//  Created by Mika S Rahwono on 21/08/24.
//

class FetchRecipesByIngredientUseCase {
    private let recipeRepository: RecipeRepository

    init(recipeRepository: RecipeRepository) {
        self.recipeRepository = recipeRepository
    }

    func execute(ingredientID: String, completion: @escaping (Result<[Recipe], Error>) -> Void) {
        recipeRepository.fetchRecipesByIngredients(by: ingredientID, completion: completion)
    }
}
