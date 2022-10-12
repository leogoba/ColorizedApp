//
//  WelcomeViewController.swift
//  ColorizedApp
//
//  Created by leogoba on 11.10.2022.
//

import UIKit

protocol SettingViewControllerDelegate {
    func setNewColor(red: Float, green: Float, blue: Float)
}

class WelcomeViewController: UIViewController {
    
    private var viewBackgroundColor: UIColor!
    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let settigsVC = segue.destination as? SettingsViewController else { return }
        viewBackgroundColor = view.backgroundColor
        settigsVC.backgroundColorOfView = viewBackgroundColor
        settigsVC.delegate = self
    }
    
}

// MARK: SettingViewControllerDelegate
extension WelcomeViewController: SettingViewControllerDelegate {
    func setNewColor(red: Float, green: Float, blue: Float) {
        view.backgroundColor = UIColor(
            red: CGFloat(red),
            green: CGFloat(green),
            blue: CGFloat(blue),
            alpha: 1
        )
    }
}
