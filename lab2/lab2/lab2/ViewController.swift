//
//  ViewController.swift
//  lab2
//
//  Created by Lauren Hampton on 9/19/18.
//  Copyright © 2018 Lauren Hampton. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var maintitle: UILabel!
    //disco fever
    @IBOutlet weak var disco1: UIImageView! //picture
    
    @IBOutlet weak var picswitch: UISegmentedControl! //left/right
    
    @IBOutlet weak var textcolorswitch: UISegmentedControl! //black/red
    
    @IBOutlet weak var captitle: UILabel! //label for on/off
    @IBOutlet weak var capswitch: UISwitch! //on/off
    @IBOutlet weak var fontSizeLabel: UILabel!
    
    @IBOutlet weak var fontsizelabel: UILabel! //label for font size
    @IBOutlet weak var fontsizecontrol: UISlider! //font slider
    
    func updateImage(){
        if picswitch.selectedSegmentIndex == 0 {
            disco1.image=UIImage(named: "disco1")
        }
        else if picswitch.selectedSegmentIndex == 1 {
            disco1.image=UIImage(named: "disco2")
        }
    }
    
    
    @IBAction func textColor(_ sender: UISegmentedControl) {
        if textcolorswitch.selectedSegmentIndex == 1 {
            maintitle.textColor=UIColor(red: 1.0, green: 0.0, blue: 0.0, alpha: 1.0)
        }
        else{
            maintitle.textColor=UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 1.0)
        }
    }
    

    @IBAction func cap(_ sender: UISwitch) {
        if capswitch.isOn{
            maintitle.text=maintitle.text?.uppercased()
        } else {
            maintitle.text=maintitle.text?.lowercased()
        }
    }
    
    
    @IBAction func changeInfo(_ sender: UISegmentedControl) {
        updateImage()
    }
    
    @IBAction func changeFontSize(_ sender: UISlider) {
        let fontSize=sender.value //float
        fontSizeLabel.text=String(format: "%.0f", fontSize) //convert float to String
        let fontSizeCGFloat=CGFloat(fontSize) //convert float to CGFloat
        maintitle.font=UIFont.systemFont(ofSize: fontSizeCGFloat) //create a UIFont object and assign to the font property
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

