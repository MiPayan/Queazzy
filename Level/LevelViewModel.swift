//
//  LevelViewModel.swift
//  Queazzy
//
//  Created by Mickael PAYAN on 29/06/2023.
//

import Foundation
import Combine

final class LevelViewModel {
    
    private let subject = PassthroughSubject<Void, Never>()
    var reloadData: AnyPublisher<Void, Never> {
        subject.eraseToAnyPublisher()
    }
    var cancellables = Set<AnyCancellable>()
    private let levelDataArray: [LevelData] = [
        LevelData(
            backgroundColorName: "ColorPastelGreen",
            title: "Small seed",
            subTitle: "Let’s start checking your knowledge.",
            imageName: "EasyLevel",
            difficulty: "Easy"
        ),
        
        LevelData(
            backgroundColorName: "ColorPastelLightPurple",
            title: "Budding scientist",
            subTitle: "Are you there yet ? Let’s raise the level.",
            imageName: "MediumLevel",
            difficulty: "Medium"
        ),
        
        LevelData(
            backgroundColorName: "ColorPastelPurple",
            title: "Scientist of the nature",
            subTitle: "Unstopable ! We’ll see about that.",
            imageName: "HardLevel",
            difficulty: "Hard"
        )
    ]
    
    var numberOfRowsInSection: Int {
        levelDataArray.count
    }
    
    func makeLevel(at index: Int) -> LevelData {
        levelDataArray[index]
      }
}
