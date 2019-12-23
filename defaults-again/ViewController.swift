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
    
    var fontSize: Double = 10 {
        didSet {
            allLabels.forEach { $0.font = $0.font.withSize(CGFloat(fontSize)) }
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
        }
    }
    
    var username = "" {
        didSet {
            welcomeLabel.text = "Welcome " + username + "!"
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        textField.delegate = self
        
    }

    @IBAction func updateFontSize(_ sender: UISlider) {
        fontSize = Double(sender.value)
    }
    
    @IBAction func updateUppercaseText(_ sender: UISwitch) {
        uppercaseText = sender.isOn
    }
    
    
}

extension ViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if let text = textField.text,
            let textRange = Range(range, in: text) {
            let updatedText = text.replacingCharacters(in: textRange, with: string)
            username = updatedText
        }
        print(username)
        return true
    }
}

