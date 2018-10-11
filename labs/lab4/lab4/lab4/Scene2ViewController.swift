//
//  Scene2ViewController.swift
//  lab4
//
//  Created by Lauren Hampton on 10/11/18.
//  Copyright © 2018 Lauren Hampton. All rights reserved.
//

import UIKit

class Scene2ViewController: UIViewController, UITextFieldDelegate {
    
    
    @IBOutlet weak var userEntree: UITextField!
    @IBOutlet weak var userDessert: UITextField!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "doneFavs"{
            let scene1ViewController = segue.destination as! ViewController
            //check to see that text was entered in the textfields
            if userEntree.text!.isEmpty == false{
                scene1ViewController.user.favEntree=userEntree.text
            }
            if userDessert.text!.isEmpty == false{
                scene1ViewController.user.favDessert=userDessert.text
            }
        }
    }
    
    override func viewDidLoad() {
        userEntree.delegate=self
        userDessert.delegate=self
        super.viewDidLoad()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
