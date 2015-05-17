//
//  ViewController.swift
//  CoreDataPractice
//
//  Created by Kohei Arai on 5/16/15.
//  Copyright (c) 2015 Kohei Arai. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var people = [NSManagedObject]()
    
    var habits = [NSManagedObject]()
    var habit_logs = [NSManagedObject: [Date]]()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /*** Practice 1 ***/
        
//        // Get context
//        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
//        let managedContext = appDelegate.managedObjectContext!
//        
//        // Make a fetch request
//        let fetchRequest = NSFetchRequest(entityName:"Habit")
//        
//        // Get the result
//        var error: NSError?
//        let fetchedResults = managedContext.executeFetchRequest(fetchRequest, error: &error) as? [NSManagedObject]
//        
//        if let result = fetchedResults {
//            
//            for var i = 0; i < result.count; i++ {
//                var habit = result[i]
//                
//                if let logs = habit.valueForKey("logs") as? NSSet {
//                    var dates = [Date]()
//                    for log in logs {
//                        var year = log.valueForKey("year") as? Int
//                        var month = log.valueForKey("month") as? Int
//                        var day = log.valueForKey("day") as? Int
//                        
//                        var date = Date(year: year, month: month, day: day)
//                        dates.append(date)
//                    }
//                    habit_logs[habit] = dates
//                }
//            }
//        }
        
        /*** Practice 2 ***/

//        // Get context
//        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
//        let managedContext = appDelegate.managedObjectContext!
//        
//        // Get Habit entity
//        let entity =  NSEntityDescription.entityForName("Habit", inManagedObjectContext: managedContext)
//        let habit = NSManagedObject(entity: entity!, insertIntoManagedObjectContext:managedContext)
//
//        // Set created habit attributes
//        habit.setValue("Title10", forKey: "title")
//
//        // Save context
//        var error: NSError?
//        if managedContext.save(&error) {
//            println("Succeed to save")
//        } else {
//            println("Could not save \(error), \(error?.userInfo)")
//        }
  
//         Get context
//        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
//        let managedContext = appDelegate.managedObjectContext!
//        
//        // Create fetch request
//        let fetchRequest = NSFetchRequest(entityName:"Habit")
//        // Create predicate
//        let predicate = NSPredicate(format: "title == 'Title10' ")
//        fetchRequest.predicate = predicate
//
//        // Get result
//        var error: NSError?
//        let fetchedResults = managedContext.executeFetchRequest(fetchRequest, error: &error) as? [NSManagedObject]
//        
//        var habit: NSManagedObject
//        
//        if let results = fetchedResults {
//            habit = results[0]
//        } else {
//            println("Could not fetch \(error), \(error!.userInfo)")
//            return
//        }
//
//        // Create log entity
//        let logEntity =  NSEntityDescription.entityForName("Log", inManagedObjectContext: managedContext)
//        let log = NSManagedObject(entity: logEntity!, insertIntoManagedObjectContext:managedContext)
//        log.setValue(12, forKey: "day")
//        log.setValue(13, forKey: "year")
//        log.setValue(14, forKey: "month")
//        
//        // Set created log to habit
//        habit.setValue(NSSet(object: log), forKey: "logs")
//        
//        // Save context
//        if managedContext.save(&error) {
//            println("Succeed to save")
//        } else {
//            println("Could not save \(error), \(error?.userInfo)")
//        }
        
        /*** Practice 3 ***/
        
