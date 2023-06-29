//
//  Networking.swift
//  Queazzy
//
//  Created by Mickael PAYAN on 29/06/2023.
//

import Foundation
import Combine

final class Networking {
    
    private var configuration: URLSessionConfiguration {
        let configuration = URLSessionConfiguration.default
        configuration.allowsCellularAccess = true
        configuration.allowsConstrainedNetworkAccess = true
        return configuration
    }
    
    func fetchData(with urlString: String) -> AnyPublisher<QuizzResponse, Error> {
        guard let url = URL(string: urlString) else {
            return Fail(error: URLError(.badURL)).eraseToAnyPublisher()
        }
        
        let session = URLSession(configuration: configuration)
        let decoder = JSONDecoder()
        
        return session.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: QuizzResponse.self, decoder: decoder)
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
