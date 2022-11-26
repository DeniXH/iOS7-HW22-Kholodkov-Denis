//
//  ViewBeforeStart.swift
//  iOS7-HW22-Kholodkov Denis
//
//  Created by Денис Холодков on 26.11.2022.
//

import UIKit

class ViewBeforeStart: UIView {

    private lazy var viewBefore: UIView = {
      let viewBefore = UIView()
        return viewBefore
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        viewBefore.backgroundColor = .black
        setupHierarchy()
        setupLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

  private func setupHierarchy() {
        addSubview(viewBefore)
    }

  private func setupLayout() {
      NSLayoutConstraint.activate([
        viewBefore.leadingAnchor.constraint(equalTo: leadingAnchor),
        viewBefore.trailingAnchor.constraint(equalTo: trailingAnchor),
        viewBefore.topAnchor.constraint(equalTo: topAnchor),
        viewBefore.bottomAnchor.constraint(equalTo: bottomAnchor)
      ])
    }
}
