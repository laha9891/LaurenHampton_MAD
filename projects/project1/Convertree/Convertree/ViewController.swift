//
//  ViewController.swift
//  Convertree
//
//  Created by Lauren Hampton on 10/11/18.
//  Copyright © 2018 Lauren Hampton. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIPickerViewDataSource,UIPickerViewDelegate{
    
    @IBOutlet weak var convertree: UILabel!
    @IBOutlet weak var foodmap: UIImageView!
    @IBOutlet weak var startingUnitLabel: UILabel!
    @IBOutlet weak var startingTextField: UITextField! //link to picker for distance
    @IBOutlet weak var startingNumber: UITextField!
    @IBOutlet weak var foodUnitLabel: UILabel!
    @IBOutlet weak var foodTextField: UITextField! //link to picker for food
    @IBOutlet weak var foodNumberDISPLAY: UILabel!
    @IBOutlet weak var calcuEatButton: UIButton!
    @IBOutlet weak var baseUnitLabel: UILabel!
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
        view.endEditing(true)
        super.touchesBegan(touches, with: event)
    }
    
    var distancePicker = UIPickerView()
    var distance = ["Miles", "Feet", "Inches"]
    
    var foodPicker = UIPickerView()
    var food = ["Tacos", "Corn", "M&Ms", "Watermelons", "Pizza"]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        distancePicker.delegate = self
        distancePicker.dataSource = self
        startingTextField.inputView = distancePicker
        
        foodPicker.delegate = self
        foodPicker.dataSource = self
        foodTextField.inputView = foodPicker
        
        startingNumber.delegate=self as? UITextFieldDelegate
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == distancePicker{
            return distance.count
        }
        else{
            return food.count
        }
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == distancePicker{
            return distance[row]
        }
        else{
            return food[row]
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == distancePicker{
            self.startingTextField.text = self.distance[row]
            self.view.endEditing(false)
        }
        else{
            self.foodTextField.text = self.food[row]
            self.view.endEditing(false)
        }
    }
    
    
    @IBAction func conButton(_ sender: UIButton) {
        convert()
    }

    
    func convert() {
        var numdist:Float //distanceMeasurement
        
        if startingNumber.text!.isEmpty {
            numdist = 0.0
        } else {
            numdist = Float(startingNumber.text!)!
        }
        
        var result=numdist
        
        if self.startingTextField.text == "Miles"{
            if self.foodTextField.text == "Tacos"{
                result = numdist*11520
                foodmap.image=UIImage(named: "tacoFoodMap")
            }
            if self.foodTextField.text == "Corn"{
                result = numdist*9051
                foodmap.image=UIImage(named: "cornFoodMap")
            }
            if self.foodTextField.text == "M&Ms"{
                result = numdist*158400
                foodmap.image=UIImage(named: "mmFoodMap")
            }
            if self.foodTextField.text == "Watermelons"{
                result = numdist*2534
                foodmap.image=UIImage(named: "watermelonFoodMap")
            }
            else{
                result = numdist*7040
                foodmap.image=UIImage(named: "pizzaFoodMap")
            }
        }
        
        if self.startingTextField.text == "Feet"{
            if self.foodTextField.text == "Tacos"{
                result = numdist*2.18
                foodmap.image=UIImage(named: "tacoFoodMap")
            }
            if self.foodTextField.text == "Corn"{
                result = numdist*1.71
                foodmap.image=UIImage(named: "cornFoodMap")
            }
            if self.foodTextField.text == "M&Ms"{
                result = numdist*30
                foodmap.image=UIImage(named: "mmFoodMap")
            }
            if self.foodTextField.text == "Watermelons"{
                result = numdist*0.48
                foodmap.image=UIImage(named: "watermelonFoodMap")
            }
            else{
                result = numdist*1.33
                foodmap.image=UIImage(named: "pizzaFoodMap")
            }
        }
            
        else{
            if self.foodTextField.text == "Tacos"{
                result = numdist/5.5
                foodmap.image=UIImage(named: "tacoFoodMap")
            }
            if self.foodTextField.text == "Corn"{
                result = numdist/7
                foodmap.image=UIImage(named: "cornFoodMap")
            }
            if self.foodTextField.text == "M&Ms"{
                result = numdist/0.4
                foodmap.image=UIImage(named: "mmFoodMap")
            }
            if self.foodTextField.text == "Watermelons"{
                result = numdist/25
                foodmap.image=UIImage(named: "watermelonFoodMap")
            }
            else{
                result = numdist/9
                foodmap.image=UIImage(named: "pizzaFoodMap")
            }
        }
        
        let formatter = NumberFormatter()
        formatter.numberStyle=NumberFormatter.Style.decimal //set the number style
        foodNumberDISPLAY.text=formatter.string(from: NSNumber(value: result)) //returns a formatted string
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

