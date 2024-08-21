//
//  IngredientView.swift
//  baby-bites-mob
//
//  Created by Mika S Rahwono on 21/08/24.
//

import UIKit

class IngredientViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UISearchBarDelegate {
    
    // MARK: - UI Components
    let searchBar = UISearchBar()
    let collectionView: UICollectionView
    
    // MARK: - Initialization
    init() {
        // Set up the Collection View layout
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 100, height: 150) // Size of each cell
        layout.sectionInset = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16) // Padding between cells
        layout.minimumLineSpacing = 16 // Space between rows
        layout.minimumInteritemSpacing = 16 // Space between columns
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        configureTabBar()
    }
    
    // MARK: - Setup UI
    private func setupUI() {
        view.backgroundColor = .white
        title = "Library"
        
        // Setup Search Bar
        searchBar.delegate = self
        searchBar.placeholder = "Search"
        searchBar.searchBarStyle = .minimal
        view.addSubview(searchBar)
        
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            searchBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            searchBar.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            searchBar.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
        ])
        
        // Setup Collection View
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .white
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        view.addSubview(collectionView)
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: 16),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    // MARK: - Collection View Data Source
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6 // Number of items
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        cell.backgroundColor = .lightGray // Placeholder color
        cell.layer.cornerRadius = 10 // Rounded corners
        return cell
    }
    
    // MARK: - Tab Bar Configuration
    private func configureTabBar() {
        let tabBarController = UITabBarController()
        let recommendationVC = UIViewController()
        recommendationVC.view.backgroundColor = .white
        recommendationVC.tabBarItem = UITabBarItem(title: "Recommendation", image: UIImage(systemName: "star.fill"), selectedImage: UIImage(systemName: "star.fill"))
        
        let libraryVC = UINavigationController(rootViewController: self)
        libraryVC.tabBarItem = UITabBarItem(title: "Library", image: UIImage(systemName: "books.vertical.fill"), selectedImage: UIImage(systemName: "books.vertical.fill"))
        
        tabBarController.viewControllers = [recommendationVC, libraryVC]
        tabBarController.selectedIndex = 1
        view.addSubview(tabBarController.view)
        addChild(tabBarController)
        tabBarController.didMove(toParent: self)
    }
}
