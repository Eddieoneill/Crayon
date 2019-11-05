//
//  CrayonTableViewCell.swift
//  Crayon
//
//  Created by Edward O'Neill on 11/5/19.
//  Copyright © 2019 Edward O'Neill. All rights reserved.
//

import UIKit

class CrayonTableViewCell: UITableViewCell {
    
    @IBOutlet weak var colorX: UIView!
    @IBOutlet weak var colorName: UILabel!
    @IBOutlet weak var colorHexCode: UILabel!
    
    func setColor(color: Crayon) {
        colorName.text = color.name
        colorHexCode.text = color.hex
        colorX.backgroundColor = UIColor(red: Int(color.red), green: Int(color.green), blue: Int(color.blue))
        
        if colorName.text == "Black" {
            colorName.textColor = .white
            colorHexCode.textColor = .white
        } else {
            colorName.textColor = .black
            colorHexCode.textColor = .black
        }
    }
}

extension UIColor {
   convenience init(red: Int, green: Int, blue: Int) {
       assert(red >= 0 && red <= 255, "Invalid red component")
       assert(green >= 0 && green <= 255, "Invalid green component")
       assert(blue >= 0 && blue <= 255, "Invalid blue component")

       self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
   }
}
