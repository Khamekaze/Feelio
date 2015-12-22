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

class ViewController: UIViewController {
    
    var gifId = String()
    var gifLikes = Int()
    var gifUsers = [String]()
    var gifObjectId = String()
    var backgroundColor = String()
    var gifFound = Bool()
    var searchTag = [String]()
    
    
    @IBOutlet weak var dislikeButton: UIButton!
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var likeLabel: UILabel!
    @IBOutlet weak var gifImage: UIImageView!
    @IBOutlet weak var button: UIButton!
    var g = Giphy(apiKey: "dc6zaTOxFJmzC")

    override func viewDidLoad() {
        super.viewDidLoad()
        print(self.searchTag)
        if (PFUser.currentUser()?.username == nil){
        PFAnonymousUtils.logInWithBlock {
            (user: PFUser?, error: NSError?) -> Void in
            if error != nil || user == nil {
                print("Anonymous login failed.")
            } else {
                print("Anonymous user logged in with username \(user?.username)")
            }
        }
        }else{
            print("user alredy logged in with username \(PFUser.currentUser()?.username)")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func randomGifSwipe(sender: AnyObject) {
        var random = arc4random_uniform(UInt32(searchTag.count))
        g.random(searchTag[Int(random)], rating: nil) { gif, err in
            let json = JSON((gif?.json)!)
            let urlString = json["image_original_url"].string
            let url: NSURL = NSURL(string: urlString!)!
            dispatch_async(dispatch_get_main_queue(), {
                self.gifImage.image = UIImage.animatedImageWithAnimatedGIFURL(url)
                self.gifImage.startAnimating()
                self.gifId = (gif?.id)!
                print("GifID: \(self.gifId)")
                self.getGifInfo()
            })
        }
        
        
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
                        print("GIF objectID:\(self.gifObjectId)")
                        print("GIF had \(self.gifLikes) before")
                    }
                }
            } else {
                print("Error: \(error!) \(error!.userInfo)")
            }
            
            var query2 = PFQuery(className:"Gifs")
            query2.getObjectInBackgroundWithId(self.gifObjectId) {
                (gifInfo: PFObject?, error: NSError?) -> Void in
                if error != nil {
                    print(error)
                } else if let gifInfo = gifInfo {
                    
                    gifInfo.addObject(user!.username!, forKey: "likedByUsers")
                    gifInfo["likes"] = self.gifLikes + 1
                    gifInfo.saveInBackground()
                    print("Gif Liked")
                    self.gifLikes = self.gifLikes + 1
                    self.likeLabel.text = String(self.gifLikes)
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
                print("Successfully retrieved \(objects!.count) Gifs")
                if let objects = objects {
                    for object in objects {
                        self.gifLikes = object["likes"] as! Int
                        self.gifObjectId = object.objectId!
                        print("GIF objectID:\(self.gifObjectId)")
                        print("GIF had \(self.gifLikes) before")
                    }
                }
            } else {
                print("Error: \(error!) \(error!.userInfo)")
            }
            
            var query2 = PFQuery(className:"Gifs")
            query2.getObjectInBackgroundWithId(self.gifObjectId) {
                (gifInfo: PFObject?, error: NSError?) -> Void in
                if error != nil {
                    print(error)
                } else if let gifInfo = gifInfo {
                    
                    gifInfo.removeObject((user?.username)!, forKey: "likedByUsers")
                    gifInfo["likes"] = self.gifLikes - 1
                    gifInfo.saveInBackground()
                    print("Gif Disliked")
                    self.gifLikes = self.gifLikes - 1
                    self.likeLabel.text = String(self.gifLikes)
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
                                    self.likeLabel.text = String(self.gifLikes)
                                    print("liked by users \(self.gifUsers)")
                                    print("Likes: \(self.gifLikes)")
                                    let userContains = self.gifUsers.contains((user?.username)!)
                                    if (userContains == true)
                                    {
                                        print("this user has alredy liked this GIF")
                                        self.likeButton.hidden = true
                                        self.dislikeButton.hidden = false
                                    }else{
                                        print("this user has NOT liked this GIF")
                                        self.likeButton.hidden = false
                                        self.dislikeButton.hidden = true
                                    }
                                    
                                }
                            }
                        } else {
                            // Log details of the failure
                            print("Error: \(error!) \(error!.userInfo)")
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
                            print("GifCreated")
                            print("this user has NOT liked this GIF")
                            self.gifLikes = 0
                            self.likeLabel.text = String(self.gifLikes)
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


}
