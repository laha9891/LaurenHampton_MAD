//
//  ViewController.swift
//  midterm
//
//  Created by Lauren Hampton on 10/17/18.
//  Copyright © 2018 Lauren Hampton. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    //my app crashed because I forgot UITextFieldDelegate
    //I feel like a dingus

    //STATIC LABELS
    @IBOutlet weak var workouttimelabel: UILabel!
    @IBOutlet weak var weeklylabel: UILabel!
    @IBOutlet weak var perlabel: UILabel!
    
    //USER ENTER TEXTFIELD
    @IBOutlet weak var timeTextField: UITextField!
    
    //CHANGING LABELS
    @IBOutlet weak var milesLabel: UILabel!
    @IBOutlet weak var caloriesLabel: UILabel!
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
        view.endEditing(true)
        super.touchesBegan(touches, with: event)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    override func viewDidLoad() {
        timeTextField.delegate = self
        super.viewDidLoad()
    }

    @IBAction func unwindSegue(_ segue:UIStoryboardSegue){
    }

    
    //BUTTON BUTTON BUTTON BUTTON BUTTON BUTTON BUTTON
    @IBAction func workoutButton(_ sender: UIButton) {
        calculate()
    }
    //BUTTON FUNCTION
    func calculate() {
        let time=Int(timeTextField.text!) //returns an optional
        let total=time!/10
        let caltotal=time!*10
        //let calories=time!*600
        
        var timeTotal : Float = 0.0 //specify Float so it's not a Double
        var caloriesTotal : Float = 0.0 //specify Float so it's not a Double
        
        if time != nil {
            if time! >= 30 {
                timeTotal = Float(total/10)
                caloriesTotal = Float(total*10)
            }else {
                //create a UIAlertController object
                let alert=UIAlertController(title: "Warning", message: "You need to work out more.", preferredStyle: UIAlertControllerStyle.alert)
                //create a UIAlertAction object for the button
                let cancelAction=UIAlertAction(title: "Cancel", style:UIAlertActionStyle.cancel, handler: nil)
                alert.addAction(cancelAction) //adds the alert action to the alert object
                let okAction=UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: {action in
                    self.timeTextField.text="30"
                    self.calculate()
                })
                alert.addAction(okAction)
                present(alert, animated: true, completion: nil)
            } //end else
        }
        let formatter = NumberFormatter()
        formatter.numberStyle=NumberFormatter.Style.decimal //set the number style
        milesLabel.text=formatter.string(from: NSNumber(value: total)) //returns a formatted string
        caloriesLabel.text=formatter.string(from: NSNumber(value: caltotal)) //returns a formatted string
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

