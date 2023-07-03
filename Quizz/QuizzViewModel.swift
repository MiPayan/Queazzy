//
//  QuizzViewModel.swift
//  Queazzy
//
//  Created by Mickael PAYAN on 03/07/2023.
//

import Foundation
import Combine

final class QuizzViewModel {
    
    private let loader: QuizzLoader
    var results = [ResultResponse]()
    private var levelData: LevelData
    var cancellables = Set<AnyCancellable>()
    let subject = PassthroughSubject<Void, Never>()
    
    init(loader: QuizzLoader = .init(), levelData: LevelData) {
        self.loader = loader
        self.levelData = levelData
    }
    
    var backgroundColor: String {
        levelData.backgroundColorName
    }
    
    var question: String {
        results.first?.question ?? "NoData"
    }
    
    func loadQuizzByLevel() {
        if levelData.difficulty == "Easy" {
            loadQuizz(.easy)
        } else if levelData.difficulty == "Medium" {
            loadQuizz(.medium)
        } else {
            loadQuizz(.hard)
        }
    }
    
    private func loadQuizz(_ difficulty: Difficulty) {
        loader.loadQuizz(with: difficulty)
            .sink { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    print(error)
                }
            } receiveValue: { [weak self] response in
                guard let self else { return }
                results = response.results
                subject.send()
            }
            .store(in: &cancellables)
    }
}
