//
//  IngredientTableView.swift
//  baby-bites-mob
//
//  Created by Mika S Rahwono on 22/08/24.
//

import UIKit

class RecipeTableViewCell: UITableViewCell {
    static let identifier = "RecipeTableViewCell"

    private let recipeImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 10
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let labelView: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .white
        label.backgroundColor = .red
        label.layer.cornerRadius = 5
        label.clipsToBounds = true
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let timeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(recipeImageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(labelView)
        contentView.addSubview(timeLabel)
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            recipeImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            recipeImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            recipeImageView.widthAnchor.constraint(equalToConstant: 80),
            recipeImageView.heightAnchor.constraint(equalToConstant: 80),

            titleLabel.leadingAnchor.constraint(equalTo: recipeImageView.trailingAnchor, constant: 10),
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),

            labelView.leadingAnchor.constraint(equalTo: recipeImageView.trailingAnchor, constant: 10),
            labelView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5),
            labelView.widthAnchor.constraint(equalToConstant: 50),
            labelView.heightAnchor.constraint(equalToConstant: 20),

            timeLabel.leadingAnchor.constraint(equalTo: recipeImageView.trailingAnchor, constant: 10),
            timeLabel.topAnchor.constraint(equalTo: labelView.bottomAnchor, constant: 5),
            timeLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
        ])
    }

    func configure(with recipe: Recipe) {
        // Configure the cell with recipe data
//        recipeImageView.image = UIImage(named: recipe.imageName)
        titleLabel.text = recipe.title
//        labelView.text = recipe.label
//        timeLabel.text = "\(recipe.time) min"
    }
}
