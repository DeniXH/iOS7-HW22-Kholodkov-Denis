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
    let gender = ["Мужчина", "Женщина"]
    // MARK: - UI Elements

     lazy var rightButtonItem: UIBarButtonItem = {
        let button = UIBarButtonItem()
        button.action = #selector(editAction)
        button.target = self
        button.title = "Edit"
        return button
    }()

    @objc func editAction(){
        detailUserName.isEnabled.toggle()
    }

     lazy var detailPhoto: UIImageView = {
        let detailImageView = UIImageView(image: UIImage(systemName: "photo.circle.fill"))
//        let detailimageTapped = UITapGestureRecognizer(target: self, action: #selector(detailimageTapped))
         //detailimageView.addGestureRecognizer(detailimageTapped)
         detailImageView.clipsToBounds = true
         detailImageView.layer.cornerRadius = 125
         detailImageView.translatesAutoresizingMaskIntoConstraints = false
        return detailImageView
    }()


    // MARK: - first stack

//     lazy var stackIconAndSeparators: UIStackView = {
//        let stackView = UIStackView()
//        stackView.axis = .vertical
//        stackView.distribution = .fillEqually
//        stackView.alignment = .leading
//        stackView.spacing = 25
//        stackView.translatesAutoresizingMaskIntoConstraints = false
//        return stackView
//    }()
    
    lazy var stackIconAndSeparators: UIStackView = {
       let stackView = UIStackView()
       stackView.axis = .vertical
       stackView.distribution = .fillEqually
       stackView.alignment = .leading
       stackView.spacing = 25
       stackView.translatesAutoresizingMaskIntoConstraints = false
       return stackView
   }()
    
    lazy var stackProperties: UIStackView = {
       let stackView = UIStackView()
       stackView.axis = .vertical
       stackView.distribution = .fillEqually
       stackView.alignment = .leading
       stackView.spacing = 25
       stackView.translatesAutoresizingMaskIntoConstraints = false
       return stackView
   }()

