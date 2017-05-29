//
//  AppDelegate.swift
//  MyBugdet
//
//  Created by Maahi on 08/01/17.
//  Copyright © 2017 Maahi. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        
//        var myArrayOfDict: NSArray = [
//            ["catid": "1", "cattitle": "Income from Salary","catdefaultstatus": "abc", "cattype": "income"],
//            ["catid": "2", "cattitle": "Income from Wages","catdefaultstatus": "abc", "cattype": "income"],
//            ["catid": "3", "cattitle": "Income from Family","catdefaultstatus": "abc", "cattype": "income"],
//            ["catid": "4", "cattitle": "Income from Student  Loan","catdefaultstatus": "abc", "cattype": "income"],
//            ["catid": "5", "cattitle": "Automobile / Travel","catdefaultstatus": "abc", "cattype": "expense"],
//            ["catid": "6", "cattitle": "Bills","catdefaultstatus": "abc", "cattype": "expense"],
//            ["catid": "7", "cattitle": "Clothing","catdefaultstatus": "abc", "cattype": "expense"],
//            ["catid": "8", "cattitle": "Food & Dining","catdefaultstatus": "abc", "cattype": "expense"],
//            ["catid": "9", "cattitle": "Healthcare","catdefaultstatus": "abc", "cattype": "expense"],
//            ["catid": "10", "cattitle": "Housing","catdefaultstatus": "abc", "cattype": "expense"],
//            
//            ]
        let documentsPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
        print("documentsPath! \(documentsPath)")
       // self.inseartData()
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        // Saves changes in the application's managed object context before the application terminates.
        self.saveContext()
    }

    // MARK: - Core Data stack

    lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
        */
        let container = NSPersistentContainer(name: "MyBugdet")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                 
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    // MARK: - Core Data Saving support

    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }

    
    
    
    func inseartData()  {
        
        
        var myArrayOfDict: NSArray = [
            ["catid": "1", "cattitle": "Income from Salary","catdefaultstatus": "1", "cattype": "income"],
            ["catid": "2", "cattitle": "Income from Wages","catdefaultstatus": "1", "cattype": "income"],
            ["catid": "3", "cattitle": "Income from Family","catdefaultstatus": "1", "cattype": "income"],
            ["catid": "4", "cattitle": "Income from Student  Loan","catdefaultstatus": "1", "cattype": "income"],
            ["catid": "5", "cattitle": "Automobile / Travel","catdefaultstatus": "1", "cattype": "expense"],
            ["catid": "6", "cattitle": "Bills","catdefaultstatus": "1", "cattype": "expense"],
            ["catid": "7", "cattitle": "Clothing","catdefaultstatus": "1", "cattype": "expense"],
            ["catid": "8", "cattitle": "Food & Dining","catdefaultstatus": "1", "cattype": "expense"],
            ["catid": "9", "cattitle": "Healthcare","catdefaultstatus": "1", "cattype": "expense"],
            ["catid": "10","cattitle": "Housing","catdefaultstatus": "1", "cattype": "expense"],
            
        ]
        
        
        
        
        
        
        let context = self.persistentContainer.viewContext
        //retrieve the entity that we just created
        let entity =  NSEntityDescription.entity(forEntityName: "Category", in: context)
        
        
        //for var index in stride(from: 0, to: 10, by: 1)
        for (index, element) in myArrayOfDict.enumerated()
        {
            let manageobj = NSManagedObject(entity: entity!, insertInto: context)
            let dict = myArrayOfDict[0] as? Dictionary<String,AnyObject>
            
            print("saved! \(element)")
            //set the entity values
            manageobj.setValue (Int (dict?["catid"]as!String) ,forKey:"catid")
            manageobj.setValue(dict?["cattitle"]as!String, forKey: "cattitle")
            manageobj.setValue(Int (dict?["catdefaultstatus"]as!String), forKey: "catdefaultstatus")
            manageobj.setValue(dict?["cattype"]as!String, forKey: "cattype")
            
            //save the object
            do {
                try context.save()
                print("saved!")
            } catch let error as NSError  {
                print("Could not save \(error), \(error.userInfo)")
            } catch {
                
            }
        }
        
       
        
        
        
        
        
        
    }
    
    
    
    
    
}

