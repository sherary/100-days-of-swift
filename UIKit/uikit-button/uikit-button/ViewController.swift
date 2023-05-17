//
//  ViewController.swift
//  uikit-button
//
//  Created by Sherary Apriliana on 18/05/23.
//

import UIKit

class ViewController: UIViewController {
    
    var firstButton = UIButton()
    var secondButton = UIButton()
    var thirdButton = UIButton()
    
    var isClicked = false

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupViews()
        layoutStyle()
    }

    private func setupViews() {
        view.backgroundColor = .systemFill
        
        view.addSubview(firstButton)
        view.addSubview(secondButton)
        view.addSubview(thirdButton)
        
    }
    
    private func layoutStyle() {
        firstButton.setImage(UIImage(systemName: "heart.fill", withConfiguration: UIImage.SymbolConfiguration(pointSize: 20)), for: .normal)
        firstButton.tintColor = .red //set color for symbols and title
        
        //set title color for different states
        firstButton.setTitleColor(.systemGray, for: .normal)
        firstButton.setTitleColor(.gray, for: .disabled)
        
        firstButton.translatesAutoresizingMaskIntoConstraints = false
        
        //set content alignment
        firstButton.contentHorizontalAlignment = .trailing
        firstButton.contentVerticalAlignment = .bottom
        
        firstButton.backgroundColor = .systemGroupedBackground
        firstButton.layer.cornerRadius = 8.0
        
        //set button margin
        firstButton.contentEdgeInsets = UIEdgeInsets(top: 12, left: 12, bottom: 8, right: 8)
        
        //controlling button states
//        firstButton.isEnabled = false
//        firstButton.isHidden = true
        
        
        secondButton.configuration = UIButton.Configuration.filled()
        secondButton.configuration?.baseForegroundColor = .lightGray
        secondButton.configuration?.cornerStyle = .medium
        secondButton.configuration?.title = "Second Button"
        secondButton.configuration?.baseBackgroundColor = .systemGray6
        secondButton.configuration?.subtitle = "Made with UIButton Configuration"
        secondButton.configuration?.titleAlignment = .leading //align content to left
        secondButton.configuration?.titlePadding = 4 //padding between title and subtitle
        secondButton.configuration?.image = UIImage(systemName: "swift")
        secondButton.configuration?.imagePadding = 10
        secondButton.configuration?.imagePlacement = .leading //image positioning
        secondButton.configuration?.contentInsets = NSDirectionalEdgeInsets(top: 4, leading: 8, bottom: 4, trailing: 8)
        
        //edit title
        var attrTitle = AttributedString.init(secondButton.configuration?.title ?? "Seconf Buttn")
        attrTitle.font = UIFont.systemFont(ofSize: 14, weight: .heavy)
        secondButton.configuration?.attributedTitle = attrTitle
        
        //edit subtitle
        var attrSubt = AttributedString(secondButton.configuration?.subtitle ?? "Hehe")
        attrSubt.font = UIFont.systemFont(ofSize: 9, weight: .light)
        secondButton.configuration?.attributedSubtitle = attrSubt
        
        secondButton.translatesAutoresizingMaskIntoConstraints = false
        
        thirdButton.setImage(UIImage(systemName: "pawprint.fill", withConfiguration: UIImage.SymbolConfiguration(pointSize: 50, weight: .heavy)), for: .normal)
        thirdButton.tintColor = UIColor(red: 255/255, green: 182/255, blue: 193/255, alpha: 1.0)
//        thirdButton.setBackgroundImage(UIImage(systemName: "pawprint.fill"), for: .normal)
        thirdButton.translatesAutoresizingMaskIntoConstraints = false
        thirdButton.layer.borderWidth = 2.0
        thirdButton.layer.borderColor = UIColor.systemTeal.cgColor
        thirdButton.layer.cornerRadius = 8.0
        thirdButton.addTarget(self, action: #selector(pawClicked), for: .touchUpInside)
        
        setConstraint()
    }
    
    private func setConstraint() {
        NSLayoutConstraint.activate([
            firstButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            firstButton.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 50),
            firstButton.widthAnchor.constraint(equalToConstant: 100),
            firstButton.heightAnchor.constraint(equalToConstant: 50),
            
            secondButton.topAnchor.constraint(equalTo: firstButton.bottomAnchor, constant: 40),
            secondButton.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 50),
            secondButton.widthAnchor.constraint(equalToConstant: 200),
            secondButton.heightAnchor.constraint(equalToConstant: 80),
            
            thirdButton.widthAnchor.constraint(equalToConstant: 100),
            thirdButton.heightAnchor.constraint(equalToConstant: 100),
            thirdButton.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 50),
            thirdButton.topAnchor.constraint(equalTo: secondButton.bottomAnchor, constant: 20)
        ])
    }
    
    @objc private func pawClicked() {
        if !isClicked {
            thirdButton.tintColor = UIColor.systemTeal
        } else {
            thirdButton.tintColor = UIColor(red: 255/255, green: 182/255, blue: 193/255, alpha: 1.0)
        }
        isClicked.toggle()
    }
}

/**
    Best practice for changing title color is using `setTitleColor`,
     `tintColor` will change SF Symbol if used as UIImage.
     `tintColor` also change title
 
     Working reference:
    - https://sarunw.com/posts/new-way-to-style-uibutton-in-ios15/
 */
