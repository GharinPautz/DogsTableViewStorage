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

class DogTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

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

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // table view is asking data source this question:
        //      How many rows do I put in this section?
        
        // We are only going to have one section
        if section == 0 {
            return dogs.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // table view is asking data source this question:
        //      What cell should I put at this indexPath?
        // indexPath has 2 properties
        //      sectionNumber (we will ignore)
        //      rowNumber (corresponds to array index number)
        let row = indexPath.row
        let dog = dogs[row]
        
        // we want a cell that displays this dog's name and breed
        let cell = tableView.dequeueReusableCell(withIdentifier: "DogCell", for: indexPath) as! DogTableViewCell
        
        // why a reusable cell?
        //      If dogs array had 10000 dogs, iOS creates a pool of reusable cells to display our rows with a nice animation
        
        cell.update(with: dog)
        return cell
    }
    
    /**
     Method called to prepare for segue to Dog Detail View Controller.
     Grabs the dog information from selected row in table view, and stores it in destination's (DogDetailViewController) dogOptional property.
     */
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let identifier = segue.identifier {
            // identify where the segue takes us to
            if identifier == "DetailSegue" {
                // type cast segue's destination to be of type DogDetailViewController
                // This gives us access to DogDetailViewController's properties/methods
                if let dogDetailVC = segue.destination as? DogDetailViewController {
                    // grab index of selected row in table view
                    if let indexPath = tableView.indexPathForSelectedRow {
                        // store dog information for selected dog in variable
                        let dog = dogs[indexPath.row]
                        // send dog information to segue's destination, and store in dogOptional property
                        dogDetailVC.dogOptional = dog
                    }
                }
            }
        }
    }
    
    /**
    Method called to unwind back to DogTable View Controller.
     */
    @IBAction func unwindToDogTableViewController(segue: UIStoryboardSegue) {
        // grab the updated dog from the source view controller (DogDetailViewController)
        if let identifier = segue.identifier {
            if identifier == "SaveUnwindSegue" {
                if let dogDetailVC = segue.source as? DogDetailViewController {
                    if let dog = dogDetailVC.dogOptional {
                        if let indexPath = tableView.indexPathForSelectedRow {
                            dogs[indexPath.row] = dog
                            // force a refresh
                            tableView.reloadData()
                        }
                    }
                }
            }
        }
    }
}

