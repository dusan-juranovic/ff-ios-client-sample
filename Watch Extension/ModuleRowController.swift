//
//  AccountRowController.swift
//  CFwatchOSDemoApp WatchKit Extension
//
//  Created by Dusan Juranovic on 13.5.21..
//

import WatchKit

class ModuleRowController: NSObject {
	@IBOutlet weak var moduleImage: WKInterfaceImage!
	@IBOutlet weak var newImage: WKInterfaceImage!
	@IBOutlet weak var trialLabel: WKInterfaceLabel!
	@IBOutlet weak var descriptionLabel: WKInterfaceLabel!
	@IBOutlet weak var enableButton: WKInterfaceButton!
	
	
	var module: Module? {
		didSet {
			guard let module = module else {return}
			self.moduleImage.setImageNamed(module.featureImageName.appending("_dark"))
			if module.hasRibbon {
				self.newImage.setImageNamed("new")
			} else {
				self.newImage.setImage(UIImage())
			}
			self.trialLabel.setText(module.trialPeriod)
			self.descriptionLabel.setText(module.featureDescription)
		}
	}
	@IBAction func enableButtonTapped() {
		print("Should enable \(module?.featureName.rawValue ?? "Module")")
	}
}
