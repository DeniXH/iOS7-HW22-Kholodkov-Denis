//
//  MainScreenView.swift
//  iOS7-HW22-Kholodkov Denis
//
//  Created by Денис Холодков on 16.11.2022.
//

import UIKit

protocol OutputMainScreenViewProtocol {
    var mainTableView: UITableView { get set }
    var mainButton: UIButton { get set }
    var mainTextField: UITextField { get set }
    func addCell()
}

class MainScreenView: UIView {

     // MARK: - UI Elements

     lazy var mainTextField: UITextField = {
        let mainTextField = UITextField()
        mainTextField.textAlignment = .center
        mainTextField.backgroundColor = .white
        mainTextField.textColor = .orange
        mainTextField.layer.cornerRadius = 16
        mainTextField.translatesAutoresizingMaskIntoConstraints = false
        return mainTextField
    }()

     lazy var mainButton: UIButton = {
        let mainButton = UIButton()
        mainButton.setTitle("Add Cell", for: .normal)
        mainButton.backgroundColor = .white
        mainButton.setTitleColor(.black, for: .normal)
        mainButton.layer.cornerRadius = 16
        mainButton.translatesAutoresizingMaskIntoConstraints = false
        return mainButton
    }()

     lazy var mainTableView: UITableView = {
        let mainTableView = UITableView(frame: .zero, style: .plain)
        mainTableView.backgroundColor = .white
         mainTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
         mainTableView.layer.cornerRadius = 16
         mainTableView.backgroundColor = .cyan
        mainTableView.translatesAutoresizingMaskIntoConstraints = false
        return mainTableView
    }()

    // MARK: - init

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupHierarchy()
        setupLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - functions

    private func setupHierarchy() {
        addSubview(mainTextField)
        addSubview(mainButton)
        addSubview(mainTableView)
    }

    @objc func addCell(word: String, complition: () -> Void) {}

    private func setupLayout() {
        NSLayoutConstraint.activate([
            mainTextField.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            mainTextField.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20),
            mainTextField.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20),
            mainTextField.heightAnchor.constraint(equalToConstant: 60),

            mainButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 100),
            mainButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20),
            mainButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20),
            mainButton.heightAnchor.constraint(equalToConstant: 60),

            mainTableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 180),
            mainTableView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20),
            mainTableView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20),
            mainTableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: 40)
        ])
    }
}
