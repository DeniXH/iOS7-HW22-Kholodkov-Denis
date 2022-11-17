//
//  MainScreenPresenter.swift
//  iOS7-HW22-Kholodkov Denis
//
//  Created by Денис Холодков on 17.11.2022.
//

import Foundation

protocol InputMainScreenPresenterProtocol {
}

protocol OutputMainScreenPresenterProtocol {
    var usersArray: [String]? { get set }
}

class MainScreenPresenter: OutputMainScreenPresenterProtocol {

    // MARK: - varibles

    var usersArray: [String]?

    // MARK: - functions
    
    private func addUser(user: String) {
        usersArray?.append(user)
    }
}
