//
//  secondViewController.swift
//  CoreDataPractice
//
//  Created by Kohei Arai on 5/16/15.
//  Copyright (c) 2015 Kohei Arai. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class secondViewController: UIViewController {
    
    var habits = [NSManagedObject]()
    var habit_logs = [NSManagedObject: [Date]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        var start = NSDate()
//        
//        // Get context
//        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
//        let managedContext = appDelegate.managedObjectContext!
//
//        // Get entity
//        let habitEntity =  NSEntityDescription.entityForName("Habit", inManagedObjectContext: managedContext)
//        let logEntity =  NSEntityDescription.entityForName("Log", inManagedObjectContext: managedContext)
//
//        // Add NSManagedObject to Context
//        for var i = 0; i < 10; i++ {
//            let habit = NSManagedObject(entity: habitEntity!, insertIntoManagedObjectContext:managedContext)
//            habit.setValue("Title\(i)", forKey: "title")
//            
//            var logs = NSMutableSet()
//            for var j = 0; j < 100; j++ {
//                let log = NSManagedObject(entity: logEntity!, insertIntoManagedObjectContext:managedContext)
//                log.setValue(j, forKey: "day")
//                log.setValue(j + 1, forKey: "year")
//                log.setValue(j + 2, forKey: "month")
//                
//                logs.addObject(log)
//            }
//
//            habit.setValue(logs, forKey: "logs")
//        }
//
//        // Save
//        var error: NSError?
//        if !managedContext.save(&error) {
//            println("Could not save \(error), \(error?.userInfo)")
//        }
//        
//        var end = NSDate()
//        
//        println(end.timeIntervalSinceDate(start))

    }
    
    @IBAction func addDate(sender: AnyObject) {
        
        var start = NSDate()
        
        // Get context
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext!

        // Make a fetch request
        let fetchRequest = NSFetchRequest(entityName:"Habit")

        // Get the result
        var error: NSError?
        let fetchedResults = managedContext.executeFetchRequest(fetchRequest, error: &error) as? [NSManagedObject]

        if let result = fetchedResults {
            
            for var i = 0; i < result.count; i++ {
                var habit = result[i]
                
                if let logs = habit.valueForKey("logs") as? NSSet {
                    var dates = [Date]()
                    for log in logs {
                        var year = log.valueForKey("year") as? Int
                        var month = log.valueForKey("month") as? Int
                        var day = log.valueForKey("day") as? Int
                        
                        var date = Date(year: year, month: month, day: day)
                        dates.append(date)
                    }
                    habit_logs[habit] = dates
                }
            }
        }

        var end = NSDate()
        
        println(end.timeIntervalSinceDate(start))
        
    }
    
}