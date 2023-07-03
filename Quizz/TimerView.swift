//
//  TimerView.swift
//  Queazzy
//
//  Created by Mickael PAYAN on 03/07/2023.
//

import UIKit

final class TimerView: UIView {
    
    private var seconds = 10
    private var timer = Timer()
    private var isTimerRunning = false
    
    private let timerLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
}
