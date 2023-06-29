//
//  QuizzLoader.swift
//  Queazzy
//
//  Created by Mickael PAYAN on 29/06/2023.
//

import Foundation
import Combine

final class QuizzLoader {
    
    private let session: Networking
    private let endPoint = "https://opentdb.com/api.php?amount=10&category=17"
    
    init(session: Networking = .init()) {
        self.session = session
    }
    
    func loadQuizz(with difficulty: Difficulty) -> AnyPublisher<QuizzResponse, Error> {
        let urlString = "\(endPoint)&difficulty=\(difficulty)&type=multiple"
        return session.fetchData(with: urlString)
    }
}
