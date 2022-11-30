//
//  MainScreenPresenter.swift
//  iOS7-HW22-Kholodkov Denis
//
//  Created by Денис Холодков on 17.11.2022.
//

import Foundation
import CoreData
import UIKit

protocol InputMainScreenPresenterProtocol {
    var mainViewController: MainViewController? { get set }
}

protocol OutputMainScreenPresenterProtocol {
    var user: User? { get set }
    var fetchResultController: NSFetchedResultsController<NSFetchRequestResult> { get set }
    func addUser()
    func perform()
}

class MainScreenPresenter:  NSObject, InputMainScreenPresenterProtocol, OutputMainScreenPresenterProtocol {

    // MARK: - varibles
    var mainViewController: MainViewController?
    var user: User?
    var fetchResultController = CoreDataManager.instance.fetchResultController(entityName: "User", sortName: "fullName")

    // MARK: - Initialization
    init(mainViewController: MainViewController?) {
        super.init()
        fetchResultController.delegate = self
        self.mainViewController = mainViewController
    }

    // MARK: - functions
    func perform() {
        do {
            try fetchResultController.performFetch()
        } catch {
            print(error)
        }
    }

    func addUser() {
        if mainViewController?.mainScreenView.mainTextField.text != "" {
            guard let text = mainViewController?.mainScreenView.mainTextField.text else { return }
            if user == nil {
                user = User()
            }
            if let user = user {
                user.fullName = text
                CoreDataManager.instance.saveContext()
                mainViewController?.mainScreenView.mainTextField.text = nil
                mainViewController?.mainScreenView.mainTextField.becomeFirstResponder()
                self.user = nil
            }
        }
    }
}

// MARK: - extensions
extension MainScreenPresenter: NSFetchedResultsControllerDelegate {

    func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        mainViewController?.mainScreenView.mainTableView.beginUpdates()
    }

    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        switch type {
        case .insert:
            if let indexPath = newIndexPath {
                mainViewController?.mainScreenView.mainTableView.insertRows(at: [indexPath], with: .automatic)
            }

        case .update:
            if let indexPath = indexPath {
                let user = fetchResultController.object(at: indexPath) as? User
                let cell = mainViewController?.mainScreenView.mainTableView.cellForRow(at: indexPath)
                cell?.textLabel?.text = user?.fullName
            }

        case .move:
            if let indexPath = indexPath {
                mainViewController?.mainScreenView.mainTableView.deleteRows(at: [indexPath], with: .automatic)
            }
            if let indexPath = newIndexPath {
                mainViewController?.mainScreenView.mainTableView.insertRows(at: [indexPath], with: .automatic)
            }

        case .delete:
            if let indexPath = indexPath {
                mainViewController?.mainScreenView.mainTableView.deleteRows(at: [indexPath], with: .automatic)
            }

        default:
            break
        }
    }

    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        mainViewController?.mainScreenView.mainTableView.endUpdates()
    }
}
