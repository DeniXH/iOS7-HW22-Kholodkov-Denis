//
//  Separator.swift
//  iOS7-HW22-Kholodkov Denis
//
//  Created by Денис Холодков on 28.11.2022.
//

import UIKit

final class Separator: UIView {

    init() {
        super.init(frame: .zero)
        setupSeparator()
        setupLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupSeparator() {
        backgroundColor = .separator
        translatesAutoresizingMaskIntoConstraints = false
    }

    private func setupLayout() {
        NSLayoutConstraint.activate([
            heightAnchor.constraint(equalToConstant: 2)
        ])
    }
}
