//
//  MainViewController.swift
//  ColorPicker
//
//  Created by Vic on 09.12.2023.
//

import UIKit

protocol ColorSetupViewControllerDelegate: AnyObject {
    func getValues(from color: BGColor)
}

final class MainViewController: UIViewController {
    
    var palette = BGColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 1.0)
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let colorSetupVC = segue.destination as? ColorSetupViewController
        colorSetupVC?.delegate = self
        
        let navigationVC = segue.source as? UINavigationController
        let mainVC = navigationVC?.topViewController as? MainViewController
        
        colorSetupVC?.red = mainVC?.palette.red ?? 0.0
        colorSetupVC?.green = mainVC?.palette.green ?? 0.0
        colorSetupVC?.blue = mainVC?.palette.blue ?? 0.0
        colorSetupVC?.alpha = mainVC?.palette.alpha ?? 0.0
        
    }

}

// MARK: - ColorSetupViewControllerDelegate
extension MainViewController: ColorSetupViewControllerDelegate {
    func getValues(from color: BGColor) {
        palette = color
        getColors()
    }
}

extension MainViewController {
    private func getColors() {
        view.backgroundColor = UIColor(
            red: CGFloat(palette.red),
            green: CGFloat(palette.green),
            blue: CGFloat(palette.blue),
            alpha: CGFloat(palette.alpha)
        )
    }
}
