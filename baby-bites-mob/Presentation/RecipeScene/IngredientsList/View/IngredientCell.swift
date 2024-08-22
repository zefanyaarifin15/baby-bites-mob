//
//  IngredientCell.swift
//  baby-bites-mob
//
//  Created by Mika S Rahwono on 21/08/24.
//

import UIKit

class IngredientCell: UICollectionViewCell {
    static let identifier = "IngredientCell"
    
    var onCellTapped: (() -> Void)?
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .label
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupTapGesture()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        contentView.addSubview(nameLabel)
        
        NSLayoutConstraint.activate([
            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            nameLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
        ])
    }
    
    private func setupTapGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        contentView.addGestureRecognizer(tapGesture)
    }
    
    @objc private func handleTap() {
        onCellTapped?()
    }
    
    func configure(with ingredient: Ingredient, onTap: @escaping () -> Void) {
        nameLabel.text = ingredient.name
        onCellTapped = onTap
    }
}
