//
//  tutorialViewController.swift
//  Week2-Carousel
//
//  Created by Helen Zhou on 11/2/15.
//  Copyright © 2015 Helen Zhou. All rights reserved.
//

import UIKit

class tutorialViewController: UIViewController {

    @IBOutlet weak var tutorialScrollView: UIScrollView!
   
    @IBOutlet weak var button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        tutorialScrollView.contentSize = CGSize(width: 1280, height: 568)

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
