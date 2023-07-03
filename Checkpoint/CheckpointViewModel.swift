//
//  CheckpointViewModel.swift
//  Queazzy
//
//  Created by Mickael PAYAN on 30/06/2023.
//

import Foundation
import Combine

final class CheckpointViewModel {
    
    var levelData: LevelData
    
    init(levelData: LevelData) {
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
}
