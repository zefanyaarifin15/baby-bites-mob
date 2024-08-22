//
//  MainView.swift
//  baby-bites-mob
//
//  Created by Mika S Rahwono on 21/08/24.
//

import UIKit

class MainViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBar()
    }
    
    private func setupTabBar() {
        let ingredientRepository = CloudKitIngredientRepository()
        let recipeRepository = CloudKitRecipeRepository(ingredientRepository: ingredientRepository)
        
        // Setup Ingredients List ViewModel and ViewController
        let ingredientsListViewModel = IngredientsListViewModel(fetchIngredientsUseCase: FetchAllIngredientsUseCase(ingredientRepository: ingredientRepository))
        let ingredientsListVC = UINavigationController(rootViewController: IngredientsListViewController(viewModel: ingredientsListViewModel))
        ingredientsListVC.tabBarItem = UITabBarItem(title: "Library", image: UIImage(systemName: "books.vertical"), tag: 0)
        
        // Setup Recommendations ViewModel and ViewController
        let fetchAllRecipesUseCase = FetchAllRecipesUseCase(recipeRepository: recipeRepository)
        let recommendationTracker = RecommendationTracker(fetchAllRecipesUseCase: fetchAllRecipesUseCase)
        let recommendationsViewModel = RecommendationViewModel(recommendationTracker: recommendationTracker)
        let recommendationsVC = UINavigationController(rootViewController: RecommendationListViewController(viewModel: recommendationsViewModel))
        recommendationsVC.tabBarItem = UITabBarItem(title: "Recommendation", image: UIImage(systemName: "star"), tag: 1)
        
        // Set ViewControllers
        viewControllers = [recommendationsVC, ingredientsListVC]
        
        tabBar.tintColor = .systemBlue
        tabBar.unselectedItemTintColor = .gray
    }
}
