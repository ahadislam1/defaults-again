//
//  ViewController.swift
//  defaults-again
//
//  Created by Ahad Islam on 12/23/19.
//  Copyright © 2019 Ahad Islam. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var welcomeLabel: UILabel!
    @IBOutlet var allLabels: [UILabel]!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var iswitch: UISwitch!
    
    
    var fontSize: Double = 10 {
        didSet {
            allLabels.forEach { $0.font = $0.font.withSize(CGFloat(fontSize)) }
            UserDefaultsWrapper.manager.store(fontSize: fontSize)
        }
    }
    
    var uppercaseText = false {
        didSet {
            switch uppercaseText {
            case true:
                allLabels.forEach { $0.text = $0.text?.uppercased() }
            case false:
                allLabels.forEach { $0.text = $0.text?.lowercased() }
            }
            UserDefaultsWrapper.manager.store(shouldUppercaseText: uppercaseText)
        }
    }
    
    var username = "" {
        didSet {
            welcomeLabel.text = "Welcome " + username + "!"
            UserDefaultsWrapper.manager.store(username: username)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        textField.delegate = self
        setInitialValuesFromUserDefaults()
        
    }

    @IBAction func updateFontSize(_ sender: UISlider) {
        fontSize = Double(sender.value)
    }
    
    @IBAction func updateUppercaseText(_ sender: UISwitch) {
        uppercaseText = sender.isOn
    }
    
    private func setInitialValuesFromUserDefaults() {
        if let storedUsername = UserDefaultsWrapper.manager.getUsername() {
            username = storedUsername
            textField.text = storedUsername
        }
        if let storedFontSize = UserDefaultsWrapper.manager.getFontSize() {
            fontSize = storedFontSize
            slider.value = Float(storedFontSize)
        }
        if let storedUppercaseText = UserDefaultsWrapper.manager.getShouldUppercaseText() {
            uppercaseText = storedUppercaseText
            iswitch.isOn = storedUppercaseText
        }
    }
    
    
}

extension ViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if let text = textField.text,
            let textRange = Range(range, in: text) {
            let updatedText = text.replacingCharacters(in: textRange, with: string)
            username = updatedText
        }
        return true
    }
}

