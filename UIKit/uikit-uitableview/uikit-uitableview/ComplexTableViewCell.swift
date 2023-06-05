//
//  ComplexTableViewCell.swift
//  uikit-uitableview
//
//  Created by Sherary Apriliana on 06/06/23.
//

import UIKit

class ComplexTableViewCell: UITableViewCell {
    
    lazy var backView: UIView = {
        let view = UIView(frame: CGRect(x: 10, y: 6, width: self.frame.width - 20, height: 110))
        view.backgroundColor = UIColor.MintCream
        
        return view
    }()
    
    lazy var userImage: UIImageView = {
        let image = UIImageView(frame: CGRect(x: 4, y: 4, width: 104, height: 104))
        image.contentMode = .scaleAspectFill
        
        return image
    }()
    
    lazy var nameLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 116, y: 8, width: backView.frame.width - 116, height: 30))
        label.textAlignment = .left
        label.font = UIFont.boldSystemFont(ofSize: 18)
        
        return label
    }()
    
    lazy var ageLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 116, y: 42, width: backView.frame.width - 116, height: 30))
        label.textAlignment = .left
        
        return label
    }()

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        addSubview(backView)
        backView.addSubview(userImage)
        backView.addSubview(nameLabel)
        backView.addSubview(ageLabel)
    }
    
    override func layoutSubviews() {
        contentView.backgroundColor = UIColor.clear
        backgroundColor = UIColor.clear
        backView.layer.cornerRadius = 5.0
        backView.clipsToBounds = true
        userImage.layer.cornerRadius = 52
        userImage.clipsToBounds = true
    }

}
