//
//  CheckpointViewController.swift
//  Queazzy
//
//  Created by Mickael PAYAN on 30/06/2023.
//

import UIKit
import Combine

final class CheckpointViewController: UIViewController {
    
    var checkpointViewModel: CheckpointViewModel?
    private var dataLoadedCancellable: AnyCancellable?
    private let levelImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let descriptionPhraseLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
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
    
    private lazy var startGameButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor(named: "ColorBackgroundButton")
        button.layer.cornerRadius = 10
        button.makeShadow()
        button.makeBorder()
        button.setTitle("Start", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 18, weight: .semibold)
        button.addTarget(self, action: #selector(didTapStartGameButton), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        configureViewModel()
    }
    
    @objc func didTapStartGameButton() {
        guard let checkpointViewModel else { return }
        let levelData = checkpointViewModel.levelData
        let quizzViewModel = QuizzViewModel(levelData: levelData)
        let quizzViewController = QuizzViewController()
        quizzViewController.quizzViewModel = quizzViewModel
        self.navigationController?.pushViewController(quizzViewController, animated: true)
    }
}

private extension CheckpointViewController {
    func configureViewModel() {
        guard let checkpointViewModel else { return }
        self.view.backgroundColor = UIColor(named: checkpointViewModel.backGroundColor)
        levelImageView.image = UIImage(named: checkpointViewModel.image)
        titleLabel.text = checkpointViewModel.title
        subTitleLabel.text = checkpointViewModel.subTitle
        difficultyLabel.text = checkpointViewModel.difficulty
    }
    
    func addSubviews() {
        view.addSubview(levelImageView)
        view.addSubview(titleLabel)
        view.addSubview(subTitleLabel)
        view.addSubview(difficultyLabel)
        view.addSubview(startGameButton)
        NSLayoutConstraint.activate([
            levelImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 32),
            levelImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            levelImageView.heightAnchor.constraint(equalToConstant: 200),
            levelImageView.widthAnchor.constraint(equalToConstant: 200),
            
            titleLabel.topAnchor.constraint(equalTo: levelImageView.bottomAnchor, constant: 32),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            titleLabel.heightAnchor.constraint(equalToConstant: 24),
            
            subTitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 4),
            subTitleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            subTitleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            subTitleLabel.heightAnchor.constraint(equalToConstant: 19),
            
            difficultyLabel.topAnchor.constraint(equalTo: subTitleLabel.bottomAnchor, constant: 16),
            difficultyLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8),
            difficultyLabel.heightAnchor.constraint(equalToConstant: 21),
            
            startGameButton.topAnchor.constraint(equalTo: difficultyLabel.bottomAnchor, constant: 32),
            startGameButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            startGameButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32),
            startGameButton.bottomAnchor.constraint(greaterThanOrEqualTo: difficultyLabel.bottomAnchor),
            startGameButton.heightAnchor.constraint(equalToConstant: 47)
        ])
    }
}
