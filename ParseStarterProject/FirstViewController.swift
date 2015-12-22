//
//  FirstViewController.swift
//  ParseStarterProject-Swift
//
//  Created by David on 2015-12-08.
//  Copyright © 2015 Parse. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    @IBOutlet weak var gifImageViewFirstPage: UIImageView!
    
    
    @IBOutlet weak var shakeImage2: UIImageView!

    @IBOutlet weak var shakeImage1: UIImageView!
    
    var timer1 = NSTimer()
    var timer2 = NSTimer()
    var timer3 = NSTimer()
    var timer4 = NSTimer()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        gifImageViewFirstPage.animationImages = [UIImage]()
        
        for var index = 0; index < 60; index++ {
            let frameName = String(format: "Comp 1_%05d", index)
            gifImageViewFirstPage.animationImages?.append(UIImage(named: frameName)!)
            gifImageViewFirstPage.animationDuration = 2
            gifImageViewFirstPage.startAnimating()
 
            
        }
        
   /*
        timer1 = NSTimer.scheduledTimerWithTimeInterval(7, target: self, selector: "startShake", userInfo: nil, repeats: false)
        timer2 = NSTimer.scheduledTimerWithTimeInterval(7.4, target: self, selector: "startShake2", userInfo: nil, repeats: false)
        */
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.

    }

    override func canBecomeFirstResponder() -> Bool {
        return true
    }
    
    override func motionEnded(motion: UIEventSubtype, withEvent event: UIEvent?) {
        if motion == .MotionShake {
            print("SHAKKKEEESHAKEEE")
            performSegueWithIdentifier("secondViewController", sender: self)
            stopTimers()        }
        
    }
    
    func startShake(){
        print("SHAKE1")
        timer3 = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: "shakeAnimation1", userInfo: nil, repeats: true)
    }
    func startShake2(){
        print("SHAKE2")
        timer4 = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: "shakeAnimation2", userInfo: nil, repeats: true)
    }
    func shakeAnimation1(){
        print("shake1")
        shakeImage1.hidden = false
        shakeImage2.hidden = true
        
    }
    func shakeAnimation2(){
        print("shake2")
        shakeImage1.hidden = true
        shakeImage2.hidden = false
        
    }
    
    func stopTimers(){
        timer1.invalidate()
        timer2.invalidate()
        timer3.invalidate()
        timer4.invalidate()
    }
    
    


}
