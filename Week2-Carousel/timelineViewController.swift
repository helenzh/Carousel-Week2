//
//  timelineViewController.swift
//  Week2-Carousel
//
//  Created by Helen Zhou on 11/2/15.
//  Copyright © 2015 Helen Zhou. All rights reserved.
//

import UIKit

class timelineViewController: UIViewController {

    @IBOutlet weak var profile: UIButton!
    @IBOutlet weak var scrubber: UIImageView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var conversation: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
       scrollView.contentSize = imageView.image!.size
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
