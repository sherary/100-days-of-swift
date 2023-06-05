//
//  Models.swift
//  uikit-uitableview
//
//  Created by Sherary Apriliana on 06/06/23.
//

import UIKit

class UserModal {
    var userImage: UIImage?
    var name: String?
    var age: String?
    
    init(userImage: UIImage, name: String, age: String) {
        self.userImage = userImage
        self.name = name
        self.age = age
    }
}
