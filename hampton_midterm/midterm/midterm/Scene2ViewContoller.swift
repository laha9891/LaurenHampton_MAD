//
//  Scene2ViewContoller.swift
//  midterm
//
//  Created by Lauren Hampton on 10/17/18.
//  Copyright © 2018 Lauren Hampton. All rights reserved.
//

import UIKit

class Scene2ViewContoller: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var nameLabel2: UILabel!
    @IBOutlet weak var emailLabel2: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
        view.endEditing(true)
        super.touchesBegan(touches, with: event)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    
    
    
    override func viewDidLoad() {
        nameTextField.delegate = self
        emailTextField.delegate = self
        super.viewDidLoad()
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
