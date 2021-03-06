/**
* Copyright (c) 2015-present, Parse, LLC.
* All rights reserved.
*
* This source code is licensed under the BSD-style license found in the
* LICENSE file in the root directory of this source tree. An additional grant
* of patent rights can be found in the PATENTS file in the same directory.
*/

import UIKit
import Parse
import ImageIO
import SpriteKit
import QuartzCore

class ViewController: UIViewController {
    @IBOutlet weak var noInternetLabel: UILabel!
    
    @IBOutlet weak var swipeImageView: UIImageView!
    
    @IBOutlet weak var loadingImageView: UIImageView!
    
    @IBOutlet weak var swipeButtonUIView: UIView!
    
    @IBOutlet weak var swipeButtonOUTLET: UIButton!
    
    @IBOutlet weak var likeBackgroundView: UIView!
    
    @IBOutlet weak var buttonView: UIView!
    @IBOutlet weak var shareBackgroundView: UIView!
    
    @IBOutlet weak var textImageView: UIImageView!
    

    
    var gifId = String()
    var gifLikes = Int()
    var gifUsers = [String]()
    var gifObjectId = String()
    var backgroundColor = String()
    var gifFound = Bool()
    var searchTag = [String]()
    var globalGifURL = String()
    var bgColor = String()
    
    var clicked = Bool()
    var swiped = Bool()
    
    @IBOutlet weak var dislikeButton: UIButton!
    @IBOutlet weak var likeButton: UIButton!

    @IBOutlet weak var gifImage: UIImageView!
    @IBOutlet weak var button: UIButton!
    var g = Giphy(apiKey: "dc6zaTOxFJmzC")
    
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.makeCircleView(self.swipeButtonUIView)
        self.makeCircleView(self.likeBackgroundView)
        self.makeCircleView(self.shareBackgroundView)
        self.addBorderToImageView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        clicked = false
        swiped = false
        /*
        swipeButtonUIView.layer.cornerRadius = swipeButtonUIView.bounds.size.width/2
        swipeButtonUIView.clipsToBounds = true
//        swipeButtonUIView.layer.masksToBounds = true
        swipeButtonUIView.layer.borderColor = UIColor.whiteColor().CGColor
        swipeButtonUIView.layer.borderWidth = 1.3


        
        likeBackgroundView.layer.cornerRadius = likeBackgroundView.frame.size.width/2
        likeBackgroundView.layer.borderColor = UIColor.whiteColor().CGColor
        likeBackgroundView.layer.borderWidth = 1.3
        
        shareBackgroundView.layer.cornerRadius = shareBackgroundView.frame.size.width/2
        shareBackgroundView.layer.borderColor = UIColor.whiteColor().CGColor
        shareBackgroundView.layer.borderWidth = 1.3
*/
        
        
//       swipeImageView.animationImages = [UIImage]()
        
//        for var index = 25; index < 41; index++ {
//            
//
//            
//            if(index < 10) {
//                let frameName = String(format: "swipe00%d", index)
//                swipeImageView.animationImages?.append(UIImage(named: frameName)!)
//            } else {
//                let frameName = String(format: "swipe0%d", index)
//                swipeImageView.animationImages?.append(UIImage(named: frameName)!)
//            }
//            swipeImageView.animationDuration = 3
//            
//            swipeImageView.startAnimating()
//            
//            
//        }
        
        
        
        //self.swipeImageView.image = swipeImageView.image!.imageWithRenderingMode(UIImageRenderingMode.AlwaysTemplate)
        //self.swipeImageView.tintColor = UIColor.orangeColor()
        
        swipeImageView.animationImages = [UIImage]()
        
        for var index = 0; index < 47; index++ {
            
            if(index < 10) {
                let frameName = String(format: "Swipe_0000%d", index)
                swipeImageView.animationImages?.append(UIImage(named: frameName)!)
            } else {
                let frameName = String(format: "Swipe_000%d", index)
                swipeImageView.animationImages?.append(UIImage(named: frameName)!)
            }
            swipeImageView.animationDuration = 1.5
            swipeImageView.startAnimating()
            
        }

        
        
        
        
        
        loadingImageView.animationImages = [UIImage]()
        
