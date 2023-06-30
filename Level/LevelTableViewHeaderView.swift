//
//  LevelTableViewHeaderView.swift
//  Queazzy
//
//  Created by Mickael PAYAN on 30/06/2023.
//

import UIKit

final class LevelTableViewHeaderView: UITableViewHeaderFooterView {
    
    private let headerLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Science and nature"
        label.font = .boldSystemFont(ofSize: 26)
        label.textColor = UIColor(named: "ColorHeader")
        return label
    }()
    
    private let subHeaderLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Try to answer all questions correctly."
        label.font = .systemFont(ofSize: 15, weight: .thin)
        label.textColor = UIColor(named: "ColorSubHeader")
        return label
    }()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        addSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubviews() {
        addSubview(headerLabel)
        addSubview(subHeaderLabel)
        NSLayoutConstraint.activate([
            headerLabel.topAnchor.constraint(equalTo: topAnchor),
            headerLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            headerLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            headerLabel.heightAnchor.constraint(equalToConstant: 30),
            
            subHeaderLabel.topAnchor.constraint(equalTo: headerLabel.bottomAnchor),
            subHeaderLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            subHeaderLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            subHeaderLabel.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
