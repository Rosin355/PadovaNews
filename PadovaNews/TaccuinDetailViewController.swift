//
//  TaccuinDetailViewController.swift
//  PadovaNews
//
//  Created by Romesh Singhabahu on 16/01/15.
//  Copyright (c) 2015 Romesh Singhabahu. All rights reserved.
//

import UIKit

class TaccuinDetailViewController: UIViewController {
    
    var mainVC: ViewController!
    var detailTaccuinModel: TaccuinModel!
    
    @IBOutlet weak var datiTextField: UITextField!
    @IBOutlet weak var subDatiTextField: UITextField!
    @IBOutlet weak var dueDataPicker: UIDatePicker!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.datiTextField.text = detailTaccuinModel.dati
        self.subDatiTextField.text = detailTaccuinModel.subDati
        self.dueDataPicker.date = detailTaccuinModel.data
    
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //permette di tornare indietro al navigation controller quando schiacchi il bottone...
    
    @IBAction func cancelButtonTapped(sender: UIBarButtonItem) {
        
        var task = TaccuinModel(dati: datiTextField.text, subDati: subDatiTextField.text, data: dueDataPicker.date)
        
        mainVC.taccuinArray [mainVC.tableView.indexPathForSelectedRow()!.row] = task
        
        self.navigationController?.popViewControllerAnimated(true)
        
    }

    @IBAction func doneBarButtonPressed(sender: UIBarButtonItem) {
        self.navigationController?.popToRootViewControllerAnimated(true)
    }
   

}
