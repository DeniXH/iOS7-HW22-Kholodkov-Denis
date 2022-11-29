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

    // MARK: - Varibles
    var isOn = false
    let gender = [MetricStrings.men, MetricStrings.women]

    // MARK: - UI Elements
    lazy var rightButtonItem: UIBarButtonItem = {
        let button = UIBarButtonItem()
        button.action = #selector(editAction)
        button.target = self
        button.title = MetricStrings.buttonEditTitle
        return button
    }()

    @objc func editAction(){
        detailUserName.isEnabled.toggle()
    }

    lazy var detailPhoto: UIImageView = {
        let detailImageView = UIImageView(image: UIImage(systemName: MetricStrings.detailPhotoImage))
        //        let detailimageTapped = UITapGestureRecognizer(target: self, action: #selector(detailimageTapped))
        //detailimageView.addGestureRecognizer(detailimageTapped)
        detailImageView.clipsToBounds = true
        detailImageView.layer.cornerRadius = Metric.detailPhotoCornerRadius
        detailImageView.translatesAutoresizingMaskIntoConstraints = false
        return detailImageView
    }()


    // MARK: - Vertical main stack
    lazy var stackMainVertical = StackUI(axis: .vertical,
                                         spacing: Metric.stackSpacingBase)

    // MARK: - Separators
    lazy var separatorFirst = Separator()
    lazy var separatorSecond = Separator()
    lazy var separatorThird = Separator()

    // MARK: - User name stack
    lazy var stackUserName = StackUI(axis: .horizontal,
                                     spacing: Metric.stackSpacingBase)

    lazy var detailUserNameImage = ImageIcon(imageName: MetricStrings.detailUserNameImage)

    lazy var detailUserName: UITextField = {
        let detailUserName = TextFieldWithPadding()
        detailUserName.placeholder = MetricStrings.userNamePlaceholder
        detailUserName.isEnabled = isOn
        detailUserName.addTarget(self, action: #selector(tapUserName), for: .touchDown)
        detailUserName.leftView = detailUserNameImage
        detailUserName.leftViewMode = .always
        detailUserName.font = UIFont.systemFont(ofSize: Metric.fontSize)
        detailUserName.translatesAutoresizingMaskIntoConstraints = false
        return detailUserName
    }()

    @objc func tapUserName() {
        //   detailUserName.isEnabled.toggle()
        print("textField touches")
    }

    // MARK: - Birthday Stack
    lazy var stackBirthday = StackUI(axis: .horizontal,
                                     spacing: Metric.stackSpacingBase)

    lazy var detailUserBirthDayImage = ImageIcon(imageName: MetricStrings.detailUserNameBirthdayImage)

    lazy var datePicker: UIDatePicker = {
        let datepicker = UIDatePicker()
        datepicker.timeZone = NSTimeZone.local
        datepicker.backgroundColor = UIColor.clear
        datepicker.preferredDatePickerStyle = .automatic
        datepicker.datePickerMode = .date
        datepicker.layer.cornerRadius = Metric.datePickerCornerRadius
        datepicker.contentHorizontalAlignment = .leading // for left orietation near icon
        datepicker.translatesAutoresizingMaskIntoConstraints = false
        datepicker.addTarget(self, action: #selector(pickerTapped), for: .valueChanged)
        //   datePicker.subviews.forEach({ $0.subviews.forEach({ $0.removeFromSuperview() }) })
        return datepicker
    }()

    @objc func pickerTapped() {
        let dateFormatter: DateFormatter = DateFormatter()
        dateFormatter.dateFormat = MetricStrings.datePickerFormat
        let selectedDate: String = dateFormatter.string(from: datePicker.date)
        print("Selected value \(selectedDate)")
    }

    // MARK: - Gender part
    lazy var stackPicker = StackUI(axis: .horizontal,
                                   spacing: Metric.stackPickerSpacing)


    lazy var detailUserGenderImage = ImageIcon(imageName: MetricStrings.detailUserNameGenderImage)

    lazy var detailGenderTextField: UITextField = {
        let detailUserName = TextFieldWithPadding()
        detailUserName.placeholder = MetricStrings.detailGenderPlaceholder
        // detailUserName.isEnabled = isOn
        detailUserName.addTarget(self, action: #selector(tapUserName), for: .touchDown)
        detailUserName.leftView = detailUserGenderImage
        detailUserName.leftViewMode = .always
        detailUserName.font = UIFont.systemFont(ofSize: Metric.fontSize)
        detailUserName.translatesAutoresizingMaskIntoConstraints = false
        return detailUserName
    }()

    lazy var detailGenderPicker: UIPickerView = {
        let detailGenderPicker = UIPickerView()
        detailGenderPicker.backgroundColor = .white
        return detailGenderPicker
    }()

    // MARK: - init
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

    // MARK: - Functions
    private func setupHierarchy() {
        addSubview(detailPhoto)
        addSubview(stackMainVertical)

        stackMainVertical.addArrangedSubview(stackUserName)
        stackMainVertical.addArrangedSubview(separatorFirst)
        stackMainVertical.addArrangedSubview(stackBirthday)
        stackMainVertical.addArrangedSubview(separatorSecond)
        stackMainVertical.addArrangedSubview(stackPicker)
        stackMainVertical.addArrangedSubview(separatorThird)

        stackUserName.addArrangedSubview(detailUserNameImage)
        stackUserName.addArrangedSubview(detailUserName)
        stackBirthday.addArrangedSubview(detailUserBirthDayImage)
        stackBirthday.addArrangedSubview(datePicker)
        stackPicker.addArrangedSubview(detailUserGenderImage)
        stackPicker.addArrangedSubview(detailGenderTextField)
    }

    private func setupLayout() {
        NSLayoutConstraint.activate([
            detailPhoto.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: Metric.photoTop),
            detailPhoto.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            detailPhoto.widthAnchor.constraint(equalToConstant: Metric.photoWidth),
            detailPhoto.heightAnchor.constraint(equalToConstant: Metric.photoHeight),

            stackMainVertical.topAnchor.constraint(equalTo: detailPhoto.bottomAnchor, constant: Metric.mainStackTop),
            stackMainVertical.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: Metric.mainStackLeading),
            stackMainVertical.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: Metric.mainStackTrailing),
        ])
    }
}

    // MARK: - extensions
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

extension DetailScreenView {

    enum Metric {
        static let photoTop: CGFloat = 40
        static let photoWidth: CGFloat = 200
        static let photoHeight: CGFloat = 200

        static let mainStackTop: CGFloat = 30
        static let mainStackLeading: CGFloat = 10
        static let mainStackTrailing: CGFloat = -10
        static let stackSpacingBase: CGFloat = 10
        static let stackPickerSpacing: CGFloat = 2

        static let detailPhotoCornerRadius: CGFloat = 125
        static let fontSize: CGFloat = 20
        static let datePickerCornerRadius: CGFloat = 16
    }

    enum MetricStrings {
        static let men = "Мужчина"
        static let women = "Женщина"

        static let buttonEditTitle = "Edit"
        static let userNamePlaceholder = "Name"
        static let detailGenderPlaceholder = "Gender"
        static let datePickerFormat = "MM.dd.yyyy"

        static let detailPhotoImage = "photo.circle.fill"
        static let detailUserNameImage = "person.fill"
        static let detailUserNameBirthdayImage = "birthday.cake.fill"
        static let detailUserNameGenderImage = "figure.dress.line.vertical.figure"
    }
}
