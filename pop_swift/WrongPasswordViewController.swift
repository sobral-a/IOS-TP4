//
//  WrongPasswordViewController.swift
//  pop_swift
//
//  Created by Guest User on 23/05/17.
//  Copyright © 2017 actvt. All rights reserved.
//

import UIKit
import pop

class WrongPasswordViewController: UIViewController {
    @IBOutlet weak var passwordTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func login(_ sender: Any) {
        if let shake = POPSpringAnimation(propertyNamed: kPOPLayerPositionX){
            shake.springBounciness = 20.0
            shake.velocity = 1500
            passwordTextField.layer.pop_add(shake, forKey: "shakePassword")
        }
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
