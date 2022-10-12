//
//  ViewController.swift
//  ColorizedApp
//
//  Created by leogoba on 25.09.2022.
//

import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet var coloredView: UIView!
    
    @IBOutlet var redColorValue: UILabel!
    @IBOutlet var greenColorValue: UILabel!
    @IBOutlet var blueColorValue: UILabel!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    var backgroundColorOfView: UIColor!
    var delegate: SettingViewControllerDelegate!
    
    var redColor: CGFloat = 0
    var greenColor: CGFloat = 0
    var blueColor: CGFloat = 0
    var alphaColor: CGFloat = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        coloredView.layer.cornerRadius = coloredView.frame.height / 10
        //resultColor()
        slidersSetting()
        coloredView.backgroundColor = backgroundColorOfView
        
        
        
        backgroundColorOfView.getRed(
            &redColor,
            green: &greenColor,
            blue: &blueColor,
            alpha: &alphaColor
        )
        
        redSlider.value = Float(redColor)
        greenSlider.value = Float(greenColor)
        blueSlider.value = Float(blueColor)
        
        updateLabel(for: redColorValue, greenColorValue, blueColorValue)
        
        self.buttonDoneTapped()
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
    
    @IBAction func buttonDoneTapped() {
        delegate.setNewColor(
            red: redSlider.value,
            green: greenSlider.value,
            blue: blueSlider.value
        )
        dismiss(animated: true)
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
    
    private func updateLabel(for labels: UILabel...) {
        labels.forEach { label in
            switch label {
            case redColorValue:
                redColorValue.text = String(format: "%.2f", redSlider.value)
            case greenColorValue:
                greenColorValue.text = String(format: "%.2f", greenSlider.value)
            default:
                blueColorValue.text = String(format: "%.2f", blueSlider.value)
            }
        }
    }
}

