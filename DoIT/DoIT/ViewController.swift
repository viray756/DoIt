//
//  ViewController.swift
//  DoIT
//
//  Created by Jose Viray on 1/27/17.
//  Copyright © 2017 Jose Viray. All rights reserved...
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var tasks :[Task] =  []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tasks = makeTasks()
        
        tableView.dataSource = self
        tableView.delegate = self
    }

    
    // Gives amount of rows in TableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }

    // Puts content into rows
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let task = tasks[indexPath.row]
        if task.important {
            cell.textLabel?.text = "❗️\(task.name)"
        } else {
            cell.textLabel?.text = task.name

        }
        
        return cell
    }

    func makeTasks() -> [Task] {
        let task1 = Task()
        task1.name = "Walk The Dog"
        task1.important = false
        
        let task2 = Task()
        task2.name = "Buy Cheese"
        task2.important = true
        
        let task3 = Task()
        task3.name = "Mow the Lawn"
        task3.important = false
        
        return [task1, task2, task3]
        
}
    // Action function for when add button is tapped (Segue into next View Controller)
    @IBAction func plusTapped(_ sender: Any) {
        performSegue(withIdentifier: "addSegue", sender: nil) // Identifier matches what Segue identifier is from main story board
    }
}