        for var index = 0; index < 20; index++ {
            
            if(index < 10) {
                let frameName = String(format: "Feelitbro_0000%d", index)
                loadingImageView.animationImages?.append(UIImage(named: frameName)!)
            } else {
                let frameName = String(format: "Feelitbro_000%d", index)
                loadingImageView.animationImages?.append(UIImage(named: frameName)!)
            }
            loadingImageView.animationDuration = 1
            
        }
        
        loadingImageView.startAnimating()

        
        
        
        print(self.searchTag)
        if (PFUser.currentUser()?.username == nil){
        PFAnonymousUtils.logInWithBlock {
            (user: PFUser?, error: NSError?) -> Void in
            if error != nil || user == nil {
            } else {
            }
        }
        }else{
        }
        
        print(bgColor)
        
        if(bgColor == "yellow") {
            self.view.backgroundColor = UIColor(red: 252.0/255.0, green: 193.0/255.0, blue: 13.0/255.0, alpha: 1.0)
            swipeButtonOUTLET.setImage(UIImage(named: "catsbutton_second_page"), forState: UIControlState.Normal)
            textImageView.image = UIImage(named: "cats_text")

        } else if(bgColor == "green") {
            self.view.backgroundColor = UIColor(red: 49.0/255.0, green: 170.0/255.0, blue: 89.0/255.0, alpha: 1.0)

            swipeButtonOUTLET.setImage(UIImage(named: "happybutton_second_page"), forState: UIControlState.Normal)
            textImageView.image = UIImage(named: "happy_text")
            
            
        } else if(bgColor == "purple") {
            self.view.backgroundColor = UIColor(red: 137.0/255.0, green: 31.0/255.0, blue: 119.0/255.0, alpha: 1.0)
            swipeButtonOUTLET.setImage(UIImage(named: "affectionatedbutton_second_page"), forState: UIControlState.Normal)
            textImageView.image = UIImage(named: "affectionated_text")
            
        } else if(bgColor == "blue") {
            self.view.backgroundColor = UIColor(red: 61.0/255.0, green: 164.0/255.0, blue: 218.0/255.0, alpha: 1.0)
            swipeButtonOUTLET.setImage(UIImage(named: "pumpedbutton_second_page"), forState: UIControlState.Normal)
            textImageView.image = UIImage(named: "pumped_text")
            
        } else if(bgColor == "orange") {
            self.view.backgroundColor = UIColor(red: 216.0/255.0, green: 105.0/255.0, blue: 48.0/255.0, alpha: 1.0)
            swipeButtonOUTLET.setImage(UIImage(named: "pressurizedbutton_second_page"), forState: UIControlState.Normal)
            textImageView.image = UIImage(named: "pressurized_text")
        }
        
        randomGif()
        self.swipeButtonUIView.backgroundColor = view.backgroundColor
        self.shareBackgroundView.backgroundColor = view.backgroundColor
        self.likeBackgroundView.backgroundColor = view.backgroundColor
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func addBorderToImageView() {
        let topBorder = CALayer()
        topBorder.frame = CGRectMake(0.0, 0.0, self.gifImage.frame.size.width, 1.0)
        topBorder.backgroundColor = UIColor.whiteColor().CGColor
        let bottomBorder = CALayer()
        bottomBorder.frame = CGRectMake(0.0, 0.0, self.buttonView.frame.size.width, 1.0)
        bottomBorder.backgroundColor = UIColor.whiteColor().CGColor
        gifImage.layer.addSublayer(topBorder)
        buttonView.layer.addSublayer(bottomBorder)
    }
    
    func makeCircleView(view: UIView) {
        let size: CGFloat = min(view.frame.height, view.frame.width)
        let center: CGPoint = view.center
        let frame: CGRect = CGRectMake(view.frame.origin.x, view.frame.origin.y, size, size)
        view.frame = frame
        view.layer.cornerRadius = size / 2
        view.center = center
        view.clipsToBounds = true
        view.layer.masksToBounds = true
        view.layer.borderWidth = 1.3
        view.layer.borderColor = UIColor.whiteColor().CGColor
    }

