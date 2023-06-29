//
//  QuizzTableViewCellViewModel.swift
//  Queazzy
//
//  Created by Mickael PAYAN on 29/06/2023.
//

import Foundation
import Combine

final class QuizzTableViewCellViewModel {
    
    private let quizzLoader: QuizzLoader
    private var results = [ResultResponse]()
    var cancellables = Set<AnyCancellable>()
    
    init(quizzLoader: QuizzLoader = .init()) {
        self.quizzLoader = quizzLoader
    }

    func loadEasyQuizz(_ difficulty: Difficulty) {
        quizzLoader.loadQuizz(with: difficulty)
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
            }
            .store(in: &cancellables)
    }
}
