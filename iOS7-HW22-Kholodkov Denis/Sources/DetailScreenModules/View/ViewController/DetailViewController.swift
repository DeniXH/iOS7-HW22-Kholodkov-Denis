//
//  DetailViewController.swift
//  iOS7-HW22-Kholodkov Denis
//
//  Created by Денис Холодков on 22.11.2022.
//

import UIKit

protocol InputDetailViewControllerProtocol {
    
}

class DetailViewController: UIViewController {

    var detailScreenView = DetailScreenView()
    var presenter: OutputDetailScreenPresenterProtocol?

    override func loadView() {
        view = detailScreenView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.rightBarButtonItem = detailScreenView.rightButtonItem
    }
}
