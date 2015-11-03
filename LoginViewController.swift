//
//  LoginViewController.swift
//  Week2-Carousel
//
//  Created by Helen Zhou on 11/2/15.
//  Copyright © 2015 Helen Zhou. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var buttonParentView: UIView!
    @IBOutlet weak var fieldParentView: UIView!
   
    @IBOutlet weak var loginNavBar: UIImageView!
    
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    
    @IBOutlet weak var loginButton: UIButton!
    
  
    @IBOutlet weak var loginIndicator: UIActivityIndicatorView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        scrollView.contentSize = CGSize(width:320, height:600)
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide:", name: UIKeyboardWillHideNotification, object: nil)//register for keyboard events
        
        
        // Do any additional setup after loading the view.
    }
    
    
    // The main view is about to appear...
    override func viewWillAppear(animated: Bool) {
        // Set initial transform values 20% of original size
        let transform = CGAffineTransformMakeScale(0.2, 0.2)
        // Apply the transform properties of the views
        loginNavBar.transform = transform
        fieldParentView.transform = transform
        // Set the alpha properties of the views to transparent
        loginNavBar.alpha = 0
        fieldParentView.alpha = 0
    }
    
    
    // The main view appeared...
    override func viewDidAppear(animated: Bool) {
        //Animate the code within over 0.3 seconds...
        UIView.animateWithDuration(0.3) { () -> Void in
            // Return the views transform properties to their default states.
            self.fieldParentView.transform = CGAffineTransformIdentity
            self.loginNavBar.transform = CGAffineTransformIdentity
            // Set the alpha properties of the views to fully opaque
            self.fieldParentView.alpha = 1
            self.loginNavBar.alpha = 1
        }
    }
   
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
 
    @IBAction func backButton(sender: AnyObject) { navigationController!.popViewControllerAnimated(true)
    }
    
    @IBAction func didPressLogin(sender: AnyObject) {self.loginIndicator.startAnimating()
        
        
        if emailField.text == "h" && passwordField.text == "g"{
            delay(2, closure: { () -> () in
                self.loginIndicator.stopAnimating()
                self.loginButton.selected = false
                self.performSegueWithIdentifier("tutorialSegue", sender: nil)
                
                
            })
        }else if emailField.text!.isEmpty || passwordField.text!.isEmpty{
            self.loginIndicator.stopAnimating()
            self.loginButton.selected = false
            
            let alertController = UIAlertController(title: "Info Required", message: "Please enter your email address", preferredStyle: .Alert)
            
            let OKAction = UIAlertAction(title: "OK", style: .Default) { (action) in
                // handle response here.
            }
            // add the OK action to the alert controller
            alertController.addAction(OKAction)
            self.presentViewController(alertController, animated: true, completion: nil)
            
        }else {
            delay(2, closure: { () -> () in
                self.loginIndicator.stopAnimating()
                self.loginButton.selected = false
                let alertController = UIAlertController(title: "Invalid Email or Password", message: "Please try again", preferredStyle: .Alert)
                
                let OKAction = UIAlertAction(title: "OK", style: .Default) { (action) in
                    // handle response here.
                }
                // add the OK action to the alert controller
                alertController.addAction(OKAction)
                self.presentViewController(alertController, animated: true, completion:     nil)
            })
        }

    }
    
    
    // The scrollView is in the proccess of scrolling...
    func scrollViewDidScroll(scrollView: UIScrollView) {
        // If the scrollView has been scrolled down by 50px or more...
        if scrollView.contentOffset.y <= -30 {
            // Hide the keyboard
            view.endEditing(true)
        }
    }//define the keyboard1
    
    //keyboard is about to be shown
    func keyboardWillShow(notification: NSNotification!) {// Move the button up above keyboard
        buttonParentView.transform = CGAffineTransformMakeTranslation(0, -60)
        // Calculate the maximum scrollview content Offset y
        let maxContentOffsetY = scrollView.contentSize.height - scrollView.frame.size.height
        // Scroll the scrollview up to the maximum contentOffset
        scrollView.contentOffset.y = maxContentOffsetY
        // Enable scrolling while keyboard is shown
        scrollView.scrollEnabled = true
        
    }//define the keyboard2
    
   
    
    //the keyboard is about to be hidden
    func keyboardWillHide(notification: NSNotification!) { // Move the buttons back down to it's original position
        buttonParentView.transform = CGAffineTransformIdentity
        // Return the ScrollView to it's original position
        scrollView.contentOffset.y = 0
        // Disable scrolling when keyboard is hidden
        scrollView.scrollEnabled = false
        
    }//define the keyboard3

    @IBAction func didTap(sender: AnyObject) {view.endEditing(true)
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
