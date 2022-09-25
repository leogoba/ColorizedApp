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
        
        slidersSetting()
    }
    
    @IBAction func redSliderMoving() {
        redColorValue.text = String(round(redSlider.value * 100) / 100)
        resultColor()
    }
    
    @IBAction func greenSliderMoving() {
        greenColorValue.text = String(round(greenSlider.value * 100) / 100)
        resultColor()
    }
    
    @IBAction func blueSliderMoving() {
        blueColorValue.text = String(round(blueSlider.value * 100) / 100)
        resultColor()
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

