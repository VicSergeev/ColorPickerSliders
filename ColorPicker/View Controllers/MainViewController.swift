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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let colorSetupVC = segue.destination as? ColorSetupViewController
        
        colorSetupVC?.delegate = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }


}

extension MainViewController: ColorSetupViewControllerDelegate {
    func getValues(from color: BGColor) {
        view.backgroundColor = UIColor(
            red: CGFloat(color.red), green: CGFloat(color.green), blue: CGFloat(color.blue), alpha: CGFloat(color.alpha)
        )
    }
}
