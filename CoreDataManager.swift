//
//  CoreDataManager.swift
//  loginPage
//
//  Created by 점승현 on 11/9/24.
//

import CoreData
import UIKit

class CoreDataManager {

    static let shared = CoreDataManager()
    private init() {}
    
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "loginPage")
        container.loadPersistentStores { storeDescription, error in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        }
        return container
    }()
    
    var context: NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    
    // MARK: - CRUD
    
    func createUser(id: String, email: String, password: String, name: String) -> User? {
        let user = User(context: context)
        user.id = id
        user.email = email
        user.password = password
        user.name = name
        
        saveContext()
        print("Created user: \(user.name ?? "No name")")
        return user
    }

    func fetchUsers() -> [User] {
        let fetchRequest: NSFetchRequest<User> = User.fetchRequest()
        
        do {
            let users = try context.fetch(fetchRequest)
            print("Fetched users: \(users.map { $0.name ?? "No name" })") 
            return users
        } catch {
            print("Failed to fetch users: \(error)")
            return []
        }
    }

    
    func updateUser(user: User, newEmail: String?, newPassword: String?, newName: String?) {
        if let email = newEmail { user.email = email }
        if let password = newPassword { user.password = password }
        if let name = newName { user.name = name }
        
        saveContext()
    }
    
    func deleteUser(user: User) {
        context.delete(user)
        saveContext()
    }
    
    // MARK: - SAVE
    func saveContext() {
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                print("Failed to save context: \(nserror.localizedDescription)")
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
}
