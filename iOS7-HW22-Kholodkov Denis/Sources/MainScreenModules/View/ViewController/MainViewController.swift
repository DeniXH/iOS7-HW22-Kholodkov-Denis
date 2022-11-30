//
//  MainViewController.swift
//  iOS7-HW22-Kholodkov Denis
//
//  Created by Денис Холодков on 15.11.2022.
//

import UIKit
import CoreData
import AVKit
import AVFoundation

protocol InputMainViewProtocol: Any {
      var presenter: OutputMainScreenPresenterProtocol? { get set }
}

class MainViewController: UIViewController, InputMainViewProtocol {

    // MARK: - varibles
    var viewBefore = ViewBeforeStart()
    var mainScreenView = MainScreenView()
    var presenter: OutputMainScreenPresenterProtocol?

    // MARK: - LifeCycle
    override func loadView() {
        view = viewBefore
        DispatchQueue.main.async {
            self.videoGo()
        }
    }

    // MARK: make video by player
    //        let viewPlayer = AVPlayerViewController()
    //        viewPlayer.player = player
    //        present(viewPlayer, animated: true)

    override func viewDidLoad() {
        super.viewDidLoad()
        DispatchQueue.main.asyncAfter(deadline: .now() + 3){
            self.view = self.mainScreenView
            self.view.backgroundColor = .white
            self.setNavigationController()
            self.UIElementsSettings()
            self.presenter?.perform()
        }
    }

    init() {
        super.init(nibName: nil, bundle: nil)
        self.presenter = MainScreenPresenter(mainViewController: self)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - functions
    func videoGo() {
        let player = AVPlayer(url: URL(fileURLWithPath: Bundle.main.path(forResource: "french", ofType: "mov")!))
        let layer = AVPlayerLayer(player: player)
        layer.frame = self.view.bounds
        layer.videoGravity = .resizeAspectFill
        player.volume = 3
        self.view.layer.addSublayer(layer)
        player.play()
    }

    func setDelegateAndDataSource() {
        mainScreenView.mainTableView.dataSource = self
        mainScreenView.mainTableView.delegate = self
    }

    func setNavigationController() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .always
        navigationItem.title = "Users"
    }

    func UIElementsSettings() {
        setDelegateAndDataSource()
        mainScreenView.mainButton.addTarget(self, action: #selector(addCellToTable), for: .touchUpInside)

    }

    @objc func addCellToTable() {
        presenter?.addUser()
    }
}

// MARK: - extensions
extension MainViewController: UITableViewDataSource, UITableViewDelegate {

    func numberOfSections(in tableView: UITableView) -> Int {
        presenter?.fetchResultController.sections?.count ?? 0
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let sections = presenter?.fetchResultController.sections {
            return sections[section].numberOfObjects
        } else {
            return 0
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let user = presenter?.fetchResultController.object(at: indexPath) as? User
        cell.accessoryType = .disclosureIndicator
        cell.textLabel?.text = user?.fullName
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailPresenter = DetailScreenPresenter()
        let detailViewController = DetailViewController(presenter: detailPresenter)
        detailPresenter.view = detailViewController // передача в новый контроллер view
        tableView.deselectRow(at: indexPath, animated: true)
        let user = presenter?.fetchResultController.object(at: indexPath) as? User
        detailViewController.presenter?.user = user
        navigationController?.pushViewController(detailViewController, animated: true)
    }

    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {

        if editingStyle == .delete {
            let user = presenter?.fetchResultController.object(at: indexPath) as? User ?? User()
            CoreDataManager.instance.context.delete(user)
            CoreDataManager.instance.saveContext()
        }
    }
}
