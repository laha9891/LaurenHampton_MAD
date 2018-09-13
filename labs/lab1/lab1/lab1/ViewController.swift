//
//  ViewController.swift
//  lab1
//
//  Created by Lauren Hampton on 9/12/18.
//  Copyright © 2018 Lauren Hampton. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var joke: UILabel!
    @IBOutlet weak var picture: UIImageView!
    @IBAction func changeThings(_ sender: UIButton) {
        if sender.tag == 1 {
            picture.image=UIImage(named: "llama1")
            joke.text = "Llamanate It!"
        }
        else if sender.tag == 2{
            picture.image=UIImage(named: "goats1")
            joke.text = "How do you keep your homework from being eaten on the farm?"
        }
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

