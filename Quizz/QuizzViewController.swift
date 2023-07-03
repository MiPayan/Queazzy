//
//  QuizzViewController.swift
//  Queazzy
//
//  Created by Mickael PAYAN on 03/07/2023.
//

import UIKit
import Combine

final class QuizzViewController: UIViewController {
    
    var quizzViewModel: QuizzViewModel?
    private let timerView: UIView = {
        let view = TimerView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let questionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = .boldSystemFont(ofSize: 20)
        label.textColor = .black
        return label
    }()
    
    private let totalQuestionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Questions 1 of 1O"
        label.font = .systemFont(ofSize: 15, weight: .thin)
        label.textAlignment = .center
        return label
    }()
    
    private let answersStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.backgroundColor = .clear
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .equalSpacing
        stackView.spacing = 16
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        addSubviews()
        bindViewModel()
        quizzViewModel?.loadQuizzByLevel()
    }
    
    private func bindViewModel() {
        guard let quizzViewModel else { return }
        quizzViewModel.subject
            .sink { [weak self] in
                guard let self else { return }
                view.backgroundColor = UIColor(named: quizzViewModel.backgroundColor)
                questionLabel.text = quizzViewModel.question
                makeAnswerButtons()
            }
            .store(in: &quizzViewModel.cancellables)
    }
    
    private func makeAnswerButtons() {
        guard let quizzViewModel else { return }
        
        for arrangedSubview in answersStackView.arrangedSubviews {
            answersStackView.removeArrangedSubview(arrangedSubview)
            arrangedSubview.removeFromSuperview()
        }
        
        let results = quizzViewModel.results.prefix(4)
        for result in results {
            let button = UIButton(type: .system)
            button.translatesAutoresizingMaskIntoConstraints = false
            button.backgroundColor = UIColor(named: "ColorBackgroundButton")
            button.layer.cornerRadius = 10
            button.makeShadow()
            button.makeBorder()
            button.setTitle(result.correctAnswer, for: .normal)
            button.setTitleColor(.black, for: .normal)
            button.titleLabel?.font = .systemFont(ofSize: 15, weight: .semibold)
            button.addTarget(self, action: #selector(answerButtonTapped), for: .touchUpInside)
            answersStackView.addArrangedSubview(button)
            
            button.leadingAnchor.constraint(equalTo: answersStackView.leadingAnchor).isActive = true
            button.trailingAnchor.constraint(equalTo: answersStackView.trailingAnchor).isActive = true
            button.heightAnchor.constraint(equalToConstant: 47).isActive = true
        }
    }
    
    @objc private func answerButtonTapped() {
        
    }
    
    private func addSubviews() {
        view.addSubview(questionLabel)
        view.addSubview(totalQuestionLabel)
        view.addSubview(answersStackView)
        
        NSLayoutConstraint.activate([
            questionLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            questionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            questionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            totalQuestionLabel.topAnchor.constraint(equalTo: questionLabel.bottomAnchor, constant: 8),
            totalQuestionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            totalQuestionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            totalQuestionLabel.heightAnchor.constraint(equalToConstant: 19),
            
            answersStackView.topAnchor.constraint(equalTo: totalQuestionLabel.bottomAnchor, constant: 16),
            answersStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            answersStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
        ])
    }
}
