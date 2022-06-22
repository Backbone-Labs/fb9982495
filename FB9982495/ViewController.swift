//
//  ViewController.swift
//  FB9234019
//
//  Created by Shawn O'Connor on 7/20/21.
//

import ReplayKit
import UIKit

class ViewController: UIViewController {

    // Standard broadcast picker
    var broadcastPicker: RPSystemBroadcastPickerView = {
        // Create broadcast picker off screen we will simulate button events to trigger it
        let pickerView = RPSystemBroadcastPickerView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        // Theme the picker view to match the white that we want.
        if let button = pickerView.subviews.first as? UIButton {
            button.imageView?.tintColor = UIColor.white
        }
        pickerView.translatesAutoresizingMaskIntoConstraints = false
        return pickerView
    }()

    // Rounded button with a title which is easy to tap
    var showBroadcastPickerButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .systemBlue
        button.setTitle("Start Broadcast", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.setTitleColor(UIColor.white.withAlphaComponent(0.5), for: .highlighted)
        button.titleLabel?.baselineAdjustment = .alignCenters
        button.layer.cornerRadius = 25
        button.clipsToBounds = true
        return button
    }()
    
    // Rounded button with a title which is easy to tap
    var showBroadcastPickerButton4: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .systemRed
        button.setTitle("Start Broadcast 4", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.setTitleColor(UIColor.white.withAlphaComponent(0.5), for: .highlighted)
        button.titleLabel?.baselineAdjustment = .alignCenters
        button.layer.cornerRadius = 25
        button.clipsToBounds = true
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(showBroadcastPickerButton)
        view.addSubview(showBroadcastPickerButton4)
        
        // Broadcast picker is technically a button, but handle if the larger frame was tapped
        showBroadcastPickerButton.addTarget(self, action: #selector(showBroadcastPicker(sender:)), for: UIControl.Event.touchUpInside)
        showBroadcastPickerButton4.addTarget(self, action: #selector(showBroadcastPicker4(sender:)), for: UIControl.Event.touchUpInside)

        // Center the buttons
        NSLayoutConstraint.activate([
            showBroadcastPickerButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            showBroadcastPickerButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            showBroadcastPickerButton.widthAnchor.constraint(equalToConstant: 200),
            showBroadcastPickerButton.heightAnchor.constraint(equalToConstant: 50),
            showBroadcastPickerButton4.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            showBroadcastPickerButton4.topAnchor.constraint(equalTo: showBroadcastPickerButton.bottomAnchor, constant: 16),
            showBroadcastPickerButton4.widthAnchor.constraint(equalToConstant: 200),
            showBroadcastPickerButton4.heightAnchor.constraint(equalToConstant: 50),
        ])
    }

    @objc func showBroadcastPicker(sender: UIButton) {
        // make button easier to hit, relay press
        broadcastPicker.preferredExtension = nil
        if let button = broadcastPicker.subviews.first as? UIButton {
            button.sendActions(for: UIControl.Event.allTouchEvents)
        }
    }
    
    @objc func showBroadcastPicker4(sender: UIButton) {
        // make button easier to hit, relay press
        broadcastPicker.preferredExtension = "com.backbonelabs.FB9982495.BroadcastFour"
        if let button = broadcastPicker.subviews.first as? UIButton {
            button.sendActions(for: UIControl.Event.allTouchEvents)
        }
    }
}
