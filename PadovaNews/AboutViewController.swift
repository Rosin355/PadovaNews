//
//  AboutViewController.swift
//  PadovaNews
//
//  Created by Romesh Singhabahu on 03/11/14.
//  Copyright (c) 2014 Romesh Singhabahu. All rights reserved.
//

import UIKit
import QuartzCore

class AboutViewController: UIViewController {
    
    
    @IBOutlet weak var slideView: AnimatedMaskLabel!
    @IBOutlet weak var profileImageView: UIView!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // setup gesture recognizer
        
        let swipe = UISwipeGestureRecognizer (target: self, action: "didSlide")
        swipe.direction = .Right
        slideView.addGestureRecognizer(swipe)
        
//         //corner radius per avatar
//        profileImageView.layer.cornerRadius = profileImageView.frame.size.width / 2
//        profileImageView.layer.borderWidth = 5.0
//        profileImageView.layer.borderColor = UIColor.cyanColor().CGColor
//        profileImageView.clipsToBounds = false
        
        

    }
    
    func didSlide(){
        println("Ok slide!")
        let image = UIImageView(image: UIImage(named: "meme"))
        image.center = view.center
        image.center.x += view.bounds.size.width
        view.addSubview(image)
        
        UIView.animateWithDuration(0.33, delay: 0.0, options: nil, animations: {
            self.profileImageView.center.y -= 200.0
            self.slideView.center.y += 200.0
            image.center.x -= self.view.bounds.size.width
            
            }, completion: nil)
        
        UIView.animateWithDuration(0.33, delay: 2.0, options: nil, animations: {
            self.profileImageView.center.y += 200.0
            self.slideView.center.y -= 200.0
            image.center.x += self.view.bounds.size.width
            
            }, completion: {_ in
                image.removeFromSuperview()
        })

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    



}
