//
//  DetailModuleController.swift
//  Watch Extension
//
//  Created by Dusan Juranovic on 14.5.21..
//

import WatchKit
import Foundation


class DetailModuleController: WKInterfaceController {

	@IBOutlet weak var detailLabel: WKInterfaceLabel!
	
	override func awake(withContext context: Any?) {
		self.detailLabel.setText(context as? String)
	}

}
