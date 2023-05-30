//
//  ViewController.swift
//  uikit-segmentedcontrol-uidatepicker-uipickerview
//
//  Created by Sherary Apriliana on 30/05/23.
//

import UIKit

class ViewController: UIViewController {
    private var segmentedControl = UISegmentedControl(items: ["Date Picker", "Picker"])
    private var datePicker = UIDatePicker()
    private var picker = UIPickerView()

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
        
        datePicker.datePickerMode = .dateAndTime
        datePicker.locale = Locale(identifier: "id_ID") // set date picker to local time
        
        picker.translatesAutoresizingMaskIntoConstraints = false
        picker.delegate = self
        picker.dataSource = self
        
        
        view.addSubview(segmentedControl)
        view.addSubview(datePicker)
        view.addSubview(picker)
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
        ])
    }
    
    @objc private func segmentedValueChanged() {
        if segmentedControl.selectedSegmentIndex == 1 {
            picker.isHidden = false
            datePicker.isHidden = true
        } else {
            picker.isHidden = true
            datePicker.isHidden = false
        }
    }
}

extension ViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0 {
            return 10
        } else {
            return 100
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == 0 {
            return "First \(row)"
        }
        
        return "Second \(row)"
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        return
    }
}
