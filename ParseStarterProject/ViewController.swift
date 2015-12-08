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
    
    @IBOutlet weak var gifImage: UIImageView!
    @IBOutlet weak var button: UIButton!
    var g = Giphy(apiKey: "dc6zaTOxFJmzC")

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func randomGif(sender: AnyObject) {
        g.random("happy", rating: nil) { gif, err in
            let json = JSON((gif?.json)!)
            let urlString = json["image_original_url"].string
            let url: NSURL = NSURL(string: urlString!)!
            dispatch_async(dispatch_get_main_queue(), {
                self.gifImage.image = UIImage.animatedImageWithAnimatedGIFURL(url)
                self.gifImage.startAnimating()
            })
        }
        
    }
}
