//
//  LevelViewController.swift
//  QuizzApp
//
//  Created by Mickael PAYAN on 28/06/2023.
//

import UIKit
import Combine

final class LevelViewController: UIViewController {
    
    private let levelViewModel = LevelViewModel()
    private lazy var levelTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(LevelTableViewCell.self, forCellReuseIdentifier: "LevelCell")
        tableView.separatorStyle = .none
        tableView.dataSource = self
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        addSubviews()
    }
    
    func addSubviews() {
        self.view.addSubview(levelTableView)
        NSLayoutConstraint.activate([
            levelTableView.topAnchor.constraint(equalTo: view.topAnchor),
            levelTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            levelTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            levelTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

extension LevelViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        levelViewModel.levelDataCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "LevelCell", for: indexPath) as? LevelTableViewCell else { return UITableViewCell() }
        let levelCellData = levelViewModel.getCellData(at: indexPath.row)
        let levelTableViewCellViewModel = LevelTableViewCellViewModel(levelCellData: levelCellData)
        cell.configureLevelCell(with: levelTableViewCellViewModel)
        return cell
    }
}
