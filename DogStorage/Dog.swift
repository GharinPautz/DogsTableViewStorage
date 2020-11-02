//
//  Dog.swift
//  DogStorage
//
//  Created by Gharin Pautz on 10/28/20.
//  Copyright © 2020 Gharin Pautz. All rights reserved.
//

import Foundation

// author credit for dog image: <div>Icons made by <a href="https://www.flaticon.com/

// MARK: - Persistent Data Storage
// users expect their data to persist across different runs of the app
// 2 main classsifications of data storage
// 1. local
// 2. remote

// iOS has a few options for local storage...

// 1. UserDefaults: used for storing simple types in a dictionary (e.g. list of key-value pairs)
// great for scoring a game high score or perhaps the volume setting for playing audio in this app

// 2. Archiving: ADS 4.7 reading and writing Codable objects from and to the file system
// it is inefficent for large files because if you onle need to access one object in the file, you still need to load/save the entire file

// 3. SQLite Databsae: is a lightweight relational database that uses SQL

// 4. Core Data: An Apple framework that is an OOP wrapper for a data store. By default on iOS, data store is a SQLite database

// remote options: backend as a service (BaaS) like Firebase or Realm, or host your own server...

// MARK: - Archiving
// most standard types (like string) conform to the Codable protocol

// 1. get a URL for a dogs.plist file that stores our dog array
// think of a URL like a file path except the application sandbox causes the URL to change (for security purposes)
// 2. Write a static method to save the dogs array to dogs.plist
// 3. write a static method to load the dogs into an array from dogs.plist

class Dog: Codable {
    var name: String
    var breed: String
    var imageName: String
    
    static let pListURL: URL = {
        // this is called an initialization closure
        let documentsDirectoryURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        // userDomainMask refers to the user's home directory
        let fileURL = documentsDirectoryURL.appendingPathExtension("dogs").appendingPathExtension("plist")
            return fileURL
    }()
    
    static func saveDogsToFile(dogs: [Dog]) {
        let encoder = PropertyListEncoder()
        
        if let dogsData = try? encoder.encode(dogs) {
            // dogsData is of type Data (byte representation)
            try? dogsData.write(to: pListURL) 
        }
    }
    
    static func loadDogsFromFile() -> [Dog]? {
        let decoder = PropertyListDecoder()
        
        if let dogsData = try? Data(contentsOf: pListURL), let decodedDogs = try? decoder.decode([Dog].self, from: dogsData) {
            return decodedDogs
        }
        return nil
    }
    
    init(name: String, breed: String) {
        self.name = name
        self.breed = breed
        self.imageName = "dog"
    }
    
    
}
