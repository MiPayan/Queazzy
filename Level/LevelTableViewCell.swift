//
//  LevelTableViewCell.swift
//  Queazzy
//
//  Created by Mickael PAYAN on 29/06/2023.
//

import UIKit

final class LevelTableViewCell: UITableViewCell {
    
    private var viewModel: LevelTableViewCellViewModel?
    private let containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 10
        return view
    }()
    
    private let levelImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: 20)
        label.textColor = .black
        return label
    }()
    
    private let subTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 15, weight: .thin)
        label.textColor = .darkGray
        return label
    }()
    
    private let difficultyLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 15, weight: .semibold)
        label.layer.borderWidth = 1
        label.layer.borderColor = UIColor.black.cgColor
        label.layer.cornerRadius = 5
        label.layer.masksToBounds = true
        label.textAlignment = .center
        label.textColor = .black
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = .clear
        self.selectionStyle = .none
        addSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureLevelCell(with viewModel: LevelTableViewCellViewModel) {
        self.viewModel = viewModel
        containerView.backgroundColor = UIColor(named: viewModel.backgroundColor)
        levelImageView.image = UIImage(named: viewModel.image)
        titleLabel.text = viewModel.title
        subTitleLabel.text = viewModel.subTitle
        difficultyLabel.text = viewModel.difficulty
    }
    
    private func addSubviews() {
        addSubview(containerView)
        containerView.addSubview(levelImageView)
        containerView.addSubview(titleLabel)
        containerView.addSubview(subTitleLabel)
        containerView.addSubview(difficultyLabel)
        
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: topAnchor, constant: 45),
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            containerView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
            
            levelImageView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16),
            levelImageView.centerYAnchor.constraint(equalTo: containerView.topAnchor),
            levelImageView.heightAnchor.constraint(equalToConstant: 90),
            levelImageView.widthAnchor.constraint(equalToConstant: 90),
            
            titleLabel.centerYAnchor.constraint(equalTo: levelImageView.bottomAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16),
            titleLabel.heightAnchor.constraint(equalToConstant: 24),
            
            subTitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 4),
            subTitleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16),
            subTitleLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16),
            subTitleLabel.heightAnchor.constraint(equalToConstant: 19),
            
            difficultyLabel.topAnchor.constraint(equalTo: subTitleLabel.bottomAnchor, constant: 8),
            difficultyLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -8),
            difficultyLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -8)
        ])
    }
}
