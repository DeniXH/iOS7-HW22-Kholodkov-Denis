//
//  DetailViewController.swift
//  iOS7-HW22-Kholodkov Denis
//
//  Created by Денис Холодков on 22.11.2022.
//

import UIKit

protocol OutputDetailViewControllerProtocol: Any {
    var presenter: OutputDetailScreenPresenterProtocol? { get set }
}

class DetailViewController: UIViewController, OutputDetailScreenViewProtocol {

    // MARK: - varibles
    var detailScreenView = DetailScreenView()
    var presenter: OutputDetailScreenPresenterProtocol?

    // MARK: - LifeCicle
    override func loadView() {
        view = detailScreenView
    }

    init(presenter: OutputDetailScreenPresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.rightBarButtonItem = detailScreenView.rightButtonItem
        setDelegateAndDataSource()
        presenter?.readDataUser()
    }

    // MARK: - Functions
    func setDelegateAndDataSource() {
        detailScreenView.rightButtonItem.action = #selector(rightButtonTapped)
        detailScreenView.rightButtonItem.target = self
    }

    @objc func rightButtonTapped() {
        presenter?.changeDataUser()
    }
}