//    lazy var stackUserName: UIStackView = {
//        let stackView = UIStackView()
//        stackView.axis = .horizontal
//        stackView.distribution = .fillEqually
//       // stackView.alignment = .center
//        stackView.spacing = 10
//        stackView.translatesAutoresizingMaskIntoConstraints = false
//        return stackView
//    }()

     lazy var detailUserName: UITextField = {
        let detailUserName = TextFieldWithPadding()
        detailUserName.placeholder = "Name"
        detailUserName.isEnabled = isOn
         detailUserName.addTarget(self, action: #selector(tapUserName), for: .touchDown)
        detailUserName.leftView = detailUserNameImage
        detailUserName.leftViewMode = .always
        detailUserName.font = UIFont.systemFont(ofSize: 22)
        detailUserName.translatesAutoresizingMaskIntoConstraints = false
        return detailUserName
    }()

    @objc func tapUserName() {
     //   detailUserName.isEnabled.toggle()
        print("textField touches")
    }

    lazy var detailUserNameImage: UIImageView = {
       let detailUserNameImage = UIImage(systemName: "person.fill")
       let detailUserNameImageView = UIImageView(image: detailUserNameImage)
        detailUserNameImageView.contentMode = .scaleAspectFill
       detailUserNameImageView.translatesAutoresizingMaskIntoConstraints = false
       return detailUserNameImageView
   }()

    lazy var separatorFirst: UIView = {
        let separatorFirst = UIView()
        separatorFirst.backgroundColor = .separator
       // separatorFirst.heightAnchor.constraint(equalToConstant: 2).isActive = true
        separatorFirst.translatesAutoresizingMaskIntoConstraints = false
        return separatorFirst
    }()

    lazy var separatorSecond: UIView = {
        let view = UIView()
        view.backgroundColor = .separator
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    lazy var separatorThird: UIView = {
        let view = UIView()
        view.backgroundColor = .separator
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
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


    // MARK: - second stack

    lazy var stackPicker: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.alignment = .leading
        stackView.spacing = 2
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()


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

        dateFormatter.dateFormat = "MM.dd.yyyy"

        let selectedDate: String = dateFormatter.string(from: datePicker.date)

        print("Selected value \(selectedDate)")
    }

    lazy var detailUserBirthDayImage: UIImageView = {
       let detailUserImage = UIImage(systemName: "birthday.cake.fill")
       let detailUserView = UIImageView(image: detailUserImage)
//        let screenSize: CGRect = UIScreen.main.bounds
//        detailUserView.frame = CGRect(x: 0, y: 0, width: 50, height: screenSize.height * 0.2)
        detailUserView.contentMode = .scaleAspectFill
        detailUserView.translatesAutoresizingMaskIntoConstraints = false
       return detailUserView
   }()

    // MARK: - Gender part
//     lazy var detailUserGender: UITextField = {
//        let detailUserGender = UITextField()
//        // detailUserGender.isEnabled = isEditEnable
//        detailUserGender.placeholder = "Gender"
//        detailUserGender.leftView = detailUserGenderImage
//        detailUserGender.leftViewMode = .always
//        detailUserGender.font = UIFont.systemFont(ofSize: 22)
//        detailUserGender.translatesAutoresizingMaskIntoConstraints = false
//        return detailUserGender
//    }()

//    lazy var genderPicker: UIPickerView = {
//        let genderPicker = UIPickerView()
//        genderPicker.translatesAutoresizingMaskIntoConstraints = false
//        return genderPicker
//    }()



     lazy var detailUserGenderImage: UIImageView = {
        let detailUserGenderImage = UIImage(systemName: "figure.dress.line.vertical.figure")
        let detailUserGenderImageView = UIImageView(image: detailUserGenderImage)
         detailUserGenderImageView.contentMode = .scaleAspectFill
         detailUserGenderImageView.translatesAutoresizingMaskIntoConstraints = false
        return detailUserGenderImageView
    }()

    lazy var detailGenderTextField: UITextField = {
       let detailUserName = TextFieldWithPadding()
       detailUserName.placeholder = "Gender"
      // detailUserName.isEnabled = isOn
        detailUserName.addTarget(self, action: #selector(tapUserName), for: .touchDown)
     //  detailUserName.leftView = detailUserNameImage
       detailUserName.leftViewMode = .always
       detailUserName.font = UIFont.systemFont(ofSize: 22)
       detailUserName.translatesAutoresizingMaskIntoConstraints = false
       return detailUserName
   }()

    lazy var detailGenderPicker: UIPickerView = {
        let detailGenderPicker = UIPickerView()
       // detailGenderPicker.endEditing(true)
        detailGenderPicker.backgroundColor = .white
        return detailGenderPicker
    }()


    override init(frame: CGRect) {
        super.init(frame: frame)
        setupHierarchy()
        setupLayout()
        detailGenderPicker.delegate = self
        detailGenderPicker.dataSource = self

        detailGenderTextField.inputView = detailGenderPicker

    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupHierarchy() {
        addSubview(detailPhoto)
        addSubview(stackIconAndSeparators)
        stackIconAndSeparators.addArrangedSubview(detailUserNameImage)
        stackIconAndSeparators.addArrangedSubview(separatorFirst)
        stackIconAndSeparators.addArrangedSubview(detailUserBirthDayImage)
        stackIconAndSeparators.addArrangedSubview(separatorSecond)
        stackIconAndSeparators.addArrangedSubview(detailUserGenderImage)
        stackIconAndSeparators.addArrangedSubview(separatorThird)

//        stackUserName.addArrangedSubview(detailUserNameImage)
//        stackUserName.addArrangedSubview(detailUserName)
//        addSubview(separatorFirst)
//        addSubview(detailUserBirthDayImage)
//        addSubview(datePicker)
//        addSubview(separatorSecond)
//        addSubview(detailUserGenderImage)
//      //  addSubview(genderPicker)
//        addSubview(detailGenderTextField)
//        addSubview(separatorThird)


    }

    private func setupLayout() {

        NSLayoutConstraint.activate([
            detailPhoto.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 40),
            detailPhoto.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            detailPhoto.widthAnchor.constraint(equalToConstant: 200),
            detailPhoto.heightAnchor.constraint(equalToConstant: 200),

            stackIconAndSeparators.topAnchor.constraint(equalTo: detailPhoto.bottomAnchor, constant: 30),
            stackIconAndSeparators.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 10),
            stackIconAndSeparators.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -10),

            separatorFirst.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 10),
            separatorFirst.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -10),
            separatorFirst.heightAnchor.constraint(equalToConstant: 2),

//            stackPicker.topAnchor.constraint(equalTo: separatorFirst.bottomAnchor, constant: 5),
//            stackPicker.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 10),
//            stackPicker.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -10),

 //           detailUserBirthDayImage.topAnchor.constraint(equalTo: stackUserName.bottomAnchor, constant: 15),
//            detailUserBirthDayImage.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 8), //
//            detailUserBirthDayImage.widthAnchor.constraint(equalTo: detailUserNameImage.widthAnchor),//

         //   datePicker.topAnchor.constraint(equalTo: stackUserName.bottomAnchor, constant: 14),
//            datePicker.leadingAnchor.constraint(equalTo: detailUserBirthDayImage.trailingAnchor, constant: 1),
//                        datePicker.widthAnchor.constraint(equalToConstant: 100),
//                        datePicker.heightAnchor.constraint(equalToConstant: 30),

//            separatorSecond.topAnchor.constraint(equalTo: separatorFirst.bottomAnchor, constant: 45),
            separatorSecond.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 10),
            separatorSecond.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -10),
            separatorSecond.heightAnchor.constraint(equalToConstant: 2),

//            detailUserGenderImage.topAnchor.constraint(equalTo: separatorSecond.bottomAnchor, constant: 10),
//            detailUserGenderImage.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 8), //
//            detailUserGenderImage.widthAnchor.constraint(equalTo: detailUserNameImage.widthAnchor),//

//            detailGenderTextField.topAnchor.constraint(equalTo: separatorSecond.bottomAnchor, constant: 10),
//            detailGenderTextField.leadingAnchor.constraint(equalTo: detailUserGenderImage.trailingAnchor, constant: 1),
//            detailGenderTextField.widthAnchor.constraint(equalToConstant: 150),
//            detailGenderTextField.heightAnchor.constraint(equalToConstant: 30),
//
//            separatorThird.topAnchor.constraint(equalTo: separatorSecond.bottomAnchor, constant: 45),
            separatorThird.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 10),
            separatorThird.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -10),
            separatorThird.heightAnchor.constraint(equalToConstant: 2),
        ])
    }
}

extension DetailScreenView: UIPickerViewDelegate, UIPickerViewDataSource {

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1 // количество крутилок
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return gender.count // количество элементов в крутилке
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return gender[row] // для перебора варинатов
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        detailGenderTextField.text = gender[row] // для присвоения значения выбранному результату
        detailGenderTextField.resignFirstResponder() // для выхода из пикера, после выбора
    }
}
