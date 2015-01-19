//
//  AddTaskViewController.swift
//  PadovaNews
//
//  Created by Romesh Singhabahu on 17/01/15.
//  Copyright (c) 2015 Romesh Singhabahu. All rights reserved.
//

import UIKit

class AddTaskViewController: UIViewController {
    
    var mainVC: ViewController!
    
    @IBOutlet weak var taskTextField: UITextField!
    @IBOutlet weak var subTaskTextField: UITextField!
    @IBOutlet weak var dueDatePicker: UIDatePicker!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func cancelButtonTapped(sender: UIButton) {
        
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    @IBAction func addTaskButtonTapped(sender: UIButton) {
        
        var task = TaccuinModel (task: taskTextField.text, data: dueDatePicker.date, subTask: subTaskTextField.text)
        
        mainVC.taccuinArray.append (task)
        self.dismissViewControllerAnimated(true, completion: nil)
    
        
    }
    
    
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
