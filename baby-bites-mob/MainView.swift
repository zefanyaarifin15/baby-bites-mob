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
        let ingredientsListViewModel = IngredientsListViewModel(fetchIngredientsUseCase: FetchAllIngredientsUseCase(ingredientRepository: ingredientRepository))
        let ingredientsListVC = UINavigationController(rootViewController: IngredientsListViewController(viewModel: ingredientsListViewModel))
        ingredientsListVC.tabBarItem = UITabBarItem(title: "Library", image: UIImage(systemName: "books.vertical"), tag: 0)
        
        let recommendationsVC = UIViewController() // Placeholder for the second tab
        recommendationsVC.view.backgroundColor = .white
        recommendationsVC.tabBarItem = UITabBarItem(title: "Recommendation", image: UIImage(systemName: "star"), tag: 1)
        
        viewControllers = [recommendationsVC, ingredientsListVC]
        
        tabBar.tintColor = .systemBlue
        tabBar.unselectedItemTintColor = .gray
    }
}
