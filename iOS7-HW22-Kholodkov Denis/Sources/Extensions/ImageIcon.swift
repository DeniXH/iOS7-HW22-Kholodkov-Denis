//
//  ImageIcon.swift
//  iOS7-HW22-Kholodkov Denis
//
//  Created by Денис Холодков on 28.11.2022.
//

import UIKit

final class ImageIcon: UIImageView {

    init(imageName: String) {
        super.init(frame: .zero)
        setupImageIcon(imageName: imageName)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupImageIcon(imageName: String) {
        let image = UIImage(systemName: imageName)
        self.image = image
        contentMode = .scaleAspectFit
        setContentCompressionResistancePriority(.required, for: .horizontal)
        translatesAutoresizingMaskIntoConstraints = false
    }
}