//        // Get context
//        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
//        let managedContext = appDelegate.managedObjectContext!
//        
//        // Create fetch request
//        let fetchRequest = NSFetchRequest(entityName:"Habit")
//        // Create predicate
//        let predicate = NSPredicate(format: "title == 'Title10' ")
//        fetchRequest.predicate = predicate
//        
//        // Get result
//        var error: NSError?
//        let fetchedResults = managedContext.executeFetchRequest(fetchRequest, error: &error) as? [NSManagedObject]
//        
//        if let results = fetchedResults {
//            var habit = results[0]
//            println(habit.valueForKey("title"))
//            println(habit.valueForKey("logs")?.valueForKey("year"))
//            println(habit)
//            println(habit.valueForKey("logs"))
//        } else {
//            println("Could not fetch \(error), \(error!.userInfo)")
//            return
//        }
        
        var start = NSDate()
        
        /*** Practice 4 ***/
        // Get context
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext!

        // Create fetch request
        let fetchRequest = NSFetchRequest(entityName:"Habit")
        // Create predicate
        let predicate = NSPredicate(format: "title == 'Title10' ")
        fetchRequest.predicate = predicate

        // Get result
        var error: NSError?
        let fetchedResults = managedContext.executeFetchRequest(fetchRequest, error: &error) as? [NSManagedObject]

        var habit: NSManagedObject
        if let results = fetchedResults {
            habit = results[0]
        } else {
            return
        }
        
        // Create fetch request
        let fetchRequest2 = NSFetchRequest(entityName:"Log")
        let predicate2 = NSPredicate(format: " habit == %@ ", habit)
        fetchRequest2.predicate = predicate2

        // Get result
        let fetchedResults2 = managedContext.executeFetchRequest(fetchRequest2, error: &error) as? [NSManagedObject]
        
        if let results = fetchedResults2 {
            for log in results {
                NSLog("year: %d, month: %d, day: %d", (log.valueForKey("year") as? Int)!, (log.valueForKey("month") as? Int)!, (log.valueForKey("day") as? Int)!)
            }
        } else {
            return
        }

        
        var end = NSDate()
        
        println(end.timeIntervalSinceDate(start))

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        //1
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext!

        //2
        let fetchRequest = NSFetchRequest(entityName:"Person")
//        let predicate = NSPredicate(format: "name CONTAINS 'search' ")
//        fetchRequest.predicate = predicate
        
        //3
        var error: NSError?
        let fetchedResults = managedContext.executeFetchRequest(fetchRequest, error: &error) as? [NSManagedObject]
        
        if let results = fetchedResults {
            people = results
        } else {
            println("Could not fetch \(error), \(error!.userInfo)")
        }
    }

    @IBAction func addPushed(sender: AnyObject) {
        
        var alert = UIAlertController(
            title: "New name",
            message: "Add a new name",
            preferredStyle: .Alert)
        
        let saveAction = UIAlertAction(
            title: "Save",
            style: .Default) { (action: UIAlertAction!) -> Void in
                
                let textField = alert.textFields![0] as! UITextField
                self.saveName(textField.text)
                self.tableView.reloadData()
        }
        
        let cancelAction = UIAlertAction(
            title: "Cancel",
            style: .Default) { (action: UIAlertAction!) -> Void in
        }
        
        alert.addTextFieldWithConfigurationHandler {
            (textField: UITextField!) -> Void in
        }
        
        alert.addAction(cancelAction)
        alert.addAction(saveAction)
        
        presentViewController(alert,
            animated: true,
            completion: nil)
    }
    
    @IBAction func deletePushed(sender: AnyObject) {
        //1
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext!

        let fetchRequest = NSFetchRequest(entityName:"Person")
        let predicate = NSPredicate(format: "name CONTAINS 'delete'")
        fetchRequest.predicate = predicate
        
        var error: NSError?
        let fetchedResults = managedContext.executeFetchRequest(fetchRequest, error: &error) as? [NSManagedObject]
        
        for obj in fetchedResults! {
            managedContext.deleteObject(obj)
        }
        
        if !managedContext.save(&error) {
            println("Could not save \(error), \(error?.userInfo)")
        }

        if !managedContext.save(&error) {
            println("Could not save \(error), \(error?.userInfo)")
        }
    }
    
    func saveName(name: String) {
        //1
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext!
        
        //2
        let entity =  NSEntityDescription.entityForName("Person", inManagedObjectContext: managedContext)
        let person = NSManagedObject(entity: entity!, insertIntoManagedObjectContext:managedContext)
        
        //3
        person.setValue(name, forKey: "name")
        
        //4
        var error: NSError?
        if !managedContext.save(&error) {
            println("Could not save \(error), \(error?.userInfo)")
        }  
        //5
        people.append(person)
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        println("prepare for segue")
    }
    
    @IBAction func unwindToViewController(segue: UIStoryboardSegue) {
        
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return people.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell") as! UITableViewCell
        let person = people[indexPath.row]
        
        cell.textLabel!.text = person.valueForKey("name") as? String
        
        return cell
    }
}