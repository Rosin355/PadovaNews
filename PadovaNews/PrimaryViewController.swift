//
//  PrimaryViewController.swift
//  PadovaNews
//
//  Created by Romesh Singhabahu on 14/10/14.
//  Copyright (c) 2014 Romesh Singhabahu. All rights reserved.
//

import UIKit

class PrimaryViewController: UIViewController {
    
    @IBOutlet weak var funFactLabel: UILabel!
    @IBOutlet weak var iconLabel: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    @IBOutlet weak var precipitationLabel: UILabel!
    @IBOutlet weak var refreshButton: UIButton!
    @IBOutlet weak var refreshActivityIndicator: UIActivityIndicatorView!
    
    
    //@IBOutlet weak var summeryLabel: UILabel!
    
    
    
    
    let factBook = FactBook()
    
    private let apiKey = "99601178e7d3451d1aa8a712c7286e91"
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
       
        
        
        refreshActivityIndicator.hidden = true
        getCurrentWeatherData()
        
        
        // in questo modo faccio si che diventi il First Responder per il shake event
        self.becomeFirstResponder()
        
        funFactLabel.text = factBook.randomFact()
        
        NSTimer.scheduledTimerWithTimeInterval(7.0, target: self, selector: Selector("showFunFact"), userInfo: nil, repeats: true)
        
        //45.402554, 11.877080 per padova latidudine e longitudine
        //NSURL call method
        
        let baseURL = NSURL(string: "https://api.forecast.io/forecast/\(apiKey)/")
        
        let forecastURL = NSURL (string: "45.402554,11.877080", relativeToURL: baseURL)
        
        let sharedSession = NSURLSession.sharedSession()
        let downloadTask : NSURLSessionDownloadTask = sharedSession.downloadTaskWithURL(forecastURL!, completionHandler: { (location: NSURL!, response:NSURLResponse!, error: NSError!) -> Void in
            
            if (error == nil){
                let dataObject = NSData(contentsOfURL: location)
                let weatherDictionary: NSDictionary = NSJSONSerialization.JSONObjectWithData(dataObject!, options: nil, error: nil) as NSDictionary
                
                let currentWeather = current(weatherDictionary: weatherDictionary)
                
                dispatch_async(dispatch_get_main_queue(), { () -> Void in
                    self.temperatureLabel.text = "\(currentWeather.temperature)"
                    self.iconLabel.image = currentWeather.icon!
                    self.humidityLabel.text = "\(currentWeather.humidity)"
                    self.precipitationLabel.text = "\(currentWeather.precipProbablity)"
                    //self.summeryLabel.text = "\(currentWeather.summery)"
                    
                    //Stop refresh animation
                    
                    self.refreshActivityIndicator.stopAnimating()
                    self.refreshActivityIndicator.hidden = false
                    self.refreshButton.hidden = false
                    
                    
                })
                
            } else {
                
                let networkIssueController = UIAlertController (title: "Attento!", message: "Ocio non ghe se connesìon. I dati no se corretti.", preferredStyle: .Alert)
                let okButton = UIAlertAction (title: "Va bon!", style: .Default, handler: nil)
                networkIssueController.addAction(okButton)
                let cancelButton = UIAlertAction (title: "Cancea", style: .Cancel, handler: nil)
                networkIssueController.addAction(cancelButton)
                
                self.presentViewController(networkIssueController, animated: true, completion: nil)
            }
            
        })
        downloadTask.resume()
        
        
    }
    
   
    
    // dati mentre l'activity indicator è in azione
    
    func getCurrentWeatherData () -> Void {
        
        let baseURL = NSURL(string: "https://api.forecast.io/forecast/\(apiKey)/")
        
        let forecastURL = NSURL (string: "45.402554,11.877080", relativeToURL: baseURL)
        
        let sharedSession = NSURLSession.sharedSession()
        let downloadTask : NSURLSessionDownloadTask = sharedSession.downloadTaskWithURL(forecastURL!, completionHandler: { (location: NSURL!, response:NSURLResponse!, error: NSError!) -> Void in
            
            if (error == nil){
                let dataObject = NSData(contentsOfURL: location)
                let weatherDictionary: NSDictionary = NSJSONSerialization.JSONObjectWithData(dataObject!, options: nil, error: nil) as NSDictionary
                
                let currentWeather = current(weatherDictionary: weatherDictionary)
                
                dispatch_async(dispatch_get_main_queue(), { () -> Void in
                    self.temperatureLabel.text = "\(currentWeather.temperature)"
                    self.iconLabel.image = currentWeather.icon!
                    self.humidityLabel.text = "\(currentWeather.humidity)"
                    self.precipitationLabel.text = "\(currentWeather.precipProbablity)"
                    //self.summeryLabel.text = "\(currentWeather.summery)"
                    
                    //Stop refresh animation
                    
                    self.refreshActivityIndicator.stopAnimating()
                    self.refreshActivityIndicator.hidden = true
                    self.refreshButton.hidden = false
                    
                    
                })
                
            } else {
                
                let networkIssueController = UIAlertController (title: "Attento!", message: "Ocio non ghe se connesìon. I dati no se corretti.", preferredStyle: .Alert)
                let okButton = UIAlertAction (title: "Va bon!", style: .Default, handler: nil)
                networkIssueController.addAction(okButton)
                let cancelButton = UIAlertAction (title: "Cancea", style: .Cancel, handler: nil)
                networkIssueController.addAction(cancelButton)
                
                self.presentViewController(networkIssueController, animated: true, completion: nil)
            }
            
        })
        downloadTask.resume()
        
    }
    
    @IBAction func refresh() {
        
        // ogni volta che fai refresh dei dati mi manda nuovi aggiornamenti
        getCurrentWeatherData()
        
        refreshButton.hidden = true
        refreshActivityIndicator.hidden = false
        refreshActivityIndicator.startAnimating()
        
    }
    
    override func canBecomeFirstResponder() -> Bool {
        
        return true
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    @IBAction func showFunFact(){
        self.funFactLabel.fadeOut(completion: {
            (finished: Bool) -> Void in
        })
        // ricordati di mettere questa estensione per il fadein e fadeout...come vedi qui sotto...
        self.funFactLabel.text = factBook.randomFact()
        self.funFactLabel.fadeIn()
        
    }
    
    override func motionEnded(motion: UIEventSubtype, withEvent event: UIEvent) {
        if(event.subtype == UIEventSubtype.MotionShake) {
            showFunFact()
        }
        
        
        
    }
    
    // controller dismiss action per AboutViewController.
    @IBAction func unwindToViewController (sender: UIStoryboardSegue) {
        
    }
    
    
    
}
