//
//  FirstViewController.swift
//  ParseStarterProject-Swift
//
//  Created by David on 2015-12-08.
//  Copyright © 2015 Parse. All rights reserved.
//

import UIKit
import Parse
import ImageIO

class FirstViewController: UIViewController {
    @IBOutlet weak var gifImageViewFirstPage: UIImageView!
    
    
    @IBOutlet weak var shakeImage2: UIImageView!

    @IBOutlet weak var shakeImage1: UIImageView!
    
    var season = String()
    var bgColor = String()
    var randomGif = UInt32()
    var randomId = String()
    var p2CategoryButton = String()

    @IBOutlet weak var seasonImage: UIImageView!
    
    var timer1 = NSTimer()
    var timer2 = NSTimer()
    var timer3 = NSTimer()
    var timer4 = NSTimer()
    
    var searchTag = [String]()
    var g = Giphy(apiKey: "dc6zaTOxFJmzC")
  
    
    @IBOutlet weak var button1: UIView!
    @IBOutlet weak var button2: UIView!
    @IBOutlet weak var button3: UIView!
    @IBOutlet weak var button4: UIView!
    @IBOutlet weak var button5: UIView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       /* randomGif = arc4random_uniform(7)
        if randomGif == 0{
            self.randomId = "http://giphy.com/gifs/zlatan-ibrahimovic-eXK5SYAr8BPhu"
        }else if randomGif == 1 {
            self.randomId = "http://giphy.com/gifs/hilarious-laughing-yGE50nEVxqjFC"
        }else if randomGif == 2 {
            self.randomId = "http://giphy.com/gifs/90s-retro-commercials-26tPghhb310muUkEw"
        }else if randomGif == 3 {
            self.randomId = "http://giphy.com/gifs/frank-eyetalian-ughguhgw-xHlEA4pIxaGZi"
        }else if randomGif == 4 {
            self.randomId = "http://giphy.com/gifs/kittens-because-102mqDgAb4Kfug"
        }else if randomGif == 5 {
            self.randomId = "http://giphy.com/gifs/movie-happy-excited-WoYwgrfZP4yw8"
        }else if randomGif == 6 {
            self.randomId = "http://giphy.com/gifs/adorable-marilyn-monroe-cute-gif-rDE9JAGSfRkzK"
        }else if randomGif == 7 {
            self.randomId = "http://giphy.com/gifs/justin-bieber-dancing-dASc6rD8EOXEQ"
        }
   */
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

        var query = PFQuery(className:"Season")
        query.getObjectInBackgroundWithId("FM2qfTOgGM") {
            (parseSeason: PFObject?, error: NSError?) -> Void in
            if error == nil && parseSeason != nil {
                
                self.season = parseSeason!["season"] as! String
                print(self.season)
            } else {
                print(error)
            }
        }
        
        if self.season == "cats" {
            seasonImage.image = UIImage(named: "catsbutton1")
        }
        
        /*
        if self.season == "christmas" {
            seasonImage.image = UIImage(named: "christmasbutton1")
        }
        if self.season == "valentines" {
            seasonImage.image = UIImage(named: "valentinesbutton1")
        }
        if self.season == "easter" {
            seasonImage.image = UIImage(named: "easterbutton1")
        }
        */
        
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
            let selector = arc4random_uniform(5)
            if(selector == 0) {
                button1Tap()
            } else if(selector == 1) {
                button2Tap()
            } else if(selector == 2) {
                button3Tap()
            } else if(selector == 3) {
                button4Tap()
            } else if(selector == 4) {
                button5Tap()
            }
           // performSegueWithIdentifier("secondViewController", sender: self)
            //stopTimers()
        }
        
    }
    
    /*
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
    
    */

    func button1Tap(){
        print("button Special pressed")
        if(season == "cats") {
            self.searchTag = [String]()
            searchTag.append("cats")
            searchTag.append("cat")
            searchTag.append("kitten")
            searchTag.append("kittens")
            bgColor = "yellow"
        } else if(season == "christmas") {
            //
        } else if(season == "easter") {
            //
        } else if(season == "valentines") {
            //
        }
        performSegueWithIdentifier("secondViewController", sender: self)
        //stopTimers()
    }
    func button4Tap(){
         print("button Happy pressed")
        self.searchTag = [String]()
        searchTag.append("happy")
        searchTag.append("glad")
        searchTag.append("joy")
        bgColor = "green"
        performSegueWithIdentifier("secondViewController", sender: self)
        //stopTimers()
    }
    func button3Tap(){
         print("button Romantic pressed")
        self.searchTag = [String]()
        searchTag.append("romantic")
        searchTag.append("love")
        bgColor = "purple"
        performSegueWithIdentifier("secondViewController", sender: self)
        //stopTimers()
    }
    func button2Tap(){
         print("button Pumped pressed")
        self.searchTag = [String]()
        searchTag.append("pumped")
        searchTag.append("strength")
        searchTag.append("workout")
        searchTag.append("strength")
        bgColor = "blue"
        performSegueWithIdentifier("secondViewController", sender: self)
        //stopTimers()
    }
    func button5Tap(){
         print("button Rage pressed")
        self.searchTag = [String]()
        searchTag.append("rage")
        searchTag.append("frustrated")
        searchTag.append("stressed")
        searchTag.append("mad")
        searchTag.append("angry")
        bgColor = "orange"
        performSegueWithIdentifier("secondViewController", sender: self)
        //stopTimers()
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        var destinationVC = segue.destinationViewController as! ViewController
        destinationVC.searchTag = self.searchTag
        destinationVC.bgColor = self.bgColor
        
        
    }
    

}
