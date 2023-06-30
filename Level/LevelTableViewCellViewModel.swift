//
//  LevelTableViewCellViewModel.swift
//  Queazzy
//
//  Created by Mickael PAYAN on 29/06/2023.
//

import Foundation
import UIKit

final class LevelTableViewCellViewModel {
    
    private let levelData: LevelData
    
    init(levelCellData: LevelData) {
        self.levelData = levelCellData
    }
    
    var backgroundColor: String {
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
