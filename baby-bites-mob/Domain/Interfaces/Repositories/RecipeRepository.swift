//
//  RecipeRepository.swift
//  baby-bites-mob
//
//  Created by Mika S Rahwono on 20/08/24.
//

protocol RecipeRepository {
    func saveRecipe(_ recipe: Recipe, completion: @escaping (Result<Void, Error>) -> Void)
    func fetchRecipe(by id: String, completion: @escaping (Result<Recipe, Error>) -> Void)
    func fetchRecipes(completion: @escaping (Result<[Recipe], Error>) -> Void)
}
