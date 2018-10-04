//
//  MyViewController.swift
//  test x
//
//  Created by Azariah Kierson-Galeano on 10/2/18.
//  Copyright © 2018 Azariah Kierson-Galeano. All rights reserved.
//

import UIKit

class MyViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var textField: UITextField!
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    override func viewDidLoad() {
        textField.delegate = self
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let scene1 = segue.destination as! ViewController
        // Get the new view controller using segue.destinationViewController.
        if textField.text!.isEmpty == false {
            scene1.textLabel.textString = textField.text
            
        }
        
        // Pass the selected object to the new view controller.
    }

}
