//
//  RecommendationTracker.swift
//  baby-bites-mob
//
//  Created by Mika S Rahwono on 22/08/24.
//

import Combine
import Foundation

final class RecommendationTracker: ObservableObject {
    var allRecipes: [Favorite<Recipe>] = []
    @Published var recommendations: [Recipe] = []
    @Published private(set) var recipes: [Recipe] = []
    
    private let recommendationPredictor: RecommendationPredictor
    private var recommendationsTask: Task<Void, Never>?
    
    private let fetchAllRecipesUseCase: FetchAllRecipesUseCase
    private var cancellables = Set<AnyCancellable>()
    
    init(recommendationPredictor: RecommendationPredictor = RecommendationPredictor(), fetchAllRecipesUseCase: FetchAllRecipesUseCase) {
        self.recommendationPredictor = recommendationPredictor
        self.fetchAllRecipesUseCase = fetchAllRecipesUseCase
    }
    
    func getRecommendations(completion: @escaping (Result<[Recipe], Error>) -> Void) {
        completion(.success(recommendations))
    }
    
    func didRating(_ item: Recipe, rating: Int, completion: @escaping ([Recipe]) -> Void) {
        recipes.removeAll { $0.id == item.id }
        if let index = allRecipes.firstIndex(where: { $0.model.id == item.id }) {
            allRecipes[index] = Favorite(model: item, rating: rating)
        }
        recommendationsTask?.cancel()
        recommendationsTask = Task {
            do {
                let result = try await recommendationPredictor.computeRecommendations(basedOn: allRecipes)
                if !Task.isCancelled {
                    recommendations = result
                    completion(recommendations)
                }
            } catch {
                print(error.localizedDescription)
                completion([])
            }
        }
    }
    
    func isHasLiked(completion: @escaping (Result<Bool, Error>) -> Void) {
        let likedRecipes = allRecipes.filter {
            $0.rating != nil
        }
        if likedRecipes.isEmpty {
            completion(.success(false))
            fetchAllRecipesUseCase.execute() { result in
                switch result {
                case .success(let recipes):
                    self.recipes = recipes
                case .failure(let error):
                    print("Error fetching recipes: \(error)")
                    self.recipes = []
                }
            }
        } else {
            completion(.success(true))
        }
    }
    
    func storeLikedFoods(completion: @escaping (Result<Bool, Error>) -> Void) {

    }
    
    func fetchLikedFoods(completion: @escaping (Result<Bool, Error>) -> Void) {

    }
}

