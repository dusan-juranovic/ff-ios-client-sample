//
//  AccountRowController.swift
//  CFwatchOSDemoApp WatchKit Extension
//
//  Created by Dusan Juranovic on 13.5.21..
//

import WatchKit
import WatchConnectivity

class ModuleRowController: NSObject {
//	@IBOutlet weak var moduleImage: WKInterfaceImage!
	@IBOutlet weak var newImage: WKInterfaceImage!
	@IBOutlet weak var trialLabel: WKInterfaceLabel!
	@IBOutlet weak var accountNameLabel: WKInterfaceLabel!
	@IBOutlet weak var enableButton: WKInterfaceButton!
	@IBOutlet weak var accountImageView: WKInterfaceImage!
	
	override init() {
		super.init()
	}
	var removeRowReply:((Int)->())?
	var module: Module? {
		didSet {
			guard let module = module else {return}
			self.accountImageView.setImageNamed(module.featureImageName.appending("_dark"))
			if module.hasRibbon {
				self.newImage.setImageNamed("new")
			} else {
				self.newImage.setImage(UIImage())
			}
			self.trialLabel.setText(module.trialPeriod)
			self.accountNameLabel.setText(module.featureName.rawValue)
		}
	}
	
	@IBAction func enableButtonTapped() {
		print("Should enable \(module?.featureName.rawValue ?? "Module")")
		module?.enabled = true
		let message = [module?.featureName.rawValue ?? "":["Available":module?.available ?? true]]
		WCSession.default.sendMessage(message, replyHandler: {reply in
			let row = reply["Row"] as! Int
			self.removeRowReply?(row)
		})
	}
}
