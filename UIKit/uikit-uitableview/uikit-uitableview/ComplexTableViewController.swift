//
//  ComplexTableViewController.swift
//  uikit-uitableview
//
//  Created by Sherary Apriliana on 06/06/23.
//

import UIKit

class ComplexTableViewController: UIViewController {
    
    private var table = UITableView()
    private var userArr = [UserModal]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupLayouts()
        setupConstraints()
        setupStyling()
        
        userArr.append(UserModal(userImage:   UIImage(systemName: "hand.thumbsdown.fill")!, name: "Amber Heard", age: "32"))
        userArr.append(UserModal(userImage:   UIImage(systemName: "eyes.inverse")!, name: "Emma Stone", age: "30"))
        userArr.append(UserModal(userImage:   UIImage(systemName: "figure.wave")!, name: "Natalie Portman", age: "37"))
        userArr.append(UserModal(userImage:   UIImage(systemName: "figure.dance")!, name: "Emma Watson", age: "28"))
        userArr.append(UserModal(userImage:   UIImage(systemName: "mouth.fill")!, name: "Angelina Jolie", age: "43"))
        userArr.append(UserModal(userImage:   UIImage(systemName: "lightbulb.fill")!, name: "Scarlett Johansson", age: "34"))
        userArr.append(UserModal(userImage:   UIImage(systemName: "poweroutlet.type.b.fill")!, name: "Jennifer Lawrence", age: "28"))
        userArr.append(UserModal(userImage:   UIImage(systemName: "apple.logo")!, name: "Charlize Theron", age: "43"))
    }

    private func setupLayouts() {
        self.title = "Cat"
        
        table.translatesAutoresizingMaskIntoConstraints = false
        table.delegate = self
        table.dataSource = self
        table.register(UITableViewCell.self, forCellReuseIdentifier: "Cat")
//        table.rowHeight = 50
        table.separatorStyle = .singleLine
        table.separatorInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        table.allowsSelection = true
        
        view.addSubview(table)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            table.widthAnchor.constraint(equalToConstant: 360),
            table.heightAnchor.constraint(equalToConstant: 700),
            table.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            table.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
        ])
    }
    
    private func setupStyling() {
        table.layer.cornerRadius = 8.0
        table.separatorColor = .MintCream
        
        view.backgroundColor = UIColor.SelectiveYellow
    }
}

extension ComplexTableViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        return
    }
}

extension ComplexTableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cat", for: indexPath) as! ComplexTableViewCell
        
        cell.userImage.image = userArr[indexPath.row].userImage
        cell.nameLabel.text = userArr[indexPath.row].name
        cell.ageLabel.text = userArr[indexPath.row].age
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
}
