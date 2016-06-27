//
//  ViewController.swift
//  ColorPicker
//
//  Created by Swift de Férias on 18/01/16.
//  Copyright © 2016 tDesign. All rights reserved.
//

import UIKit
import GoogleMobileAds

class ViewController: UIViewController {

    @IBOutlet weak var preview: UIView!
    @IBOutlet weak var bannerView: GADBannerView!


    @IBOutlet weak var sliderRed: UISlider!
    @IBOutlet weak var sliderGreen: UISlider!
    @IBOutlet weak var sliderBlue: UISlider!
    @IBOutlet weak var RGBLabel: UILabel!
    @IBOutlet weak var CMYKLabel: UILabel!
    @IBOutlet weak var HexaLabel: UILabel!

    @IBAction func sliderMudou(sender: UISlider) {
        let r = sliderRed.value
        let g = sliderGreen.value
        let b = sliderBlue.value
        
        let cor = UIColor(
            red: CGFloat(r),
            green: CGFloat(g),
            blue: CGFloat(b),
            alpha: 1
        )
        let red = (round(100*(r * 255)/100))
        let green = (round(100*(g * 255)/100))
        let blue = (round(100*(b * 255)/100))
        
        preview.backgroundColor = cor
        
        RGBLabel.text = "R:\(red.cleanValue), G:\(green.cleanValue), B:\(blue.cleanValue)"
        print(r, g, b)

    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        print("Google Mobile Ads SDK version: " + GADRequest.sdkVersion())
        bannerView.adUnitID = "ca-app-pub-3910981515171501/2746564674"
        bannerView.rootViewController = self
        bannerView.loadRequest(GADRequest())
    }

}

extension Float {
    var cleanValue: String {
        return self % 1 == 0 ? String(format: "%.0f", self) : String(self)
    }
}