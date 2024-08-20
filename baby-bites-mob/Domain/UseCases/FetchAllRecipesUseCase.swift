//
//  FetchRecipesUseCase.swift
//  baby-bites-mob
//
//  Created by Mika S Rahwono on 20/08/24.
//

class FetchAllRecipesUseCase {
    private let recipeRepository: RecipeRepository

    init(recipeRepository: RecipeRepository) {
        self.recipeRepository = recipeRepository
    }

    func execute(ingredientID: String, completion: @escaping (Result<[Recipe], Error>) -> Void) {
        recipeRepository.fetchRecipes(by: ingredientID, completion: completion)
    }
}
