//
//  ViewController.swift
//  helloWorld
//
//  Created by Azariah Kierson-Galeano on 9/6/18.
//  Copyright © 2018 Azariah Kierson-Galeano. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var helloLabel: UILabel!
    
    @IBAction func buttonPress(_ sender: UIButton) {
        helloLabel.text = "Hello World!"
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

