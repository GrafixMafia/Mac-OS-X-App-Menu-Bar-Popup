# Mac OS X Application like a menu bar popup message

Simple NSPopover Example which shows how to create a macOS application as a menu bar popup message.<br>
Like that:

![alt tag](https://raw.github.com/maximbilan/Mac-OS-X-App-Menu-Bar-Popup/master/screenshots/1.png)

And example of <i>AppDelegate</i>:

<pre>
import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

	let statusItem = NSStatusBar.system().statusItem(withLength: -2)
	let popover = NSPopover()

	func applicationDidFinishLaunching(_ aNotification: Notification) {
		
		if let button = statusItem.button {
			button.image = NSImage(named: "StatusBarButtonImage")
			button.action = #selector(AppDelegate.togglePopover(_:))
		}
		
		let mainViewController = NSStoryboard(name: "Main", bundle: nil).instantiateController(withIdentifier: "ViewControllerId") as! ViewController
		
		   
        popover.behavior = NSPopover.Behavior.transient
		popover.contentViewController = mainViewController
		
	}

	func applicationWillTerminate(_ aNotification: Notification) {
	}

	func togglePopover(_ sender: AnyObject?) {
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
</pre>

Full code of this example you can find in this repository.
Simplified version of https://github.com/maximbilan/Mac-OS-X-App-Menu-Bar-Popup