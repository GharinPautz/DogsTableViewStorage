//
//  DogDetailViewController.swift
//  DogStorage
//
//  Created by Gharin Pautz on 10/28/20.
//  Copyright © 2020 Gharin Pautz. All rights reserved.
//

import UIKit

class DogDetailViewController: UIViewController {

    var dogOptional: Dog? = nil
    
    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var breedTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        if let dog = dogOptional {
            nameTextField.text = dog.name
            breedTextField.text = dog.breed
        }
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    
    /**
     This will be called when a segue from Dog Detail View Controller is about to occur.
     When user presses save, the text from the text fields will be stored in name and breed variables, then store them in the current instance of dogOptional.
     */
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        if let identifier = segue.identifier {
            // This means the user pressed "Save"
            if identifier == "SaveUnwindSegue" {
                // Grab the text from the textfields and update current dog
                if let name = nameTextField.text, let breed = breedTextField.text {
                    if let dog = dogOptional {
                        dog.name = name
                        dog.breed = breed
                    }
                }
            }
        }
    }

}
