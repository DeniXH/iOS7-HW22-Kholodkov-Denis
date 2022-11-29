//
//  TextFieldWithPadding.swift
//  iOS7-HW22-Kholodkov Denis
//
//  Created by Денис Холодков on 23.11.2022.
//

import UIKit

// MARK: this class make padding for TextField

class TextFieldWithPadding: UITextField {
    var textPadding = UIEdgeInsets(
        top: 0,
        left: 11,
        bottom: 0,
        right: 11
    )

    override func textRect(forBounds bounds: CGRect) -> CGRect {
        let rect = super.textRect(forBounds: bounds)
        return rect.inset(by: textPadding)
    }

    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        let rect = super.editingRect(forBounds: bounds)
        return rect.inset(by: textPadding)
    }
}
