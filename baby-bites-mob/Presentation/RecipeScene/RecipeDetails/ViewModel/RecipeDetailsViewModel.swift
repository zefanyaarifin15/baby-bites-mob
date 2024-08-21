//
//  RecipeDetailsViewModel.swift
//  baby-bites-mob
//
//  Created by Mika S Rahwono on 20/08/24.
//

import Combine
import Foundation

class RecipeDetailsViewModel: ObservableObject {
    @Published var recipe: Recipe?
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?

    private let fetchRecipeUseCase: FetchRecipeUseCase
    private var cancellables = Set<AnyCancellable>()

    init(fetchRecipeUseCase: FetchRecipeUseCase) {
        self.fetchRecipeUseCase = fetchRecipeUseCase
    }

    func fetchRecipe(by recipeID: String) {
        isLoading = true
        fetchRecipeUseCase.execute(recipeID: recipeID) { [weak self] result in
            DispatchQueue.main.async {
                self?.isLoading = false
                switch result {
                case .success(let recipe):
                    self?.recipe = recipe
                    self?.errorMessage = nil
                case .failure(let error):
                    self?.recipe = nil
                    self?.errorMessage = error.localizedDescription
                }
            }
        }
    }
}
