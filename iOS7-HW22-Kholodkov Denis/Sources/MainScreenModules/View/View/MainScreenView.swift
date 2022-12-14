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
        mainTextField.backgroundColor = .systemGray5
        mainTextField.placeholder = MetricStrings.placeholder
        mainTextField.borderStyle = .roundedRect
        mainTextField.layer.cornerRadius = Metric.cornerRadius
        mainTextField.translatesAutoresizingMaskIntoConstraints = false
        return mainTextField
    }()

    lazy var mainButton: UIButton = {
        let mainButton = UIButton()
        mainButton.setTitle(MetricStrings.titleButton, for: .normal)
        mainButton.backgroundColor = .systemBlue
        mainButton.setTitleColor(.white, for: .normal)
        mainButton.layer.cornerRadius = Metric.cornerRadius
        mainButton.translatesAutoresizingMaskIntoConstraints = false
        return mainButton
    }()


    lazy var mainTableView: UITableView = {
        let mainTableView = UITableView(frame: .zero, style: .insetGrouped)
        mainTableView.backgroundColor = .systemGray5
        mainTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        mainTableView.layer.cornerRadius = Metric.cornerRadius
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
            mainTextField.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: Metric.insetTwenty),

                       mainTextField.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: Metric.insetTwenty),
                       mainTextField.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: Metric.insetMinusTwenty),
                       mainTextField.heightAnchor.constraint(equalToConstant: Metric.insetHeight),

                       mainButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: Metric.insetTopMainButton),
                       mainButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: Metric.insetTwenty),
                       mainButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: Metric.insetMinusTwenty),
                       mainButton.heightAnchor.constraint(equalToConstant: Metric.insetHeight),

                       mainTableView.topAnchor.constraint(equalTo: mainButton.bottomAnchor, constant: Metric.insetTopMainTableView),
                       mainTableView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
                       mainTableView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
                       mainTableView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}

extension MainScreenView {

    enum Metric {
        static let cornerRadius: CGFloat = 14
        static let insetTopMainButton: CGFloat = 100
        static let insetTopMainTableView: CGFloat = 30
        static let insetTwenty: CGFloat = 20
        static let insetMinusTwenty: CGFloat = -20
        static let insetHeight: CGFloat = 60
    }

    enum MetricStrings {
        static let placeholder = "Print your name here"
        static let titleButton = "Add user"
    }
}
