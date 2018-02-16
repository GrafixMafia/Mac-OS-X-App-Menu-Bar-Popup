//
//  AppDelegate.swift
//  Popup
//
//  Created by Maxim on 10/21/15.
//  Copyright © 2015 Maxim. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

	let statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.squareLength)
	let popover = NSPopover()
	
	func applicationDidFinishLaunching(_ aNotification: Notification) {
		
		if let button = statusItem.button {
			button.image = NSImage(named: NSImage.Name(rawValue: "StatusBarButtonImage"))
			button.action = #selector(AppDelegate.togglePopover(_:))
		}
		
		let mainViewController = NSStoryboard(name: NSStoryboard.Name(rawValue: "Main"), bundle: nil).instantiateController(withIdentifier: NSStoryboard.SceneIdentifier(rawValue: "ViewControllerId")) as! ViewController
		
        popover.behavior = NSPopover.Behavior.transient
		popover.contentViewController = mainViewController
		
		
	}

	func applicationWillTerminate(_ aNotification: Notification) {
	}

	@objc func togglePopover(_ sender: AnyObject?) {
		if popover.isShown {
			closePopover(sender)
		} else {
			showPopover(sender)
		}
	}
	
	func showPopover(_ sender: AnyObject?) {
		if let button = statusItem.button {
			popover.show(relativeTo: button.bounds, of: button, preferredEdge: NSRectEdge.minY)
		}
	}
	
	func closePopover(_ sender: AnyObject?) {
		popover.performClose(sender)
	}

}

