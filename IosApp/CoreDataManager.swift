//
//  CoreDataManager.swift
//  IosApp
//
//  Created by TestPc on 24.9.22.
//


import Foundation
import CoreData

class CoreDataManager {
    
    let persistentContainer: NSPersistentContainer
    
    static let shared = CoreDataManager()
    
    private init() {
        persistentContainer = NSPersistentContainer(name: "GardenModel")
        persistentContainer.loadPersistentStores { description, error in
            if let error = error {
                fatalError("Failed to initialize Core Data \(error)")
            }
        }
        
        let directories = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        print(directories[0])
    }
    
    var viewContext: NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    
    var backgroundContext: NSManagedObjectContext {
           return persistentContainer.newBackgroundContext()
    }		
    
    func save() throws {
        do {
            try viewContext.save()
        } catch {
            print(error)
        }
    }
    
    func importData() async throws {
        
        func removeAllData() {
            
            let request: NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: "Vegetable")
            let deleteRequest = NSBatchDeleteRequest(fetchRequest: request)
            
            do {
                try viewContext.execute(deleteRequest)
            } catch {
                print(error)
            }
        }
        
        let vegetableDTOs = try await ApiCall().getAllVegetables(url: Constants.Urls.getAllVegetables)
        
        // remove existing data
        removeAllData()
        
        // insert vegetables in the database
        for vegetableDTO in vegetableDTOs {
            
            try await backgroundContext.perform {
                let vegetable = Vegetable(context: self.viewContext)
                vegetable.vegetableId = Int32(vegetableDTO.vegetableId)
                vegetable.name = vegetableDTO.name
                vegetable.vegetableDescription = vegetableDTO.description
                vegetable.seedDepth = vegetableDTO.seedDepth
                vegetable.thumbnailImage = vegetableDTO.thumbnailImage
                vegetable.growingSoilTemp = vegetableDTO.growingSoilTemp
                vegetable.sowingDescription = vegetableDTO.sowingDescription
                vegetable.growingDescription = vegetableDTO.growingDescription
                vegetable.badCompanions = vegetableDTO.badCompanions
                vegetable.goodCompanions = vegetableDTO.goodCompanions
                vegetable.season = vegetableDTO.season
                vegetable.daysToHarvestSeeds = Int32(vegetableDTO.daysToHarvestSeeds)
                vegetable.light = vegetableDTO.light
                vegetable.watering = vegetableDTO.watering
                
                try self.save()
            }
            
        }
        
        
    }
    
}
