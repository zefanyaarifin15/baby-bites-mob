//
//  RecommendationsListViewModel.swift
//  baby-bites-mob
//
//  Created by Mika S Rahwono on 20/08/24.
//

import Combine
import Foundation

class RecommendationViewModel: ObservableObject {
    private var allRecipes: [Favorite<Recipe>] = []
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?
    @Published private(set) var recipes: [Recipe] = []
    @Published private(set) var recommendations: [Recipe] = []
    
    private let recommendationPredictor: RecommendationPredictor
    private var recommendationsTask: Task<Void, Never>?
    
    private let fetchAllRecipesUseCase: FetchAllRecipesUseCase
    private var cancellables = Set<AnyCancellable>()


    init(recommendationPredictor: RecommendationPredictor = RecommendationPredictor(), fetchAllRecipesUseCase: FetchAllRecipesUseCase) {
        self.recommendationPredictor = recommendationPredictor
        self.fetchAllRecipesUseCase = fetchAllRecipesUseCase
    }

    func fetchAllRecipes(by recipeID: String) {
        isLoading = true
        fetchAllRecipesUseCase.execute() { [weak self] result in
            DispatchQueue.main.async {
                self?.isLoading = false
                switch result {
                case .success(let recipe):
                    self?.recipes = recipe
                    self?.errorMessage = nil
                case .failure(let error):
                    self?.recipes = []
                    self?.errorMessage = error.localizedDescription
                }
            }
        }
    }
}
