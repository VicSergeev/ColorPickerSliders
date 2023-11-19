//
//  ViewController.swift
//  ColorPicker
//
//  Created by Vic on 19.11.2023.
//

import UIKit

final class ViewController: UIViewController {
    
    // MARK: Sliders outlets
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    // MARK: View outlet
    @IBOutlet var colorView: UIView!
    
    // MARK: Sliders value labels
    @IBOutlet var redSliderValueLabel: UILabel!
    @IBOutlet var greenSliderValueLabel: UILabel!
    @IBOutlet var blueSliderValueLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupLabels()
        setupSliders()
    }
    
    // MARK: Setup sliders UI
    private func setupSliders() {
        redSlider.minimumValue = 0.1
        redSlider.maximumValue = 100
        redSlider.minimumTrackTintColor = .red
        greenSlider.minimumTrackTintColor = .green
        
        blueSlider.minimumTrackTintColor = .blue
    }
    
    // MARK: Sliders actions
    @IBAction func redSliderAction(_ sender: UISlider) {
        redSliderValueLabel.text = redSlider.value.formatted()
    }
    
    @IBAction func greenSliderAction(_ sender: UISlider) {
        greenSliderValueLabel.text = greenSlider.value.formatted()
    }
    
    @IBAction func blueSliderAction(_ sender: UISlider) {
        blueSliderValueLabel.text = blueSlider.value.formatted()
    }
    
    
}

