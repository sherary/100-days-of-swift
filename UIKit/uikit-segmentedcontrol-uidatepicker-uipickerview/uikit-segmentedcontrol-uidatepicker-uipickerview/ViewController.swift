//
//  ViewController.swift
//  uikit-segmentedcontrol-uidatepicker-uipickerview
//
//  Created by Sherary Apriliana on 30/05/23.
//

import UIKit

enum Option: String, CaseIterable {
    case apple = "Apple"
    case banana = "Banana"
    case orange = "Orange"
    case mango = "Mango"
}

let amount = Array(1...20)

class ViewController: UIViewController {
    private var segmentedControl = UISegmentedControl(items: ["Date Picker", "Picker"])
    private var datePicker = UIDatePicker()
    private var picker = UIPickerView()
    private var label = UILabel()
    private var resetButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        setupLayout()
        setConstraints()
    }
    
    private func setupLayout() {
        view.backgroundColor = .darkBlue
        
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
         /** another way to set picker title */
//        segmentedControl.insertSegment(withTitle: "Date Picker", at: 0, animated: true)
//        segmentedControl.insertSegment(withTitle: "Picker", at: 1, animated: true)
        segmentedControl.selectedSegmentIndex = 1 // picks default side
        segmentedControl.backgroundColor = .customWhite
        let attributesNormal: [NSAttributedString.Key: Any] = [
            .font: UIFont.nunitoFont(size: 14),
            .foregroundColor: UIColor.customBlack
        ]
        
        let attributesSelected: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.customBlack,
            .font: UIFont.nunitoFont(size: 14),
        ]
        
        segmentedControl.setTitleTextAttributes(attributesNormal, for: .normal)
        segmentedControl.setTitleTextAttributes(attributesSelected, for: .selected)
        segmentedControl.addTarget(self, action: #selector(segmentedValueChanged), for: .valueChanged)
        
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        datePicker.isHidden = true
        
        /**
            UIDatePicker Type
            
         .inline = calendar
        .compact  = clickable
        .wheels = scrollable
         */
        
        datePicker.preferredDatePickerStyle = .wheels
        if let datePickerView = datePicker.subviews.first {
            datePickerView.backgroundColor = UIColor.customBlack
            datePickerView.layer.cornerRadius = 10.0
        }
        
        datePicker.datePickerMode = .date
        datePicker.locale = Locale(identifier: "id_ID") // set date picker to local time
        datePicker.date = .now
        datePicker.maximumDate = Date()
        
        let calendar = Calendar.current
        _ = DateComponents(year: calendar.component(.year, from: .now), month: calendar.component(.month, from: .now), day: calendar.component(.day, from: .now))
        let pastYear = calendar.date(byAdding: .year, value: -100 ,to: .now)
        
        //set minimum date allowed to input from 100 years ago
        if let pastDate = pastYear {
            datePicker.minimumDate = pastDate
        }
//        datePicker.minimumDate = nil //remove date restriction
        datePicker.setDate(calendar.date(from: DateComponents(year: 1999, month: 4, day: 8)) ?? .now , animated: true) // memthod to set the date
        datePicker.addTarget(self, action: #selector(datePickerValueChanged(_ :)), for: .valueChanged)
        
        picker.translatesAutoresizingMaskIntoConstraints = false
        picker.delegate = self
        picker.dataSource = self
        
        //style text color and font
        picker.backgroundColor = .customBlack
        picker.setValue(UIColor.customWhite, forKey: "textColor")
        
        //selection indicator color
//        picker.tintColor = UIColor.yellow //does not work
        picker.layer.cornerRadius = 8.0
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Pick an option: "
        label.textColor = .customWhite
        
        resetButton.translatesAutoresizingMaskIntoConstraints = false
        resetButton.backgroundColor = .customWhite
        resetButton.setTitle("Reset", for: .normal)
        resetButton.setTitleColor(.customBlack, for: .normal)
        resetButton.layer.cornerRadius = 8.0
        resetButton.addTarget(self, action: #selector(resetButtonTapped), for: .touchUpInside)
        
        view.addSubview(segmentedControl)
        view.addSubview(datePicker)
        view.addSubview(picker)
        view.addSubview(label)
        view.addSubview(resetButton)
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            segmentedControl.widthAnchor.constraint(equalToConstant: 300),
            segmentedControl.heightAnchor.constraint(equalToConstant: 40),
            segmentedControl.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 200),
            segmentedControl.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 50),
            
            datePicker.widthAnchor.constraint(equalToConstant: 320),
            datePicker.heightAnchor.constraint(equalToConstant: 240),
            datePicker.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            datePicker.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),
            
            picker.widthAnchor.constraint(equalToConstant: 320),
            picker.heightAnchor.constraint(equalToConstant: 240),
            picker.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            picker.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),
            
            label.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            label.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor, constant: 300),
            
            resetButton.widthAnchor.constraint(equalToConstant: 200),
            resetButton.heightAnchor.constraint(equalToConstant: 40),
            resetButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            resetButton.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 40),
        ])
    }
    
    @objc private func segmentedValueChanged() {
        if segmentedControl.selectedSegmentIndex == 1 {
            picker.isHidden = false
            datePicker.isHidden = true
            label.text = "Pick an option: "
        } else {
            picker.isHidden = true
            datePicker.isHidden = false
            label.text = "Date Picker: "
        }
    }
    
    @objc private func resetButtonTapped() {
        label.text = "Pressed reset!"
    }
    
    @objc private func datePickerValueChanged(_ sender: UIDatePicker) {
        let selectedDate = sender.date
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .full
        dateFormatter.dateFormat = "dd-MM-yyyy"
        label.text = "Selected Date: " + dateFormatter.string(from: selectedDate)
    }
}

extension ViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    //return number of components in the picker view
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    //number of rows of each component
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 1 {
            return Option.allCases.count
        } else if component == 0 {
            return amount.count
        }
        
        return 0
    }
    
    //title for a specific row and component
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == 1 {
            return Option.allCases[row].rawValue
        } else if component == 0 {
            return "\(amount[row])"
        }
        
        return ""
    }
    
    // handle selection of a row in the picker view
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let row1 = pickerView.selectedRow(inComponent: 0) // selected row by index
        let row2 = pickerView.selectedRow(inComponent: 1)
        
        label.text = "\(amount[row1]) \(Option.allCases[row2])"
    }
    
    // implement additional delegate methods for customizing the appearance and behavior
//    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
//
//    }
}
