//
//  ViewController.swift
//  uikit-uitableview
//
//  Created by Sherary Apriliana on 05/06/23.
//

import UIKit

class TableViewController: UIViewController {
    private var table = UITableView()
    private var catNames = [
        "Fluffy", "Whiskers", "Mittens", "Patches", "Shadow",
        "Smokey", "Ginger", "Coco", "Lucky", "Simba",
        "Max", "Charlie", "Lucy", "Tiger", "Oliver",
        "Milo", "Leo", "Bella", "Luna", "Kitty",
        "Oscar", "Sophie", "Chloe", "Molly", "Misty",
        "Angel", "Lily", "Rocky", "Zoe", "Casper",
        "Princess", "Muffin", "Salem", "Boots", "Jasper",
        "Garfield", "Felix", "Midnight", "Kiki", "Sasha",
        "Missy", "Tigger", "Whiskey", "Callie", "Sammy",
        "Cleo", "Oreo", "Nala", "Patch", "Charlie",
        "Ruby", "Snickers", "Maggie", "Daisy", "Rosie",
        "Whisper", "Toby", "Gizmo", "Misty", "Pepper",
        "Mittens", "Harley", "Luna", "Mickey", "Milo",
        "Ziggy", "Zigzag", "Pumpkin", "Pebbles", "Snickers",
        "Tigger", "Zorro", "Snickers", "Leo", "Molly",
        "Ginger", "Whiskers", "Sammy", "Cocoa", "Charlie",
        "Simba", "Shadow", "Oliver", "Misty", "Bella",
        "Milo", "Lily", "Max", "Lucy", "Coco"
    ]


    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayouts()
        setupConstraints()
        setupStyling()
    }
    
    private func setupLayouts() {
        table.translatesAutoresizingMaskIntoConstraints = false
        table.delegate = self
        table.dataSource = self
        table.register(UITableViewCell.self, forCellReuseIdentifier: "CellUniqueIdentifier")
        table.rowHeight = 50
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

extension TableViewController: UITableViewDataSource {
    // number of rows in the section
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return catNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //Create or reuse a UITableViewCell and configure its contents
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellUniqueIdentifier", for: indexPath)
        cell.backgroundColor = .EnglishViolet
        
        let data = catNames[indexPath.row]
        cell.textLabel?.text = data
        
        return cell
    }
}

extension TableViewController: UITableViewDelegate {
    // handle row selection
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        return
    }
}
