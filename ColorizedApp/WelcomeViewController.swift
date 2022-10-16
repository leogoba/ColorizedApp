//
//  WelcomeViewController.swift
//  ColorizedApp
//
//  Created by leogoba on 11.10.2022.
//

import UIKit

protocol SettingViewControllerDelegate {
    func setColor(_ color: UIColor)
}

class WelcomeViewController: UIViewController {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let settigsVC = segue.destination as? SettingsViewController else { return }
        settigsVC.delegate = self
        settigsVC.viewBackgroundColor = view.backgroundColor
    }
}

// MARK: SettingViewControllerDelegate
extension WelcomeViewController: SettingViewControllerDelegate {
    func setColor(_ color: UIColor) {
        view.backgroundColor = color
    }
}
