//
//  ViewController.swift
//  TaskIt
//
//  Created by Vincent van Leeuwen on 19/12/14.
//  Copyright (c) 2014 Vincent van Leeuwen. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var taskArray:[TaskModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let date1 = Date.from(year: 2015, month: 1, day: 4)
        let date2 = Date.from(year: 2015, month: 1, day: 28)
        let date3 = Date.from(year: 2015, month: 2, day: 12)
        
        let task1 = TaskModel(task: "Travel to NZ", subTask: "Take a plane", date: date1)
        let task2 = TaskModel(task: "Walk track", subTask: "Abel Tasman Coastal Track", date: date2)
        let task3 = TaskModel(task: "Willem ophalen", subTask: "Vliegveld Christchurch", date: date3)
        
//        let task1:Dictionary<String,String> = ["task":"Study French", "subtask":"Verbs", "date":"15/01/2015"]
//        let task2:Dictionary<String,String> = ["task":"Walk track", "subtask":"Abel Tasman Track", "date":"28/01/2015"]
//        let task3:Dictionary<String,String> = ["task":"Willem ophalen", "subtask":"Willem ophalen Christchurch", "date":"12/02/2015"]
        taskArray = [task1, task2, task3]

//        println(task1.task)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // do stuff
        if segue.identifier == "showTaskDetail" {
            let detailVC: TaskDetailViewController = segue.destinationViewController as TaskDetailViewController
            let indexPath = self.tableView.indexPathForSelectedRow()
            let thisTask = taskArray[indexPath!.row]
            detailVC.detailTaskModel = thisTask
        }
    }
    
    @IBAction func addTaskTapped(sender: UIBarButtonItem) {
        // do stuff
        self.performSegueWithIdentifier("showTaskAdd", sender: self)
    }
    
    
    
    // UITableViewDataSource
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.taskArray.count
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
//        println(indexPath.row)
        var cell: TaskCell = tableView.dequeueReusableCellWithIdentifier("myCell") as TaskCell
        
        let task = taskArray[indexPath.row]
        cell.taskLabel.text = task.task
        cell.subTaskLabel.text = task.subTask
        cell.dateLabel.text = Date.toString(date: task.date) // "\(task.date)"
        
        return cell
    }
    
    // UITableViewDelegate
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        println(indexPath.row)
        performSegueWithIdentifier("showTaskDetail", sender: self)
        
    }
}

