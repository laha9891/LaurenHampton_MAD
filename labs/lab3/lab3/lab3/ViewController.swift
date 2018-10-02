//
//  ViewController.swift
//  tipcalculator
//
//  Created by Lauren Hampton
//  Copyright (c) 2018 Lauren Hampton. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var header: UILabel!
    @IBOutlet weak var sqftLabel: UILabel!
    @IBOutlet weak var peopleLabel: UILabel!
    @IBOutlet weak var perPersonLabel: UILabel!
    @IBOutlet weak var sqftAmount: UITextField!
    @IBOutlet weak var people: UITextField!
    @IBOutlet weak var totalPerPerson: UILabel!
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
        view.endEditing(true)
        super.touchesBegan(touches, with: event)
    }
    
    //makes keyboard go away
    //dont forget UI textfield delegate
    
    func divideSqft() {
        var sqft:Float //sqfootage
        
        if sqftAmount.text!.isEmpty {
            sqft = 0.0
        } else {
            sqft = Float(sqftAmount.text!)!
        }
        
        let numberOfPeople=Int(people.text!) //returns an optional
        let total=sqft
        var personTotal : Float = 0.0 //specify Float so it's not a Double
        if numberOfPeople != nil {
            if numberOfPeople! > 0 {
                personTotal = total / Float(numberOfPeople!)
            }else {
                //create a UIAlertController object
                let alert=UIAlertController(title: "Warning", message: "Must be at least 1 person", preferredStyle: UIAlertControllerStyle.alert)
                //create a UIAlertAction object for the button
                let cancelAction=UIAlertAction(title: "Cancel", style:UIAlertActionStyle.cancel, handler: nil)
                alert.addAction(cancelAction) //adds the alert action to the alert object
                let okAction=UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: {action in
                    self.people.text="1"
                    self.divideSqft()
                })
                alert.addAction(okAction)
                present(alert, animated: true, completion: nil)
            } //end else
        }
        
        //format results as currency
        let decimalFormatter = NumberFormatter()
        decimalFormatter.numberStyle=NumberFormatter.Style.decimal //set the number style
        totalPerPerson.text=decimalFormatter.string(from: NSNumber(value: personTotal))
    }
    
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        divideSqft()
    }
    
    override func viewDidLoad() {
        sqftAmount.delegate=self
        people.delegate=self
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
