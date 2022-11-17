//
//  MainScreenCell.swift
//  iOS7-HW22-Kholodkov Denis
//
//  Created by Денис Холодков on 16.11.2022.
//

import UIKit

protocol mainCellProtocol {

}

class MainScreenCell: UITableViewCell {

    // MARK: - Varibles

    static let identifier = "MainScreenCell"

    private lazy var mainTableLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 12)
        label.text = "AAAAAAAAA"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    // MARK: - initializers
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: MainScreenCell.identifier)
        backgroundColor = .white
        setupHierarchy()
        setupLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupHierarchy() {
        addSubview(mainTableLabel)
    }

    // MARK: - Layout settings
    private func setupLayout() {
        NSLayoutConstraint.activate([
            mainTableLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            mainTableLabel.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            mainTableLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5),
            mainTableLabel.heightAnchor.constraint(equalToConstant: 15)
        ])
    }
}
