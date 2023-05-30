//
//  extensions.swift
//  uikit-segmentedcontrol-uidatepicker-uipickerview
//
//  Created by Sherary Apriliana on 31/05/23.
//
import UIKit

extension UIColor {
    static let darkBlue = UIColor(red: 0/255, green: 78/255, blue: 137/255, alpha: 1)
    static let customWhite = UIColor(red: 225/255, green: 226/255, blue: 239/255, alpha: 1)
    static let customBlack = UIColor(red: 1/255, green: 21/255, blue: 2/255, alpha: 1)
}

extension UIFont {
    static func nunitoFont(size: CGFloat) -> UIFont {
        guard let customFont = UIFont(name: "NunitoSans_Regular", size: size) else {
            return UIFont.systemFont(ofSize: size)
        }
        
        return customFont
    }
}
