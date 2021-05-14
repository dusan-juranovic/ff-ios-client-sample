//
//  AccountListInterfaceController.swift
//  CFwatchOSDemoApp
//
//  Created by Dusan Juranovic on 13.5.21..
//

import WatchKit
import WatchConnectivity
import Foundation

class AccountListInterfaceController: WKInterfaceController {
	@IBOutlet weak var tableView: WKInterfaceTable!
	var modules: [Module] = []
	
	override func awake(withContext context: Any?) {
        super.awake(withContext: context)
	
    }
	
	override func willActivate() {
		if WCSession.isSupported() {
			let session = WCSession.default
			session.delegate = self
			session.activate()
		}
	}
}

extension AccountListInterfaceController: WCSessionDelegate {
	func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
		
	}
	
	func session(_ session: WCSession, didReceiveMessage message: [String : Any]) {
		guard let moduleDicts = message["Modules"] as? [[String:Any]] else {return}
		var modules = [Module]()
		for module in moduleDicts {
			let module = Module(dictionary: module)
			modules.append(module)
		}
		if self.modules == modules {
			return
		}
		self.modules = modules
		self.tableView.setNumberOfRows(modules.count, withRowType: "ModuleRow")
		for index in 0..<tableView.numberOfRows {
			guard let controller = tableView.rowController(at: index) as? ModuleRowController else {continue}
			controller.module = modules[index]
		}
	}
}
