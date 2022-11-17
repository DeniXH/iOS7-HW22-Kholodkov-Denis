//
//  MainViewController.swift
//  iOS7-HW22-Kholodkov Denis
//
//  Created by Денис Холодков on 15.11.2022.
//

import UIKit

protocol InputMainViewProtocol {
    var mainScreenView: OutputMainScreenViewProtocol? { get set }
    var presenter: OutputMainScreenPresenterProtocol? { get set }
}

class MainViewController: UIViewController {

    // MARK: - varibles

    var mainScreenView: OutputMainScreenViewProtocol?
    var presenter: OutputMainScreenPresenterProtocol?


    // MARK: - functions

    func setDelegateAndDataSource() {
        mainScreenView?.mainTableView.dataSource = self
        mainScreenView?.mainTableView.delegate = self
    }



    override func loadView() {
        mainScreenView = MainScreenView()
        view = mainScreenView as? UIView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .cyan
        setDelegateAndDataSource()
    }
}

    // MARK: - extensions

extension MainViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        3
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: MainScreenCell.identifier, for: indexPath) as? MainScreenCell
//        return cell ?? UITableViewCell()
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "aaaaaa" //names[indexPath.row]
        return cell
    }
}
