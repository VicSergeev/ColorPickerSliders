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
    
    private var colors = BGColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0)
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let colorSetupVC = segue.destination as? ColorSetupViewController
        colorSetupVC?.delegate = self
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }


}

// MARK: - ColorSetupViewControllerDelegate
extension MainViewController: ColorSetupViewControllerDelegate {
    func getValues(from color: BGColor) {
        colors = color
        getColors()
    }
}

extension MainViewController {
    private func getColors() {
        view.backgroundColor = UIColor(
            red: CGFloat(colors.red),
            green: CGFloat(colors.green),
            blue: CGFloat(colors.blue),
            alpha: CGFloat(colors.alpha)
        )
    }
}
