//
//  ColorSetupViewController.swift
//  ColorPicker
//
//  Created by Vic on 09.12.2023.
//

import UIKit

final class ColorSetupViewController: UIViewController {
    
    @IBOutlet var colorView: UIView!
    
    @IBOutlet var redLabel: UILabel!
    @IBOutlet var greenLabel: UILabel!
    @IBOutlet var blueLabel: UILabel!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    weak var delegate: ColorSetupViewControllerDelegate?
    
    var color = BGColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 1.0)
    var red: Float!
    var green: Float!
    var blue: Float!
    var alpha: Float!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        colorView.layer.cornerRadius = 15
        
        setColor()
        setupSliderTrack()
        
        redLabel.text = string(from: redSlider)
        greenLabel.text = string(from: greenSlider)
        blueLabel.text = string(from: blueSlider)
        
        red = 0.0
        green = 0.0
        blue = 0.0
        alpha = 1.0
        
    }
    
    @IBAction func sliderAction(_ sender: UISlider) {
        setColor()
        
        switch sender {
        case redSlider:
            redLabel.text = String(format: "%.2f", redSlider.value)
            color.red = sender.value
        case greenSlider:
            greenLabel.text = String(format: "%.2f", greenSlider.value)
            color.green = sender.value
        default :
            blueLabel.text = String(format: "%.2f", blueSlider.value)
            color.blue = blueSlider.value
        }
    }
    
    @IBAction func doneButtonAction(_ sender: UIButton) {
        delegate?.getValues(from: color)
        dismiss(animated: true)
    }
    
    
    private func setColor() {
        colorView.backgroundColor = UIColor(
            red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value),
            alpha: 1
        )
    }
    
    private func string(from slider: UISlider) -> String {
        String(format: "%.2f", slider.value)
    }
    
    private func setupSliderTrack() {
        redSlider.minimumTrackTintColor = .red
        greenSlider.minimumTrackTintColor = .green
        blueSlider.minimumTrackTintColor = .blue
    }
}

//extension ColorSetupViewController {
//    private func setValues() {
//        redLabel.text = String(color.red)
//        greenLabel.text = String(color.green)
//        blueLabel.text = String(color.blue)
//        
//        redSlider.value = color.red
//        greenSlider.value = color.green
//        blueSlider.value = color.blue
//    }
//}
