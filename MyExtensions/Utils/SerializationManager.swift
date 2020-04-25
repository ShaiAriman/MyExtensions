//
//  SerializationManager.swift
//  WToDo
//
//  Created by Admin on 04/05/2018.
//  Copyright © 2018 Admin. All rights reserved.
//

import Foundation
import UIKit

class SerializetionManager {
 
    private let appDataFileName = "sTodoModelData"
    
    private var appDataFileURL : URL? {
        get {
            if var url = try? FileManager.default.url(for: FileManager.SearchPathDirectory.documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true) {
                url = url.appendingPathComponent(appDataFileName)
                return url
            }
            return nil
        }
    }
    
    func saveDataToFileSystem(dataToSave : Data) {
        DispatchQueue.global(qos: .background).async {
            if let url = self.appDataFileURL {
                do {
                    try dataToSave.write(to: url)
                    print("saveDataToFileSystem - Data saved successfuly")
                } catch {
                    print("saveDataToFileSystem - Failed to save Data")
                }
            }
        }
    }
    
    func getDataFromFileSystem() -> Data? {
        var dataToReturn : Data? = nil
        if let url = appDataFileURL {
            if let savedData = try? Data(contentsOf: url) {
                dataToReturn = savedData
                print("getDataFromFileSystem - Data loaded successfuly")
            } else {
                print("getDataFromFileSystem - Failed to load Data")
            }
        }
        return dataToReturn
    }
    
    struct Color : Codable {
        var red : CGFloat = 0.0
        var green : CGFloat = 0.0
        var blue : CGFloat = 0.0
        var alpha : CGFloat = 0.0
        
        public func getColor() -> UIColor {
            return UIColor(red: red, green: green, blue: blue, alpha: alpha)
        }
        
        public mutating func setColor(color : UIColor) {
            color.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        }
    }
}
