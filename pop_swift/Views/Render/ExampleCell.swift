//
//  ExampleCell.swift
//  pop_swift
//
//  Created by Mathieu LANOY on 14/12/2015.
//  Copyright © 2015 actvt. All rights reserved.
//

import UIKit
import pop

class ExampleCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        accessoryType = .disclosureIndicator
        selectionStyle = .none
        textLabel?.font = UIFont(name: "Avenir-Light", size: 24)
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func setHighlighted(_ highlighted: Bool, animated: Bool) {
        super.setHighlighted(highlighted, animated:animated)
        if isHighlighted {
            if let scaleAnimation = POPBasicAnimation(propertyNamed:kPOPViewScaleXY){
                scaleAnimation.duration = 0.1
                scaleAnimation.toValue = NSValue(cgPoint:CGPoint(x:1, y:1))
                textLabel?.pop_add(scaleAnimation, forKey: "scalingUp")
            }
        } else {
            if let springAnimation = POPSpringAnimation(propertyNamed:kPOPViewScaleXY){
                springAnimation.toValue = NSValue(cgPoint: CGPoint(x:0.9, y: 0.9))
                springAnimation.velocity = NSValue(cgPoint: CGPoint(x:2, y:2))
                springAnimation.springBounciness = 20.0
                textLabel?.pop_add(springAnimation, forKey:"springAnimation")
            }
        }
    }

}
