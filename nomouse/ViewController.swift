//
//  ViewController.swift
//  nomouse
//
//  Created by Sergej Jaskiewicz on 21/01/2018.
//  Copyright © 2018 Sergej Jaskiewicz. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    @IBOutlet var decrementDeltaTextField: NSTextField!
    @IBOutlet var restorationDelayTextField: NSTextField!
    @IBOutlet var incrementDeltaTextField: NSTextField!
    
    private var timer: Timer?
    
    private let brightness = Brightness()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func applySettings(_ sender: NSButton) {
        
        let interval = restorationDelayTextField.doubleValue
        let incrementDelta = incrementDeltaTextField.floatValue
        let decrementDelta = decrementDeltaTextField.floatValue
        
        timer = .scheduledTimer(withTimeInterval: interval,
                                repeats: true) { [unowned self] _ in
            try! self.brightness
                .setValue(self.brightness.getValue() + incrementDelta)
        }
        
        NSEvent.addGlobalMonitorForEvents(matching: .leftMouseDown) {
            [unowned self] _ in
            
            try! self.brightness
                .setValue(self.brightness.getValue() - decrementDelta)
        }
    }
}

