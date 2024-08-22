//
//  RecommendationsListViewModel.swift
//  baby-bites-mob
//
//  Created by Mika S Rahwono on 20/08/24.
//

import Combine
import Foundation

class RecommendationViewModel: ObservableObject {
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?
    @Published private(set) var recommendations: [Recipe] = []
    
    private let recommendationTracker: RecommendationTracker
    private var recommendationsTask: Task<Void, Never>?

    init(recommendationTracker: RecommendationTracker) {
        self.recommendationTracker = recommendationTracker
        initializeRecommendation()
    }
    
    func initializeRecommendation() {
        isLoading = true
        recommendationTracker.isHasLiked { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let isHasLiked):
                    if isHasLiked {
                        self?.recommendationTracker.getRecommendations { [weak self] result in
                            DispatchQueue.main.async {
                                switch result {
                                case .success(let recommendations):
                                    self?.recommendations = recommendations
                                    self?.errorMessage = nil
                                case .failure(let error):
                                    self?.recommendations = []
                                    self?.errorMessage = error.localizedDescription
                                }
                            }
                        }
                    } else {
                        self?.recommendations = []
                    }
                case .failure(let error):
                    self?.recommendations = []
                    self?.errorMessage = error.localizedDescription
                }
            }
        }
    }
}
