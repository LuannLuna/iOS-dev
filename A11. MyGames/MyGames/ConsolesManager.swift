//
//  ConsolesManager.swift
//  MyGames
//
//  Created by Luann Luna on 30/05/19.
//  Copyright © 2019 luannluna. All rights reserved.
//

import CoreData
class ConsolesManager {
    static let shared = ConsolesManager()
    var consoles: [Console] = []
    
    func loadConsoles(with context: NSManagedObjectContext) {
        let fetchRequest: NSFetchRequest<Console> = Console.fetchRequest()
        let sortDescriptor = NSSortDescriptor(key: "name", ascending: true)
        fetchRequest.sortDescriptors = [sortDescriptor]
        do {
            consoles = try context.fetch(fetchRequest)
        }catch {
            print(error.localizedDescription)
        }
    }
    
    func deleteConsole(index: Int, context: NSManagedObjectContext) {
        context.delete(consoles[index])
        do {
            try context.save()
            consoles.remove(at: index)
        }catch{
            print(error.localizedDescription)
        }
    }
    
    private init() {
        
    }
}
