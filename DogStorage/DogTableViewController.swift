//
//  ViewController.swift
//  DogStorage
//
//  Created by Gharin Pautz on 10/28/20.
//  Copyright © 2020 Gharin Pautz. All rights reserved.
//

import UIKit

// MARK: - Table Views
// a table view is a list of cells
// 2 ways to set up a view controller with a table view
// 1. "Manual" - add a table view to our scene, then register VC as the data source and delegate for our table view
// 2. use a UITableViewController which abstracts a lot of management for us
//      In method 2, the root view is the table view, so you can't add additional views to your scene

// This design utilizes method 1

class DogTableViewController: UIViewController {

    var dogs = [Dog]()
    
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        initializeDogs()
    }
    
    func initializeDogs() {
        dogs.append(Dog(name: "Abigail", breed: "Labrador Retriever"))
        dogs.append(Dog(name: "Sampson", breed: "Dauchsund"))
        dogs.append(Dog(name: "Daphne", breed: "Golden Doodle"))
    }


}

