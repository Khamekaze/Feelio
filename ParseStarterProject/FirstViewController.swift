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
    
    var searchTag = [String]()
  
    
    @IBOutlet weak var button1: UIView!
    @IBOutlet weak var button2: UIView!
    @IBOutlet weak var button3: UIView!
    @IBOutlet weak var button4: UIView!
    @IBOutlet weak var button5: UIView!

    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        let gesture1 = UITapGestureRecognizer(target: self, action: "button1Tap")
        let gesture2 = UITapGestureRecognizer(target: self, action: "button2Tap")
        let gesture3 = UITapGestureRecognizer(target: self, action: "button3Tap")
        let gesture4 = UITapGestureRecognizer(target: self, action: "button4Tap")
        let gesture5 = UITapGestureRecognizer(target: self, action: "button5Tap")
        
        self.button1.addGestureRecognizer(gesture1)
        self.button2.addGestureRecognizer(gesture2)
        self.button3.addGestureRecognizer(gesture3)
        self.button4.addGestureRecognizer(gesture4)
        self.button5.addGestureRecognizer(gesture5)

        
        
        gifImageViewFirstPage.animationImages = [UIImage]()
        
        for var index = 0; index < 60; index++ {
            let frameName = String(format: "Comp 1_%05d", index)
            gifImageViewFirstPage.animationImages?.append(UIImage(named: frameName)!)
            gifImageViewFirstPage.animationDuration = 2
            gifImageViewFirstPage.startAnimating()
 
            
        }
        
        
        timer1 = NSTimer.scheduledTimerWithTimeInterval(7, target: self, selector: "startShake", userInfo: nil, repeats: false)
        timer2 = NSTimer.scheduledTimerWithTimeInterval(7.4, target: self, selector: "startShake2", userInfo: nil, repeats: false)
        
        
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
        timer3 = NSTimer.scheduledTimerWithTimeInterval(0.4, target: self, selector: "shakeAnimation1", userInfo: nil, repeats: true)
    }
    func startShake2(){
        print("SHAKE2")
        timer4 = NSTimer.scheduledTimerWithTimeInterval(0.4, target: self, selector: "shakeAnimation2", userInfo: nil, repeats: true)
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
    


    func button1Tap(){
        print("button Special pressed")
        searchTag.append("cats")
        searchTag.append("panda")
        performSegueWithIdentifier("secondViewController", sender: self)
        stopTimers()
    }
    func button2Tap(){
         print("button Happy pressed")
        searchTag.append("happy")
        searchTag.append("excited")
        searchTag.append("glad")
        searchTag.append("joy")
        performSegueWithIdentifier("secondViewController", sender: self)
        stopTimers()
    }
    func button3Tap(){
         print("button Romantic pressed")
        searchTag.append("romantic")
        searchTag.append("love")
        performSegueWithIdentifier("secondViewController", sender: self)
        stopTimers()
    }
    func button4Tap(){
         print("button Pumped pressed")
        searchTag.append("pumped")
        searchTag.append("thrilled")
        searchTag.append("gains")
        searchTag.append("fight")
        performSegueWithIdentifier("secondViewController", sender: self)
        stopTimers()
    }
    func button5Tap(){
         print("button Rage pressed")
        searchTag.append("rage")
        searchTag.append("frustrated")
        searchTag.append("stressed")
        searchTag.append("angry")
        performSegueWithIdentifier("secondViewController", sender: self)
        stopTimers()
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        var destinationVC = segue.destinationViewController as! ViewController
        destinationVC.searchTag = self.searchTag
        
        
    }
    

}
