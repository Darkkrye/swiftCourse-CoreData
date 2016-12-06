//
//  DataManager.swift
//  MyCoreDataApplication
//
//  Created by etudiant on 16/11/2016.
//  Copyright © 2016 etudiant. All rights reserved.
//

import Foundation
import CoreData

class DataManager: NSObject {
    public static let shared = DataManager()
    
    public var objectContext: NSManagedObjectContext? = nil
    
    private override init() {
        // Création du schéma de la base de données
        if let modelURL = Bundle.main.url(forResource: "MyCoreDataApplication", withExtension: "momd") {
            if let model = NSManagedObjectModel(contentsOf: modelURL) {
                if let storageURL = FileManager.documentURL(childPath: "MyDatabase.db") {
                    print(storageURL)
                    
                    let storeCoordinator = NSPersistentStoreCoordinator(managedObjectModel: model)
                    
                    _ = try? storeCoordinator.addPersistentStore(ofType: NSSQLiteStoreType, configurationName: nil, at: storageURL, options: nil)
                    let context = NSManagedObjectContext(concurrencyType: .privateQueueConcurrencyType)
                    context.persistentStoreCoordinator = storeCoordinator
                    
                    self.objectContext = context
                }
            }
        }
    }
}
