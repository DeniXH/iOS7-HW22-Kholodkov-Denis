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

protocol InputMainViewProtocol {
  //  var mainScreenView: OutputMainScreenViewProtocol? { get set }
    var presenter: OutputMainScreenPresenterProtocol? { get set }
}

class MainViewController: UIViewController {

    // MARK: - varibles

   // var mainScreenView: OutputMainScreenViewProtocol?
    var viewBefore = ViewBeforeStart()
    var mainScreenView = MainScreenView()
    var presenter: OutputMainScreenPresenterProtocol?
    var a = ""

    var usersArray = [String]()

    // TODO: - сделать в init массив с пользователями, а не просто по середине кода

    // MARK: - LifeCycle

    override func loadView() {
//        mainScreenView = MainScreenView() as? OutputMainScreenViewProtocol
         //as? UIView
       view = viewBefore
        DispatchQueue.main.async {
            let player = AVPlayer(url: URL(fileURLWithPath: Bundle.main.path(forResource: "french", ofType: "mov")!))
            let layer = AVPlayerLayer(player: player)
            layer.frame = self.view.bounds
            layer.videoGravity = .resizeAspectFill
            player.volume = 3
            self.view.layer.addSublayer(layer)
            player.play()

        }
    }

// MARK: make by player
//        let viewPlayer = AVPlayerViewController()
//        viewPlayer.player = player
//        present(viewPlayer, animated: true)

    override func viewDidLoad() {
        super.viewDidLoad()
        DispatchQueue.main.asyncAfter(deadline: .now() + 3){

            self.view = self.mainScreenView
            self.view.backgroundColor = .white
            self.setNavigationController()
            self.setCoreData()
            self.UIElementsSettings()
        }
    }

    // MARK: - function for set CoreData

    func setCoreData() {
// ниже уже после добваления conveinence init в файле User+CoreDataClass
        let managedObject = User()

        // Установка значений атрибутов,  до создания 2-х классов через Editor\ Create NSManagedObject Subclass
//        managedObject.setValue("Oleg", forKey: "name")
//        managedObject.setValue("Borisov", forKey: "lastName")
        managedObject.name = "Oleg"
        managedObject.lastName = "Borisov"

        // Извлекаем значения атрибута, до создания 2-х классов через Editor\ Create NSManagedObject Subclass
//        let name = managedObject.value(forKey: "name")
//        let lastName = managedObject.value(forKey: "lastName")
        let name = managedObject.name
        let lastName = managedObject.lastName

        print("\(String(describing: name))\n\(String(describing: lastName))")

        // Сохранение данных, используется если НЕ создавать Manager
       // appDelegate?.saveContext()
        CoreDataManager.instance.saveContext()

        // Извлекаем данные
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "User")
        do { // TODO: убрать force unwrap
            let results = try CoreDataManager.instance.context.fetch(fetchRequest)
//            for result in results as! [NSManagedObject] { // MARK: - извлечение до создания 2-х классов
//                print("name - \(result.value(forKey: "name")!), lastName - \(result.value(forKey: "lastName")!)")
//            }
            for result in results as! [User] {
                print("name - \(String(describing: result.name)), lastName - \(String(describing: result.lastName))")
            }
        } catch {
            print(error)
        }

        // Удаление всех записей
        do {
            let results = try CoreDataManager.instance.context.fetch(fetchRequest)
            for result in results as! [NSManagedObject] {
                CoreDataManager.instance.context.delete(result)
            }
        } catch {
         print(error)
        }

        // Обязательно нужно сохранять
        CoreDataManager.instance.saveContext()
    }

    // MARK: - functions

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



        guard let inputText = mainScreenView.mainTextField.text else { return }
        //a = inputText
        usersArray.append(inputText)
        presenter?.addUser(user: inputText)

        let indexPath = IndexPath(row: usersArray.count - 1, section: 0)

        print ("\(inputText)")
        mainScreenView.mainTableView.beginUpdates()
            mainScreenView.mainTableView.insertRows(at: [indexPath], with: .automatic)
        mainScreenView.mainTableView.endUpdates()

        mainScreenView.mainTextField.text = "" // эта строчка делает пустой текстовое поле
        view.endEditing(true) // не понял зачем эта строчка
    }
}

    // MARK: - extensions

extension MainViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        usersArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = usersArray[indexPath.row]
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let navigationController = navigationController else { return }
        navigationController.pushViewController(DetailViewController(), animated: true)
    }

    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {

        if editingStyle == .delete {
            usersArray.remove(at: indexPath.row)

            tableView.beginUpdates()
            tableView.deleteRows(at: [indexPath], with: .automatic)
            tableView.endUpdates()
        }
    }
}
