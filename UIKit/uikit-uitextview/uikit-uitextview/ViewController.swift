//
//  ViewController.swift
//  uikit-uitextview
//
//  Created by Sherary Apriliana on 25/05/23.
//

import UIKit

class ViewController: UIViewController, UITextViewDelegate {
    
    private var labelOne = UILabel()
    private var textView = UITextView()
    private var counter = UILabel()
    private var longText = """
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer tempus erat ac sagittis pharetra. Donec interdum turpis a nulla lacinia ullamcorper. Donec a vestibulum risus. Ut at scelerisque leo, a porta magna. Suspendisse cursus tincidunt odio, vel aliquet est faucibus non. Suspendisse efficitur urna neque, quis viverra augue euismod quis. Duis ut velit a erat efficitur porta. Integer aliquam ex a urna rutrum ultricies.

Curabitur lobortis felis vitae lorem sagittis, porta volutpat mauris lacinia. Morbi id porta tellus. Quisque congue dolor et ligula commodo, ut lacinia metus semper. Fusce malesuada ut dui id ultrices. Fusce ac feugiat risus, et lacinia orci. Duis posuere aliquet risus. Aenean mattis finibus nisi eu sodales. Pellentesque volutpat magna quis sollicitudin rhoncus. Vestibulum pharetra neque ut pharetra congue. Proin quis accumsan metus. Nunc mi odio, hendrerit ac viverra a, aliquet et magna. Cras at pharetra tortor. Nullam libero metus, porttitor vel eros et, porta aliquam augue.
"""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        setLayout()
        setConstraints()
    }
    
    private func setLayout() {
        view.backgroundColor = UIColor(red: 252/255, green: 252/255, blue: 252/255, alpha: 1)
        
        labelOne.translatesAutoresizingMaskIntoConstraints = false
        labelOne.textAlignment = .left
        labelOne.attributedText = NSAttributedString(string: "Type here: ", attributes: [
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 20, weight: .bold),
            NSAttributedString.Key.foregroundColor: UIColor(red: 2/255, green: 17/255, blue: 20/255, alpha: 1),
        ])
        
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.backgroundColor = UIColor(red: 255/255, green: 200/255, blue: 87/255, alpha: 1)
        textView.layer.cornerRadius = 10.0
        textView.typingAttributes = [
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16, weight: .medium),
            NSAttributedString.Key.foregroundColor: UIColor(red: 17/255, green: 42/255, blue: 70/255, alpha: 1)
        ]
        textView.textAlignment = .justified
//        textView.text = "Add text instantly"
        
//        textView.selectedRange = NSRange(location: 10, length: 0) // add text at certain index
        textView.insertText("")
        textView.contentInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10) // add margin
        textView.returnKeyType = .done
        textView.becomeFirstResponder()
        
//        let rangeToScroll = NSRange(location: 200, length: 40)
//        textView.scrollRangeToVisible(rangeToScroll)
        
        textView.sizeToFit() //resize textview frame to fit its content, adjust without any clipping
        textView.delegate = self
        
        counter.translatesAutoresizingMaskIntoConstraints = false
        counter.attributedText = NSAttributedString(string: "\(textView.text.count)/100", attributes: [
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 50, weight: .bold),
            NSAttributedString.Key.foregroundColor: textView.text.count > 100 ? UIColor.red : UIColor(red: 2/255, green: 17/255, blue: 20/255, alpha: 1),
        ])
        counter.textAlignment = .center
        
        view.addSubview(counter)
        view.addSubview(labelOne)
        view.addSubview(textView)
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            labelOne.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 30),
            labelOne.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100),
            
            textView.widthAnchor.constraint(equalToConstant: 340),
            textView.heightAnchor.constraint(equalToConstant: 160),
            textView.topAnchor.constraint(equalTo: labelOne.bottomAnchor, constant: 10),
            textView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            
            counter.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            counter.topAnchor.constraint(equalTo: textView.bottomAnchor, constant: 40)
        ])
    }
    
    //delegate functions
    public func textViewDidChange(_ textView: UITextView) {
        let characterCount = textView.text.count
        counter.text = "\(characterCount)/100"
        
        if characterCount > 100 {
            counter.textColor = .red
        } else {
            counter.textColor = UIColor(red: 2/255, green: 17/255, blue: 20/255, alpha: 1)
        }
    }
    
    //stops adding character after 100 characters
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        //dismiss keyboard at "done" button
        if text == "\n" {
            textView.resignFirstResponder()
            return false
        }
        
        let currentText = textView.text as NSString
        let newText = currentText.replacingCharacters(in: range, with: text)
        return newText.count <= 100  // Assuming a maximum limit of 100 characters
    }
}
