//
//  ViewController.swift
//  ColorizedApp
//
//  Created by leogoba on 25.09.2022.
//

import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet var coloredView: UIView!
    
    @IBOutlet var redColorValueLabel: UILabel!
    @IBOutlet var greenColorValueLabel: UILabel!
    @IBOutlet var blueColorValueLabel: UILabel!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    @IBOutlet var redColorValueTF: UITextField!
    @IBOutlet var greenColorValueTF: UITextField!
    @IBOutlet var blueColorValueTF: UITextField!
    
    var backgroundColorOfView: UIColor!
    var delegate: SettingViewControllerDelegate!
    
    private var redColor: CGFloat = 0
    private var greenColor: CGFloat = 0
    private var blueColor: CGFloat = 0
    private var alphaColor: CGFloat = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        redColorValueTF.delegate = self
        greenColorValueTF.delegate = self
        blueColorValueTF.delegate = self
        
        coloredView.layer.cornerRadius = coloredView.frame.height / 10
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
        
        updateLabel(for: redColorValueLabel, greenColorValueLabel, blueColorValueLabel)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    @IBAction func slidersMoving(_ sender: UISlider) {
        passesDataBetweenSlidersAndTF()
        resultColor()
        switch sender {
        case redSlider:
            redColorValueLabel.text = String(format: "%.2f", redSlider.value)
        case greenSlider:
            greenColorValueLabel.text = String(format: "%.2f", greenSlider.value)
        default:
            blueColorValueLabel.text = String(format: "%.2f", blueSlider.value)
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
        
//        redColorValue.text = String(redSlider.value)
//        greenColorValue.text = String(greenSlider.value)
//        blueColorValue.text = String(blueSlider.value)
    }
    
    private func updateLabel(for labels: UILabel...) {
        labels.forEach { label in
            switch label {
            case redColorValueLabel:
                redColorValueLabel.text = String(format: "%.2f", redSlider.value)
            case greenColorValueLabel:
                greenColorValueLabel.text = String(format: "%.2f", greenSlider.value)
            default:
                blueColorValueLabel.text = String(format: "%.2f", blueSlider.value)
            }
        }
        passesDataBetweenSlidersAndTF()
    }
    
    private func passesDataBetweenSlidersAndTF() {
        redColorValueTF.text = redColorValueLabel.text
        greenColorValueTF.text = greenColorValueLabel.text
        blueColorValueTF.text = blueColorValueLabel.text
    }
    
    private func showAlert(title: String, message: String, textField: UITextField? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            textField?.text = ""
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}

extension SettingsViewController: UITextFieldDelegate {
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let newValue = textField.text else { return }
        guard let numberValue = Float(newValue) else { return }
        
        if let value = Float(textField.text ?? ""), value >= 0, value <= 1 {
            switch textField {
            case redColorValueTF:
                redSlider.value = value
                redColorValueLabel.text = String(format: "%.2f", redSlider.value)
            case greenColorValueLabel:
                greenSlider.value = value
                greenColorValueLabel.text = String(format: "%.2f", greenSlider.value)
            default:
                blueSlider.value = value
                blueColorValueLabel.text = String(format: "%.2f", blueSlider.value)
            }
        } else {
            showAlert(
                title: "Внимание! Вы ввели неверное число!",
                message: "Введите значение от 0 до 1😉",
                textField: textField
            )
        }
        
        if textField == redColorValueTF {
            redSlider.value = numberValue
            redColorValueLabel.text = String(format:"%.2f", numberValue)
        } else if textField == greenColorValueTF {
            greenSlider.value = numberValue
            greenColorValueLabel.text = String(format:"%.2f", numberValue)
        } else {
            blueSlider.value = numberValue
            blueColorValueLabel.text = String(format:"%.2f", numberValue)
        }
    }
}
