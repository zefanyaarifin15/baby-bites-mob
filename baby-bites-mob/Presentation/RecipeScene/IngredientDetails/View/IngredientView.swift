//
//  IngredientView.swift
//  baby-bites-mob
//
//  Created by Mika S Rahwono on 21/08/24.
//

import UIKit
import Combine

class IngredientDetailsViewController: UIViewController {
    private var viewModel: IngredientDetailsViewModel
    private var cancellables = Set<AnyCancellable>()

    private let ingredientImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private let ingredientNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let ingredientDescriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let dishInspirationLabel: UILabel = {
        let label = UILabel()
        label.text = "Dish Inspiration"
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()

    init(viewModel: IngredientDetailsViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        bindViewModel()
    }

    private func setupUI() {
        title = "Ingredient Detail"
        view.backgroundColor = .systemBackground

        view.addSubview(ingredientImageView)
        view.addSubview(ingredientNameLabel)
        view.addSubview(ingredientDescriptionLabel)
        view.addSubview(separatorView)
        view.addSubview(dishInspirationLabel)
        view.addSubview(tableView)

        tableView.dataSource = self
        tableView.register(RecipeTableViewCell.self, forCellReuseIdentifier: RecipeTableViewCell.identifier)

        setupConstraints()
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            ingredientImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            ingredientImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            ingredientImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            ingredientImageView.heightAnchor.constraint(equalToConstant: 200),

            ingredientNameLabel.topAnchor.constraint(equalTo: ingredientImageView.bottomAnchor, constant: 10),
            ingredientNameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            ingredientNameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),

            ingredientDescriptionLabel.topAnchor.constraint(equalTo: ingredientNameLabel.bottomAnchor, constant: 10),
            ingredientDescriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            ingredientDescriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),

            separatorView.topAnchor.constraint(equalTo: ingredientDescriptionLabel.bottomAnchor, constant: 10),
            separatorView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            separatorView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            separatorView.heightAnchor.constraint(equalToConstant: 1),

            dishInspirationLabel.topAnchor.constraint(equalTo: separatorView.bottomAnchor, constant: 10),
            dishInspirationLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            dishInspirationLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),

            tableView.topAnchor.constraint(equalTo: dishInspirationLabel.bottomAnchor, constant: 10),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }

    private func bindViewModel() {
        viewModel.$ingredient
            .receive(on: DispatchQueue.main)
            .sink { [weak self] ingredient in
                self?.ingredientNameLabel.text = ingredient?.name
            }
            .store(in: &cancellables)
    }
}

extension IngredientDetailsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.recipes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "RecipeCell", for: indexPath) as! RecipeTableViewCell
            let recipe = viewModel.recipes[indexPath.row]
            cell.configure(with: recipe)
            return cell
        }
}
