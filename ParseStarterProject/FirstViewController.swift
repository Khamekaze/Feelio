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
    
    @IBOutlet weak var noInternetLabel: UILabel!
    
    @IBOutlet weak var shakeImage2: UIImageView!

    @IBOutlet weak var shakeImage1: UIImageView!
    
    var season = String()
    var bgColor = String()
    var randomGif = UInt32()
    var randomId = String()
    var p2CategoryButton = String()
    var clicked = Bool()

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
        var g = Giphy(apiKey: "dc6zaTOxFJmzC")

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
        
        //loadHeaderGif()
        
        self.season = "cats"

        let query = PFQuery(className:"Season")
        query.getObjectInBackgroundWithId("FM2qfTOgGM") {
            (parseSeason: PFObject?, error: NSError?) -> Void in
            if error == nil && parseSeason != nil {
                
                self.season = parseSeason!["season"] as! String
            } else {
                print(error)
                self.season = "cats"
            }
        }
        
        if self.season == "cats" {
            seasonImage.image = UIImage(named: "catsbuttonstor2")
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
    
    func loadHeaderGif() {
        randomGif = arc4random_uniform(7)
        
        if randomGif == 0{
            self.randomId = "eXK5SYAr8BPhu"
        }else if randomGif == 1 {
            self.randomId = "yGE50nEVxqjFC"
        }else if randomGif == 2 {
            self.randomId = "26tPghhb310muUkEw"
        }else if randomGif == 3 {
            self.randomId = "xHlEA4pIxaGZi"
        }else if randomGif == 4 {
            self.randomId = "102mqDgAb4Kfug"
        }else if randomGif == 5 {
            self.randomId = "WoYwgrfZP4yw8"
        }else if randomGif == 6 {
            self.randomId = "rDE9JAGSfRkzK"
        }else if randomGif == 7 {
            self.randomId = "dASc6rD8EOXEQ"
        }
        
        print("Random Gif" + String(randomGif))
        
        g.gif(self.randomId) { gif, err in
            
            if(err == nil) {
                let json = JSON((gif?.json)!)
                let urlString = "http://media4.giphy.com/media/" + self.randomId + "/giphy.gif"
                let url: NSURL = NSURL(string: urlString)!
                print(url)
                dispatch_async(dispatch_get_main_queue(), {
                    self.gifImageViewFirstPage.image = UIImage.animatedImageWithAnimatedGIFURL(url)
                    self.gifImageViewFirstPage.startAnimating()
                    self.noInternetLabel.hidden = true
                })
            } else {
                dispatch_async(dispatch_get_main_queue(), {
                    print("NO INTERNET")
                    self.gifImageViewFirstPage.stopAnimating()
                    self.noInternetLabel.hidden = false
                    self.loadOfflineGif()
                })
            }
            
        }
        
    }
    
    func loadOfflineGif() {
        var imageList = [UIImage]()
        for var i = 0; i < 99; i++ {
            if(i < 10) {
                let frameName = String(format: "NoInternet00%d", i)
                imageList.append(UIImage(named: frameName)!)
            } else {
                let frameName = String(format: "NoInternet0%d", i)
                imageList.append(UIImage(named: frameName)!)
            }
        }
        self.gifImageViewFirstPage.image = UIImage.animatedImageWithImages(imageList, duration: 3.0)
        //self.gifImageViewFirstPage.animationImages = imageList
        self.gifImageViewFirstPage.startAnimating()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        loadHeaderGif()
        clicked = false
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
        if(!clicked) {
            clicked = true
            self.gifImageViewFirstPage.stopAnimating()
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
        
    }
    func button4Tap(){
        if(!clicked) {
            clicked = true
            self.gifImageViewFirstPage.stopAnimating()
            print("button Happy pressed")
            self.searchTag = [String]()
            searchTag.append("happy")
            searchTag.append("glad")
            searchTag.append("joy")
            bgColor = "green"
            performSegueWithIdentifier("secondViewController", sender: self)
            //stopTimers()
        }
        
    }
    func button3Tap(){
        if(!clicked) {
            clicked = true
            self.gifImageViewFirstPage.stopAnimating()
            print("button Romantic pressed")
            self.searchTag = [String]()
            searchTag.append("romantic")
            searchTag.append("love")
            bgColor = "purple"
            performSegueWithIdentifier("secondViewController", sender: self)
            //stopTimers()
        }
        
    }
    func button2Tap(){
        if(!clicked) {
            clicked = true
            self.gifImageViewFirstPage.stopAnimating()
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
        
    }
    func button5Tap(){
        if(!clicked) {
            clicked = true
            self.gifImageViewFirstPage.stopAnimating()
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
        
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        let destinationVC = segue.destinationViewController as! ViewController
        destinationVC.searchTag = self.searchTag
        destinationVC.bgColor = self.bgColor
        
        
    }
    

}
