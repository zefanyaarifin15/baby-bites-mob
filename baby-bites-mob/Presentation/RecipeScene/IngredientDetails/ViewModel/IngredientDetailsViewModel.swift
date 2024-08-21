//
//  IngredientDetailsViewModel.swift
//  baby-bites-mob
//
//  Created by Mika S Rahwono on 20/08/24.
//

import Combine
import Foundation

class IngredientDetailsViewModel: ObservableObject {
    @Published var ingredient: Ingredient?
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?

    private let fetchIngredientUseCase: FetchIngredientUseCase
    private var cancellables = Set<AnyCancellable>()

    init(fetchIngredientUseCase: FetchIngredientUseCase) {
        self.fetchIngredientUseCase = fetchIngredientUseCase
    }

    func fetchIngredient(by ingredientID: String) {
        isLoading = true
        fetchIngredientUseCase.execute(ingredientID: ingredientID) { [weak self] result in
            DispatchQueue.main.async {
                self?.isLoading = false
                switch result {
                case .success(let ingredient):
                    self?.ingredient = ingredient
                    self?.errorMessage = nil
                case .failure(let error):
                    self?.ingredient = nil
                    self?.errorMessage = error.localizedDescription
                }
            }
        }
    }
}
