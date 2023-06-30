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
        tableView.register(LevelTableViewHeaderView.self, forHeaderFooterViewReuseIdentifier: "LevelHeader")
        tableView.separatorStyle = .none
        tableView.backgroundColor = UIColor(named: "ColorTableViewBackground")
        tableView.dataSource = self
        tableView.delegate = self
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
    }
    
    private func addSubviews() {
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
        levelViewModel.numberOfRowsInSection
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "LevelCell", for: indexPath) as? LevelTableViewCell else { return UITableViewCell() }
        let levelCellData = levelViewModel.makeLevel(at: indexPath.row)
        let levelTableViewCellViewModel = LevelTableViewCellViewModel(levelData: levelCellData)
        cell.configureLevelCell(with: levelTableViewCellViewModel)
        
        return cell
    }
}

extension LevelViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let headerView = tableView.dequeueReusableHeaderFooterView(
            withIdentifier: "LevelHeader"
        ) as? LevelTableViewHeaderView else {
            return UIView()
        }
        return headerView
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedLevel = levelViewModel.makeLevel(at: indexPath.row)
        let checkpointViewController = CheckpointViewController()
        let checkpointViewModel = CheckpointViewModel(levelData: selectedLevel)
        checkpointViewController.checkpointViewModel = checkpointViewModel
        tableView.deselectRow(at: indexPath, animated: true)
        self.present(checkpointViewController, animated: true)
    }
}
