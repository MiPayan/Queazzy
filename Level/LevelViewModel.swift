//
//  LevelViewModel.swift
//  Queazzy
//
//  Created by Mickael PAYAN on 29/06/2023.
//

import Foundation
import Combine

final class LevelViewModel {
    
    private let levelDataArray: [LevelData] = [
        LevelData(
            backgroundColorName: "ColorPastelGreen",
            title: "Small seed",
            subTitle: "Let’s start checking your knowledge",
            imageName: "EasyLevel",
            difficulty: "Easy"
        ),
        
        LevelData(
            backgroundColorName: "ColorPastelBlue",
            title: "Budding scientist",
            subTitle: "Are you there yet? Let’s raise the level.",
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
    
    var levelDataCount: Int {
        levelDataArray.count
    }
    
    func getCellData(at index: Int) -> LevelData {
        levelDataArray[index]
      }
}
