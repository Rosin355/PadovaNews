//
//  TaccuìnViewController.swift
//  
//
//  Created by Romesh Singhabahu on 15/01/15.
//
//

import UIKit

class Taccui_nViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var taccuinArray: [TaccuinModel] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let date1 = Date.from(year: 2015, month: 1, day: 13)
        let date2 = Date.from(year: 2014, month: 2, day: 4)
        let date3 = Date.from(year: 2014, month: 12, day: 4)
        
        let dati1 = TaccuinModel(dati: "Studia Inglese", subDati: "Verbi", data: date1)
        let dati2 = TaccuinModel (dati: "Andare a yoga", subDati: "Prana", data: date2)
        let dati3 = TaccuinModel (dati: "Palsetra iscrizione", subDati: "Padova", data: date3)
        
        taccuinArray = [dati1,dati2,dati3]
        
        self.tableView.reloadData()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        
            taccuinArray = taccuinArray.sorted {
            
            (taskOne: TaccuinModel, taskTwo: TaccuinModel) -> Bool in
            return taskOne.data.timeIntervalSince1970 < taskTwo.data.timeIntervalSince1970
        }
        
        
        self.tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "showDetailTaccuin" {
            let detailVC: TaccuinDetailViewController = segue.destinationViewController as TaccuinDetailViewController
            let indexPath = self.tableView.indexPathForSelectedRow()
            let thisTask = taccuinArray [indexPath!.row]
            detailVC.detailTaccuinModel = thisTask
            detailVC.mainVC = self
        } else if segue.identifier == "showTaskAdd" {
            let addTaskVC: AddTaskViewController = segue.destinationViewController as AddTaskViewController
            addTaskVC.mainVC = self
        }
        
    }
    
    // UITableViewDataSource
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return taccuinArray.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let thisTask = taccuinArray [indexPath.row]
        
        var cell: Taccui_nCell = tableView.dequeueReusableCellWithIdentifier("myCell") as Taccui_nCell
        
        cell.taskLabel.text = thisTask.dati
        cell.descriptionLabel.text = thisTask.subDati
        cell.dateLabel.text = Date.toString(date: thisTask.data)
        
        
        return cell
    }
    
    
    // UITableVIewDelegate
    
    func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
        
        println(indexPath.row)
        
        performSegueWithIdentifier("showDetailTaccuin", sender: self)
        
    }
   

}
