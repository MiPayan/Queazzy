//
//  QuizzViewController.swift
//  QuizzApp
//
//  Created by Mickael PAYAN on 28/06/2023.
//

import UIKit

final class QuizzViewController: UIViewController {
    
    private lazy var quizzTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .brown
    }
    
    
}
