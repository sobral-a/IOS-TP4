//
//  FacebookButtonAnimationViewController.swift
//  pop_swift
//
//  Created by Guest User on 23/05/17.
//  Copyright © 2017 actvt. All rights reserved.
//

import UIKit
import pop

class FacebookButtonAnimationViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var sendButton: UIButton!
    @IBOutlet weak var msgTextField: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        msgTextField.delegate = self
        
        sendButton.isHidden = true

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func showSendButton() {
        if sendButton.isHidden {
            likeButton.isHidden = true
            sendButton.isHidden = false
            if let sprintAnimation = POPSpringAnimation(propertyNamed:
                kPOPViewScaleXY){
                sprintAnimation.velocity = NSValue(cgPoint: CGPoint(x:8, y:8))
                sprintAnimation.springBounciness = 20.0
                sendButton.pop_add(sprintAnimation, forKey:"sendAnimation")
            } }
    }
    
    func showLikeButton() {
        likeButton.isHidden = false
        sendButton.isHidden = true
        if let spin = POPSpringAnimation(propertyNamed: kPOPLayerRotation){
            spin.fromValue = M_PI / 4
            spin.toValue = 0
            spin.springBounciness = 20.0
            spin.velocity = 10
            likeButton.layer.pop_add(spin, forKey: "likeAnimation")
        }
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range:
        NSRange, replacementString string: String) -> Bool {
        var comment = ""
        if range.length == 0 {
            comment = "\(textField.text)\(string)"
        } else {
            if let text = textField.text {
                comment = (text as NSString).substring(to: text.characters.count - range.length)
            }
        }
        if comment.characters.count == 0 {
            self.showLikeButton()
        } else {
            self.showSendButton()
        }
        return true
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
