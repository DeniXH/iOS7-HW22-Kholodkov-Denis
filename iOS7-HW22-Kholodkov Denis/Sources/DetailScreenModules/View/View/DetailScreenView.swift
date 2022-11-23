//
//  DetailScreenView.swift
//  iOS7-HW22-Kholodkov Denis
//
//  Created by Денис Холодков on 22.11.2022.
//

import UIKit

protocol OutputDetailScreenViewProtocol {

}

class DetailScreenView: UIView {

    var isOn = false
    // MARK: - UI Elements

     lazy var rightButtonItem: UIBarButtonItem = {
        let button = UIBarButtonItem()
        button.action = #selector(editAction)
        button.target = self
        button.title = "Edit"
        return button
    }()

    @objc func editAction(){}

     lazy var detailPhoto: UIImageView = {
        let detailImageView = UIImageView(image: UIImage(systemName: "photo.circle.fill"))
//        let detailimageTapped = UITapGestureRecognizer(target: self, action: #selector(detailimageTapped))
         //detailimageView.addGestureRecognizer(detailimageTapped)
         detailImageView.clipsToBounds = true
         detailImageView.layer.cornerRadius = 125
         detailImageView.translatesAutoresizingMaskIntoConstraints = false
        return detailImageView
    }()

    lazy var stackUserName: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
       // stackView.alignment = .center
        stackView.spacing = 10

        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

     lazy var detailUserName: UITextField = {
        let detailUserName = TextFieldWithPadding()
        detailUserName.placeholder = "Name"
        detailUserName.isEnabled = isOn
         detailUserName.addTarget(self, action: #selector(tapUserName), for: .editingChanged)
        detailUserName.leftView = detailUserNameImage
        detailUserName.leftViewMode = .always
        detailUserName.font = UIFont.systemFont(ofSize: 22)
        detailUserName.translatesAutoresizingMaskIntoConstraints = false
        return detailUserName
    }()

    @objc func tapUserName() {
        isOn.toggle()
    }

    lazy var detailUserNameImage: UIImageView = {
       let detailUserNameImage = UIImage(systemName: "person.fill")
       let detailUserNameImageView = UIImageView(image: detailUserNameImage)
       detailUserNameImageView.contentMode = .scaleAspectFit
       detailUserNameImageView.translatesAutoresizingMaskIntoConstraints = false
       return detailUserNameImageView
   }()

//     lazy var detailUserBirthDay: UITextField = {
//        let detailUserBirthDay = UITextField()
//        // detailUserBirthDay.isEnabled = isEditEnable
//         detailUserBirthDay.placeholder = "Birthday"
//         detailUserBirthDay.leftView = detailUserBirthDayImage
//         detailUserBirthDay.leftViewMode = .always
//         detailUserBirthDay.font = UIFont.systemFont(ofSize: 22)
//        return detailUserBirthDay
//    }()

     lazy var datePicker: UIDatePicker = {
       let datepicker = UIDatePicker()//frame: CGRect(x: 50, y: 125, width: 200, height: 50))
        datepicker.timeZone = NSTimeZone.local
        datepicker.backgroundColor = UIColor.clear
        datepicker.preferredDatePickerStyle = .compact
        datepicker.datePickerMode = .date
        datepicker.layer.cornerRadius = 16
        datepicker.translatesAutoresizingMaskIntoConstraints = false
        datepicker.addTarget(self, action: #selector(pickerTapped), for: .valueChanged)
     //   datePicker.subviews.forEach({ $0.subviews.forEach({ $0.removeFromSuperview() }) })
        return datepicker
    }()

    @objc func pickerTapped() {
        let dateFormatter: DateFormatter = DateFormatter()

        dateFormatter.dateFormat = "MM.dd.yyyy hh:mm a"

        let selectedDate: String = dateFormatter.string(from: datePicker.date)

        print("Selected value \(selectedDate)")
    }

     lazy var detailUserGender: UITextField = {
        let detailUserGender = UITextField()
        // detailUserGender.isEnabled = isEditEnable
        detailUserGender.placeholder = "Gender"
        detailUserGender.leftView = detailUserGenderImage
        detailUserGender.leftViewMode = .always
        detailUserGender.font = UIFont.systemFont(ofSize: 22)
        detailUserGender.translatesAutoresizingMaskIntoConstraints = false
        return detailUserGender
    }()

     lazy var detailUserBirthDayImage: UIImageView = {
        let detailUserImage = UIImage(systemName: "birthday.cake.fill")
        let detailUserView = UIImageView(image: detailUserImage)
         detailUserView.contentMode = .scaleAspectFit
         detailUserView.translatesAutoresizingMaskIntoConstraints = false
        return detailUserView
    }()

     lazy var detailUserGenderImage: UIImageView = {
        let detailUserGenderImage = UIImage(systemName: "figure.dress.line.vertical.figure")
        let detailUserGenderImageView = UIImageView(image: detailUserGenderImage)
         detailUserGenderImageView.contentMode = .scaleAspectFit
         detailUserGenderImageView.translatesAutoresizingMaskIntoConstraints = false
        return detailUserGenderImageView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupHierarchy()
        setupLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupHierarchy() {
        addSubview(detailPhoto)
        addSubview(stackUserName)
        stackUserName.addArrangedSubview(detailUserNameImage)
        stackUserName.addArrangedSubview(detailUserName)

//        stackUserName.arrangedSubviews(detailUserNameImage)
//        stackUserName.arrangedSubviews(detailUserName)
//        stackUserName.arrangedSubviews(detailUserBirthDayImage)
      //  addSubview(detailUserName)
      //  addSubview(datePicker)
      //  addSubview(detailUserGender)
    }

    private func setupLayout() {

        NSLayoutConstraint.activate([
            detailPhoto.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 40),
            detailPhoto.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            detailPhoto.widthAnchor.constraint(equalToConstant: 200),
            detailPhoto.heightAnchor.constraint(equalToConstant: 200),

            stackUserName.topAnchor.constraint(equalTo: detailPhoto.bottomAnchor, constant: 30),
            stackUserName.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 10),
            stackUserName.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -10),
//            stackUserName.widthAnchor.constraint(equalToConstant: 400),
//            stackUserName.heightAnchor.constraint(equalToConstant: 100)


//            stackUserName.widthAnchor.constraint(equalToConstant: 250),
//            stackUserName.heightAnchor.constraint(equalToConstant: 100)



//            detailPhoto.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 40),
//            detailPhoto.heightAnchor.constraint(equalToConstant: 250),
//            detailPhoto.widthAnchor.constraint(equalToConstant: 250)

        ])
    }
}

