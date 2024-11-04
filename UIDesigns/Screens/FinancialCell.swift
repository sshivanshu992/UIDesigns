//
//  FinancialCell.swift
//  UIDesigns
//
//  Created by Shivanshu Verma on 03/11/24.
//

import UIKit

class FinancialCell: UITableViewCell {
    private let containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 16
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.lightGray.withAlphaComponent(0.3).cgColor
        view.layer.masksToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private var circularImageView: CircularImageView = {
        let imageView = CircularImageView()
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private var nameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .semibold)
        label.numberOfLines = 0
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var typeLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12, weight: .light)
        label.numberOfLines = 0
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var amountLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .semibold)
        label.numberOfLines = 0
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var dateTileLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12, weight: .light)
        label.numberOfLines = 0
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .clear
        contentView.backgroundColor = .clear
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupViews() {
        /// Add containerView to contentView
        contentView.addSubview(containerView)
        
        containerView.addSubview(circularImageView)
        containerView.addSubview(nameLabel)
        containerView.addSubview(typeLabel)
        containerView.addSubview(amountLabel)
        containerView.addSubview(dateTileLabel)
        
        /// Set constraints for `containerView`
        NSLayoutConstraint.activate([
            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 2),
            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -2)
        ])
        
        /// Set content hugging and compression resistance priorities for dynamic text layout
        nameLabel.setContentHuggingPriority(.defaultLow, for: .horizontal)
        nameLabel.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        typeLabel.setContentHuggingPriority(.defaultLow, for: .horizontal)
        typeLabel.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        amountLabel.setContentCompressionResistancePriority(.required, for: .horizontal)
        
        NSLayoutConstraint.activate([
            /// Circular Image View constraints
            circularImageView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16),
            circularImageView.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
            circularImageView.widthAnchor.constraint(equalToConstant: 44),
            circularImageView.heightAnchor.constraint(equalToConstant: 44),
            
            /// Name Label constraints
            nameLabel.leadingAnchor.constraint(equalTo: circularImageView.trailingAnchor, constant: 12),
            nameLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 22),
            nameLabel.trailingAnchor.constraint(lessThanOrEqualTo: amountLabel.leadingAnchor, constant: -8),
            
            /// Type Label constraints
            typeLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            typeLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 4),
            typeLabel.trailingAnchor.constraint(lessThanOrEqualTo: dateTileLabel.leadingAnchor, constant: -8),
            typeLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -22),
            
            /// Amount Label constraints
            amountLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16),
            amountLabel.topAnchor.constraint(equalTo: nameLabel.topAnchor),
            
            /// Date Label constraints
            dateTileLabel.trailingAnchor.constraint(equalTo: amountLabel.trailingAnchor),
            dateTileLabel.topAnchor.constraint(equalTo: typeLabel.topAnchor),
            dateTileLabel.bottomAnchor.constraint(lessThanOrEqualTo: containerView.bottomAnchor, constant: -22)
        ])
    }

    func configure(image: UIImage?, name: String, type: String, amount: String, date: String) {
        circularImageView.image = image
        nameLabel.text = name
        typeLabel.text = type
        amountLabel.text = amount
        dateTileLabel.text = date
    }
}
