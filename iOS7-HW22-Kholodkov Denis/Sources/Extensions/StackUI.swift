//
//  StackUI.swift
//  iOS7-HW22-Kholodkov Denis
//
//  Created by Денис Холодков on 29.11.2022.
//

import UIKit

final class StackUI: UIStackView {

    init(axis: NSLayoutConstraint.Axis, spacing: CGFloat) {
        super.init(frame: .zero)
        setupImageIcon(axis: axis, spacing: spacing)
    }

    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupImageIcon(axis: NSLayoutConstraint.Axis, spacing: CGFloat) {
        self.axis = axis
        self.spacing = spacing
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}
