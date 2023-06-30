//
//  CheckpointViewModel.swift
//  Queazzy
//
//  Created by Mickael PAYAN on 30/06/2023.
//

import Foundation
import Combine

final class CheckpointViewModel {
    
    private let loader: QuizzLoader
    private var results: ResultResponse?
    var levelData: LevelData
    var cancellables = Set<AnyCancellable>()
    
    init(loader: QuizzLoader = .init(), levelData: LevelData) {
        self.loader = loader
        self.levelData = levelData
    }
        
    var backGroundColor: String {
        levelData.backgroundColorName
    }
    
    var title: String {
        levelData.title
    }
    
    var subTitle: String {
        levelData.subTitle
    }
    
    var image: String {
        levelData.imageName
    }
    
    var difficulty: String {
        levelData.difficulty
    }
    
    func loadQuizz(_ difficulty: Difficulty) {
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
                results = response.results.first
            }
            .store(in: &cancellables)
    }
}
