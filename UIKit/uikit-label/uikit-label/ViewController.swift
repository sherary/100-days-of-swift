//
//  ViewController.swift
//  uikit-label
//
//  Created by Sherary Apriliana on 16/05/23.
//

import UIKit

class ViewController: UIViewController {
    var initialLabel = UILabel()
    var secondLabel = UILabel()
    var thirdLabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.backgroundColor = .white
        setupViews()
        
        setupStyling()
    }
    
    func setupViews() {
        view.addSubview(initialLabel)
        view.addSubview(secondLabel)
        view.addSubview(thirdLabel)
        
        //NSAttributedString cannot be modified once created -> immutable
        initialLabel.attributedText = NSAttributedString(string: "Created with NSAttributedString class", attributes: [
            NSAttributedString.Key.foregroundColor: UIColor.systemBlue,
            NSAttributedString.Key.backgroundColor: UIColor.black
        ])
        
        thirdLabel.text = """
        Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean maximus purus ac vestibulum sodales. Mauris sit amet sapien tellus. Maecenas quis ex massa. Ut iaculis mi eget odio rhoncus, sed gravida quam iaculis. Maecenas quis sem et urna commodo ultricies. Praesent at dolor tellus. Sed eleifend id eros in maximus. Pellentesque vel augue quis nunc congue mollis. Cras in convallis justo, ut commodo nunc. Maecenas feugiat lectus diam, dapibus tempus sapien commodo sit amet. Maecenas consequat quam quis commodo tincidunt. Nulla vulputate tortor in felis sodales, ac dictum sem maximus. Nullam in ligula tortor. Phasellus nec nisl at justo fermentum ultricies. Nulla gravida maximus nibh vitae accumsan. In hac habitasse platea dictumst.

        Maecenas ac tellus metus. Praesent nec mauris dolor. Praesent placerat porttitor dapibus. Ut purus nisi, luctus quis lorem vitae, ullamcorper commodo erat. Phasellus at ultricies odio, vel tincidunt tortor. Nunc sed velit est. Mauris dignissim aliquam elementum. Cras pellentesque lectus et eleifend sagittis. Nulla lacinia arcu neque, et efficitur ex tincidunt non. Vestibulum et sollicitudin dui. Praesent rutrum non sem consectetur tempor. Etiam at velit a ante luctus porta. Maecenas eu ligula mi. Nulla eget ultricies lacus. Nunc enim arcu, ornare vitae metus nec, faucibus facilisis arcu. Donec faucibus maximus sem.

        Morbi blandit mattis arcu, id imperdiet velit ullamcorper ac. Maecenas consequat elit in magna eleifend, vitae molestie erat vulputate. Suspendisse vel porta mi. In vel tristique turpis. Vestibulum aliquet libero tellus, non pulvinar risus mattis at. Etiam tincidunt nisl at quam feugiat, id pretium sem vulputate. Pellentesque blandit porta odio, at dictum ligula varius at. Quisque malesuada, risus eu interdum sodales, nisl felis tincidunt lectus, sit amet condimentum est orci quis augue. Aenean at nisl semper, eleifend massa et, imperdiet leo. Proin ex dolor, porttitor non ipsum eget, auctor luctus orci. Fusce pulvinar nisi ut mauris blandit feugiat eget lobortis leo.
        """
        thirdLabel.adjustsFontSizeToFitWidth = true //turn on adjusting text into a view
        thirdLabel.textColor = .black
        thirdLabel.minimumScaleFactor = 0.5 //minimum font size allowed, use .minimumFontScale for fixed aspect ratio
        thirdLabel.numberOfLines = 10 //multiple lines
//        thirdLabel.lineBreakMode = .byTruncatingTail //truncating text at the end
        thirdLabel.lineBreakMode = .byCharWrapping // occurs before the first character that does not fit (?)
        thirdLabel.baselineAdjustment = .alignCenters //vertically centered between UILabel bounds, depends on .numberOfLines
        
        //adjusting preferred font size by setting it to default
        thirdLabel.adjustsFontForContentSizeCategory = true
        let font = UIFontMetrics.default.scaledFont(for: UIFont.systemFont(ofSize: 16.0))
        thirdLabel.font = font
    }
    
    func setupStyling() {
        initialLabel.translatesAutoresizingMaskIntoConstraints = false
        secondLabel.translatesAutoresizingMaskIntoConstraints = false
        thirdLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let attributedString = NSMutableAttributedString(string: "Created with NSMutableAttributedString")
        attributedString.addAttribute(.font, value: UIFont.boldSystemFont(ofSize: 16), range: NSRange(location: 0, length: 5))
        attributedString.addAttribute(.foregroundColor, value: UIColor.red, range: NSRange(location: 7, length: 31))
        secondLabel.attributedText = attributedString
                
        NSLayoutConstraint.activate([
            initialLabel.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 20),
            initialLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            
            secondLabel.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 20),
            secondLabel.topAnchor.constraint(equalTo: initialLabel.bottomAnchor, constant: 20),
            
            thirdLabel.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 20),
            thirdLabel.topAnchor.constraint(equalTo: secondLabel.bottomAnchor, constant: 20),
            thirdLabel.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -20)
        ])
    }
    
    /*
        Both NSAttributedString and NSMutableAttributedString have the same methods available for usage with UILabel.
        Since NSMutableAttributedString is a subclass of NSAttributedString,
        it inherits all the methods and properties of its superclass.
     
        default way of initiating UILabel:
        -   Simple
        -   No complex formatting
     
        NSAttributedString:
        -   Pros: Advanced text styling
        -   Cons: Immutable, cannot be modified after initiated
     
        NSMutableAttributedString:
        -   Pros: Has the same styling capabilities as NSAttributedString, mutable
        -   Cons: Computationally expensive on frequent changes, complex, potebtial bugs and mistakes, not-all-platform-compatible
     */
}

