//
//  ViewController.swift
//  ColorizedApp
//
//  Created by leogoba on 25.09.2022.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var coloredView: UIView!
    
    @IBOutlet var redColorValue: UILabel!
    @IBOutlet var greenColorValue: UILabel!
    @IBOutlet var blueColorValue: UILabel!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        coloredView.layer.cornerRadius = coloredView.frame.height / 10
        resultColor()
        slidersSetting()
    }
    
    @IBAction func slidersMoving(_ sender: UISlider) {
        resultColor()
        switch sender {
        case redSlider:
            redColorValue.text = String(format: "%.2f", redSlider.value)
        case greenSlider:
            greenColorValue.text = String(format: "%.2f", greenSlider.value)
        default:
            blueColorValue.text = String(format: "%.2f", blueSlider.value)
        }
    }
    
    private func resultColor() {
        coloredView.backgroundColor = UIColor(
            red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value),
            alpha: 1
        )
    }
    
    private func slidersSetting() {
        redSlider.minimumTrackTintColor = .red
        greenSlider.minimumTrackTintColor = .green
        blueSlider.minimumTrackTintColor = .blue
        
        redColorValue.text = String(redSlider.value)
        greenColorValue.text = String(greenSlider.value)
        blueColorValue.text = String(blueSlider.value)
    }
}

