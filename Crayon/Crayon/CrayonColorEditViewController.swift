//
//  CrayonColorEditViewController.swift
//  Crayon
//
//  Created by Edward O'Neill on 11/5/19.
//  Copyright © 2019 Edward O'Neill. All rights reserved.
//

import UIKit

class CrayonColorEditViewController: UIViewController {
    @IBOutlet weak var currentColorName: UILabel!
    @IBOutlet weak var red: UISlider!
    @IBOutlet weak var green: UISlider!
    @IBOutlet weak var blue: UISlider!
    @IBOutlet weak var alphaView: UILabel!
    @IBOutlet weak var alphaChanger: UIStepper!
    
    var color: Crayon? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let color = color else {
            return
        }
        view.backgroundColor = UIColor(red: Int(color.red), green: Int(color.green), blue: Int(color.blue))
        currentColorName.text = color.name
        red.maximumValue = 1.0; red.minimumValue = 0.0
        green.maximumValue = 1.0; green.minimumValue = 0.0
        blue.maximumValue = 1.0; blue.minimumValue = 0.0
        red.value = Float(color.red) / 255
        green.value = Float(color.green) / 255
        blue.value = Float(color.blue) / 255
        alphaChanger.maximumValue = 1.0; alphaChanger.minimumValue = 0.0
        alphaChanger.value = 1.0
        alphaChanger.stepValue = 0.1
        
        if currentColorName.text == "Black" {
            currentColorName.textColor = .white
            alphaView.textColor = .white
        } else {
            currentColorName.textColor = .black
            alphaView.textColor = .black
        }
    }
    
    @IBAction func changeBackgroundColor(_ sender: UISlider) {
        switch sender {
        case red:
            view.backgroundColor = UIColor(red: CGFloat(sender.value), green: CGFloat(green.value), blue: CGFloat(blue.value), alpha: 1)
        case green:
            view.backgroundColor = UIColor(red: CGFloat(red.value), green: CGFloat(sender.value), blue: CGFloat(blue.value), alpha: 1)
        case blue:
            view.backgroundColor = UIColor(red: CGFloat(red.value), green: CGFloat(green.value), blue: CGFloat(sender.value), alpha: 1)
        default:
            view.backgroundColor = UIColor(red: CGFloat(sender.value), green: CGFloat(green.value), blue: CGFloat(blue.value), alpha: 1)
        }
    }
    
    @IBAction func alphaColorChange(_ sender: UIStepper) {
        view.backgroundColor = UIColor(red: CGFloat(red.value), green: CGFloat(green.value), blue: CGFloat(blue.value), alpha: CGFloat(alphaChanger.value))
    }
}
