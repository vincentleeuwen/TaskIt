//
//  TaskDetailViewController.swift
//  TaskIt


import UIKit
import Foundation

class TaskDetailViewController: UIViewController {

    var mainVC: ViewController!

    var detailTaskModel: TaskModel!
    
    @IBOutlet weak var taskTextField: UITextField!
    @IBOutlet weak var subTaskTextField: UITextField!
    @IBOutlet weak var dueDatePicker: UIDatePicker!

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        println(self.detailTaskModel)
        
        self.taskTextField.text = self.detailTaskModel.task
        self.subTaskTextField.text = self.detailTaskModel.subTask
        self.dueDatePicker.date = self.detailTaskModel.date
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func cancelButtonPressed(sender: UIBarButtonItem) {
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    @IBAction func editTaskButtonPressed(sender: UIBarButtonItem) {
        var taskDone = TaskModel(task: self.taskTextField.text, subTask: self.subTaskTextField.text, date: self.dueDatePicker.date, isCompleted: false)
        let taskIndex = mainVC.tableView.indexPathForSelectedRow()!.row
        self.mainVC.baseArray[0][taskIndex] = taskDone
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    
    
    
}
