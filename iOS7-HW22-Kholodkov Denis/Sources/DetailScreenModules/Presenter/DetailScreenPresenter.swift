//
//  DetailScreenPresenter.swift
//  iOS7-HW22-Kholodkov Denis
//
//  Created by Денис Холодков on 22.11.2022.
//

import Foundation

protocol OutputDetailScreenPresenterProtocol: Any {
    var user: User? { get set }
    func readDataUser()
    func changeDataUser()
}

class DetailScreenPresenter: OutputDetailScreenPresenterProtocol {

    // MARK: - Varibles
    var view: DetailViewController?
    var user: User?
    var isEdit = true

    // MARK: - Functions
    func readDataUser() {
        if let user = user {
            view?.detailScreenView.detailUserName.text = user.fullName
            view?.detailScreenView.datePicker.date = user.birthDay ?? Date()
            view?.detailScreenView.detailGenderTextField.text = user.gender
        }
    }

    func changeDataUser() {
        if isEdit {
            view?.detailScreenView.detailUserName.isEnabled = true
            view?.detailScreenView.datePicker.isEnabled  = true
            view?.detailScreenView.detailGenderTextField.isEnabled = true
            view?.detailScreenView.rightButtonItem.title = MetricStrings.buttonSaveTitle

            isEdit = false
        } else if !isEdit {
            view?.detailScreenView.rightButtonItem.title = MetricStrings.buttonEditTitle
            view?.detailScreenView.detailUserName.isEnabled = false
            view?.detailScreenView.datePicker.isEnabled  = false
            view?.detailScreenView.detailGenderTextField.isEnabled = false

            isEdit = true
            if user == nil {
                user = User()
            }
            
            if let user = user {
                user.fullName = view?.detailScreenView.detailUserName.text
                user.birthDay = view?.detailScreenView.datePicker.date
                user.gender = view?.detailScreenView.detailGenderTextField.text
                CoreDataManager.instance.saveContext()
            }
        }
    }
}

// MARK: - Extension
extension DetailScreenPresenter {

    enum MetricStrings {
        static let buttonEditTitle = "Edit"
        static let buttonSaveTitle = "Save"

    }
}
