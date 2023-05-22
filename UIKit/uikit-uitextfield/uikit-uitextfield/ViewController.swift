//
//  ViewController.swift
//  uikit-uitextfield
//
//  Created by Sherary Apriliana on 18/05/23.
//

import UIKit

class ViewController: UIViewController {
    private var inputOne = UITextField()
    private var leakButton = UIButton()
    private var someText = UILabel()
    
    let placeholderSettings = NSAttributedString(string: "Enter your password here...", attributes: [
        NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16, weight: .regular),
        NSAttributedString.Key.foregroundColor: UIColor.darkGray
    ])
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .systemIndigo
        
        layoutViews()
        styleViews()
    }
    
    private func layoutViews() {
        
        inputOne.borderStyle = .roundedRect
        inputOne.textColor = .darkText
        inputOne.keyboardType = .default
        inputOne.backgroundColor = .white
        inputOne.translatesAutoresizingMaskIntoConstraints = false
        inputOne.isSecureTextEntry = true //secure textfield mode
        inputOne.returnKeyType = .continue
        inputOne.layer.cornerRadius = 8.0
        inputOne.textAlignment = .center
        inputOne.clearButtonMode = .whileEditing
//        inputOne.tintColor = .systemOrange //edit the cursor colors too
        UITextField.appearance(whenContainedInInstancesOf: [ViewController.self]).tintColor = UIColor.systemBlue //does the same way as the previous
        
        //edit placeholder settings
        inputOne.attributedPlaceholder = placeholderSettings
        
        
        inputOne.delegate = self
        view.addSubview(inputOne)
        
        leakButton.setTitle("Leak Me!", for: .normal)
        leakButton.translatesAutoresizingMaskIntoConstraints = false
        leakButton.backgroundColor = .systemOrange
        leakButton.layer.cornerRadius = 8.0
        leakButton.addTarget(self, action: #selector(leakButtonTapped), for: .touchUpInside)
        
        view.addSubview(leakButton)
        
        someText.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(someText)
    }
    
    private func styleViews() {
        NSLayoutConstraint.activate([
            inputOne.widthAnchor.constraint(equalToConstant: 300),
            inputOne.heightAnchor.constraint(equalToConstant: 50),
            inputOne.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            inputOne.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),
            
            leakButton.widthAnchor.constraint(equalToConstant: 160),
            leakButton.heightAnchor.constraint(equalToConstant: 50),
            leakButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            leakButton.topAnchor.constraint(equalTo: inputOne.bottomAnchor, constant: 20),
            
            someText.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            someText.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100),
            someText.widthAnchor.constraint(equalToConstant: 320)

        ])
    }
    
    @objc private func leakButtonTapped() {
        let alertController = UIAlertController(title: "Leaked!", message: inputOne.text, preferredStyle: .alert)
        
        /**
                        .actionSheet = alert that comes from below
                        .alert = default alert
         
         */

        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            // Handle OK button action
            self.someText.numberOfLines = 5
            self.someText.lineBreakMode = .byCharWrapping
            self.someText.textAlignment = .justified
            self.someText.attributedText = NSAttributedString(string: self.inputOne.text ?? "", attributes: [
                NSAttributedString.Key.foregroundColor: UIColor.white,
                NSAttributedString.Key.font: UIFont.systemFont(ofSize: 50, weight: .black),
            ])
            
        }

        let cancelAction = UIAlertAction(title: "Cancel", style: .destructive) { _ in
            // Handle Cancel button action
            self.inputOne.text = .none
            self.inputOne.attributedPlaceholder = self.placeholderSettings
        }

        alertController.addAction(okAction)
        alertController.addAction(cancelAction)

        present(alertController, animated: true, completion: nil)
    }
}

extension ViewController: UITextFieldDelegate {
    //dismiss keyboard on "return" button
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        textField.layer.borderColor = UIColor.clear.cgColor
        textField.layer.borderWidth = 0
        
        if textField.text?.count == 0 {
            textField.attributedPlaceholder = placeholderSettings
        }
        
        return true
    }
    
    // change textfield behavior when begin editing
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.layer.borderColor = UIColor.purple.cgColor
        textField.layer.borderWidth = 2.0
        textField.attributedPlaceholder = .none
    }
    
//    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
//        // Allow only numeric input even though the keyboard type is set to default
//        let allowedCharacterSet = CharacterSet(charactersIn: "0123456789")
//        let replacementStringCharacterSet = CharacterSet(charactersIn: string)
//        return replacementStringCharacterSet.isSubset(of: allowedCharacterSet)
//    }
    
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        return true
    }

}

