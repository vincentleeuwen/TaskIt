//
//  TaskDetailViewController.swift
//  TaskIt
//
//  Created by Vincent van Leeuwen on 23/12/14.
//  Copyright (c) 2014 Vincent van Leeuwen. All rights reserved.
//

import UIKit
import Foundation

class TaskDetailViewController: UIViewController {

    var detailTaskModel: TaskModel!
    @IBOutlet weak var taskTextField: UITextField!
    @IBOutlet weak var subTaskTextField: UITextField!
    @IBOutlet weak var dueDatePicker: UIDatePicker!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
//        println(self.detailTaskModel.task)
        
        self.taskTextField.text = self.detailTaskModel.task
        self.subTaskTextField.text = self.detailTaskModel.subTask
        self.dueDatePicker.date = self.detailTaskModel.date
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