    @IBAction func randomGifSwipe(sender: AnyObject) {
        //self.loadingImageView.hidden = false
        if(!swiped) {
            swiped = true
            self.loadingImageView.startAnimating()
            self.gifImage.hidden = true
            var random = arc4random_uniform(UInt32(searchTag.count))
            g.random(searchTag[Int(random)], rating: nil) { gif, err in
                if(err == nil) {
                    self.noInternetLabel.hidden = true
                    let json = JSON((gif?.json)!)
                    let urlString = json["image_original_url"].string
                    self.globalGifURL = urlString!
                    let url: NSURL = NSURL(string: urlString!)!
                    dispatch_async(dispatch_get_main_queue(), {
                        self.gifImage.image = UIImage.animatedImageWithAnimatedGIFURL(url)
                        self.gifImage.startAnimating()
                        //self.loadingImageView.hidden = true
                        self.loadingImageView.stopAnimating()
                        self.gifImage.hidden = false
                        self.gifId = (gif?.id)!
                        self.getGifInfo()
                        self.swiped = false
                    })
                } else {
                    self.loadOfflineGif()
                }
            }
        }
        
    }
    
    
    func randomGif() {
        if(searchTag.count < 1) {
            searchTag.append("oops")
        }
        
        var random = arc4random_uniform(UInt32(searchTag.count))
            g.random(searchTag[Int(random)], rating: nil) { gif, err in
                if(err == nil) {
                    self.noInternetLabel.hidden = true
                    let json = JSON((gif?.json)!)
                    let urlString = json["image_original_url"].string
                    self.globalGifURL = urlString!
                    let url: NSURL = NSURL(string: urlString!)!
                    dispatch_async(dispatch_get_main_queue(), {
                        self.gifImage.image = UIImage.animatedImageWithAnimatedGIFURL(url)
                        self.gifImage.startAnimating()
                        self.gifId = (gif?.id)!
                        self.getGifInfo()
                        self.loadingImageView.stopAnimating()
                    })
                } else {
                    self.loadOfflineGif()
                }
                
            }
        
    }
    
    func loadOfflineGif() {
        self.noInternetLabel.hidden = false
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
        self.gifImage.animationImages = imageList
        self.gifImage.startAnimating()
    }
    

    
    @IBAction func button2(sender: UIButton) {
        getGifInfo()
    }
    
