//
//  SplashScreen.swift
//  Malmönightlife2
//
//  Created by David on 2015-11-18.
//  Copyright © 2015 David. All rights reserved.
//

import UIKit
import Foundation

class SplashScreen: UIViewController {
    @IBOutlet weak var imageLoader: UIImageView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageLoader.animationImages = [UIImage]()

        
      /*  imageLoader.animationImages = [UIImage]()
        
        for var index = 0; index < 37; index++ {
            let frameName = String(format: "Splashscreen0%05d", index)
            imageLoader.animationImages?.append(UIImage(named: frameName)!)
            
        }*/
        
        for var index = 0; index < 37; index++ {
            
            if(index < 10) {
                let frameName = String(format: "Splashscreen00%d", index)
                imageLoader.animationImages?.append(UIImage(named: frameName)!)
            } else {
                let frameName = String(format: "Splashscreen0%d", index)
                imageLoader.animationImages?.append(UIImage(named: frameName)!)
                
            }
            
            
        }
        
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func update(){
        performSegueWithIdentifier("splashtransition", sender: self)
        
    }
    
    override func viewDidAppear(animated: Bool) {
        NSTimer.scheduledTimerWithTimeInterval(1.95, target: self, selector: "update", userInfo: nil, repeats: false)
        imageLoader.animationDuration = 2
        imageLoader.animationRepeatCount = 1
        imageLoader.startAnimating()
        
        
    }
    
    
    
    
    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    }
    */
    
}
