//
//  Module.swift
//  CFwatchOSDemoApp WatchKit Extension
//
//  Created by Dusan Juranovic on 13.5.21..
//

import Foundation

enum FeatureName: String {
	case Delivery
	case Verification
	case Integration
	case Features
	case Efficiency
	
	init?(rawValue: String) {
		switch rawValue {
			case "Verification": self = .Verification
			case "Integration": self = .Integration
			case "Features": self = .Features
			case "Efficiency": self = .Efficiency
			default: self = .Delivery
			
		}
	}
}

class Module: Equatable {
	var id: Int
	var featureImageName: String
	var featureName: FeatureName
	var featureDescription: String
	var featureTrialPeriod: Int
	var enabled: Bool
	var available: Bool
	var hasRibbon: Bool
	
	init(id: Int, featureImageName: String, featureName: FeatureName, featureDescription: String, featureTrialPeriod: Int, enabled: Bool, available: Bool, hasRibbon: Bool) {
		self.id = id
		self.featureImageName = featureImageName
		self.featureName = featureName
		self.featureDescription = featureDescription
		self.featureTrialPeriod = featureTrialPeriod
		self.enabled = enabled
		self.available = available
		self.hasRibbon = hasRibbon
	}
	
	init(dictionary: [String:Any]) {
		self.id = dictionary["id"] as! Int
		self.featureImageName = dictionary["featureImageName"] as! String
		self.featureName = FeatureName(rawValue:dictionary["featureName"] as! String) ?? .Delivery
		self.featureDescription = dictionary["featureDescription"] as! String
		self.featureTrialPeriod = dictionary["featureTrialPeriod"] as! Int
		self.enabled = dictionary["enabled"] as! Bool
		self.available = dictionary["available"] as! Bool
		self.hasRibbon = dictionary["hasRibbon"] as! Bool
	}
	
	var trialPeriod: String {
		return "\(self.featureTrialPeriod)-Days Trial"
	}
	
	static func ==(lhs: Module, rhs:Module) -> Bool {
		return
			lhs.id == rhs.id &&
			lhs.available == rhs.available &&
			lhs.enabled == rhs.enabled &&
			lhs.hasRibbon == rhs.hasRibbon &&
			lhs.featureTrialPeriod == rhs.featureTrialPeriod
	}
}