    @IBAction func likeButton(sender: UIButton){
        var user = PFUser.currentUser()
        var query = PFQuery(className:"Gifs")
        query.whereKey("gifId", equalTo:self.gifId)
        query.findObjectsInBackgroundWithBlock {
            (objects: [PFObject]?, error: NSError?) -> Void in
            
            if error == nil {
                print("Successfully retrieved \(objects!.count) Gifs")
                if let objects = objects {
                    for object in objects {
                        self.gifLikes = object["likes"] as! Int
                        self.gifObjectId = object.objectId!
                    }
                }
            } else {
            }
            
            var query2 = PFQuery(className:"Gifs")
            query2.getObjectInBackgroundWithId(self.gifObjectId) {
                (gifInfo: PFObject?, error: NSError?) -> Void in
                if error != nil {
                } else if let gifInfo = gifInfo {
                    
                    gifInfo.addObject(user!.username!, forKey: "likedByUsers")
                    gifInfo["likes"] = self.gifLikes + 1
                    gifInfo.saveInBackground()
                    self.gifLikes = self.gifLikes + 1

                    self.likeButton.hidden = true
                    self.dislikeButton.hidden = false
                    
                }
            }
        }
    }
    
    
    @IBAction func dislikeButton(sender: UIButton) {
        var user = PFUser.currentUser()
        var query = PFQuery(className:"Gifs")
        query.whereKey("gifId", equalTo:self.gifId)
        query.findObjectsInBackgroundWithBlock {
            (objects: [PFObject]?, error: NSError?) -> Void in
            
            if error == nil {
                if let objects = objects {
                    for object in objects {
                        self.gifLikes = object["likes"] as! Int
                        self.gifObjectId = object.objectId!
                    }
                }
            } else {
            }
            
            var query2 = PFQuery(className:"Gifs")
            query2.getObjectInBackgroundWithId(self.gifObjectId) {
                (gifInfo: PFObject?, error: NSError?) -> Void in
                if error != nil {
                } else if let gifInfo = gifInfo {
                    
                    gifInfo.removeObject((user?.username)!, forKey: "likedByUsers")
                    gifInfo["likes"] = self.gifLikes - 1
                    gifInfo.saveInBackground()
                    self.gifLikes = self.gifLikes - 1

                    self.likeButton.hidden = false
                    self.dislikeButton.hidden = true
                    
                }
            }
        }
    }
    
    
    
    
    
    
    func getGifInfo()
    {
        var query = PFQuery(className:"Gifs")
        query.whereKey("gifId", equalTo: self.gifId)
        query.findObjectsInBackgroundWithBlock {
            (objects: [PFObject]?, error: NSError?) -> Void in
            
            if error == nil {
                print("Successfully retrieved \(objects!.count) Gifs.")
                if (objects?.count != 0)
                {
                    self.gifFound = true
                }else{
                    self.gifFound = false
                }
                if self.gifFound == true {
                    var user = PFUser.currentUser()
                    var query2 = PFQuery(className:"Gifs")
                    query2.whereKey("gifId", equalTo:self.gifId)
                    query2.findObjectsInBackgroundWithBlock {
                        (objects: [PFObject]?, error: NSError?) -> Void in
                        
                        if error == nil {
                            if let objects = objects {
                                for object in objects {
                                    self.gifId = object["gifId"] as! String
                                    self.gifObjectId = object.objectId!
                                    self.gifLikes = object["likes"] as! Int
                                    self.gifUsers = object["likedByUsers"] as! [String]
                                    let userContains = self.gifUsers.contains((user?.username)!)
                                    if (userContains == true)
                                    {
                                        self.likeButton.hidden = true
                                        self.dislikeButton.hidden = false
                                    }else{
                                        self.likeButton.hidden = false
                                        self.dislikeButton.hidden = true
                                    }
                                    
                                }
                            }
                        } else {
                            // Log details of the failure
                        }
                    }
                }else{
                    var createGif = PFObject(className:"Gifs")
                    createGif["gifId"] = self.gifId
                    createGif["likes"] = 0
                    createGif["likedByUsers"] = [""]
                    let acl = PFACL()
                    acl.setPublicReadAccess(true)
                    acl.setPublicWriteAccess(true)
                    createGif.ACL = acl
                    createGif.saveInBackgroundWithBlock {
                        (success: Bool, error: NSError?) -> Void in
                        if (success) {
                            self.gifLikes = 0

                            self.likeButton.hidden = false
                            self.dislikeButton.hidden = true
                        } else {
                            // There was a problem, check error.description
                        }
                    }
                }
            }
        }
    }
    
    @IBAction func shareButton(sender: AnyObject) {
        
        let shareText = "Feelio"
        
        let shareWebsite = NSURL(string: globalGifURL)
        let shareObject = [shareWebsite!, shareText]
        let activityVC = UIActivityViewController(activityItems: shareObject, applicationActivities: nil)
        
        activityVC.excludedActivityTypes = [UIActivityTypeAirDrop, UIActivityTypeAddToReadingList]
        self.presentViewController(activityVC, animated: true, completion: nil)
        
    }
    
    @IBAction func backButton(sender: AnyObject) {
        if(!clicked) {
            self.navigationController?.popViewControllerAnimated(true)
            clicked = true
        }
        
    }

    @IBAction func swipeButtonACTION(sender: AnyObject) {
        
        if(!swiped) {
            swiped = true
            //self.loadingImageView.hidden = false
            self.loadingImageView.startAnimating()
            self.gifImage.hidden = true
            let random = arc4random_uniform(UInt32(searchTag.count))
            g.random(searchTag[Int(random)], rating: nil) { gif, err in
                if(err == nil) {
                    let json = JSON((gif?.json)!)
                    let urlString = json["image_original_url"].string
                    self.globalGifURL = urlString!
                    let url: NSURL = NSURL(string: urlString!)!
                    dispatch_async(dispatch_get_main_queue(), {
                        self.gifImage.image = UIImage.animatedImageWithAnimatedGIFURL(url)
                        self.gifImage.startAnimating()
                        //self.loadingImageView.hidden = true
                        self.loadingImageView.stopAnimating()
                        self.gifImage.hidden = false
                        self.gifId = (gif?.id)!
                        self.getGifInfo()
                        self.swiped = false
                    })
                } else {
                    
                }
            }
        }
        
    }
}
