//
//  RecipeUseCase.swift
//  baby-bites-mob
//
//  Created by Mika S Rahwono on 20/08/24.
//

class SaveRecipeUseCase {
    private let recipeRepository: RecipeRepository

    init(recipeRepository: RecipeRepository) {
        self.recipeRepository = recipeRepository
    }

    func execute(recipe: Recipe, completion: @escaping (Result<Void, Error>) -> Void) {
        recipeRepository.saveRecipe(recipe, completion: completion)
    }
}

