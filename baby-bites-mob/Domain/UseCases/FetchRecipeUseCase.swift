//
//  FetchRecipeUseCase.swift
//  baby-bites-mob
//
//  Created by Mika S Rahwono on 20/08/24.
//

class FetchRecipeUseCase {
    private let recipeRepository: RecipeRepository

    init(recipeRepository: RecipeRepository) {
        self.recipeRepository = recipeRepository
    }

    func execute(recipeID: String, completion: @escaping (Result<Recipe, Error>) -> Void) {
        recipeRepository.fetchRecipe(by: recipeID, completion: completion)
    }
}
