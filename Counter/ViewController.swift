//
//  ViewController.swift
//  Counter
//
//  Created by Diana Kondrashova on 17.07.2024.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textUpdated: UITextView!
    @IBOutlet weak var buttonPlus: UIButton!
    @IBOutlet weak var buttomMinus: UIButton!
    @IBOutlet weak var counterScreen: UILabel! 
    @IBOutlet weak var buttonTouch: UIButton!

    var counter = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buttonPlus.backgroundColor = .systemRed
        buttomMinus.backgroundColor = .systemBlue
        buttonPlus.setTitle("+", for: .normal)
        buttomMinus.setTitle("-", for: .normal)
        buttonTouch.setTitle("Zero", for: .normal)
        
        counterScreen.text = "Значение счётчика: 0"
        buttonTouch.backgroundColor = .systemGray
        buttonTouch.addTarget(self, action: #selector(startCounter), for: .touchUpInside)
        buttonPlus.addTarget(self, action: #selector(plusCounter), for: .touchUpInside)
        buttomMinus.addTarget(self, action: #selector(minusCounter), for: .touchUpInside)
    
        textUpdated.isEditable = false
        textUpdated.isScrollEnabled = true
        textUpdated.text = "История изменений:\n"
    }
    @objc func startCounter() {
        counter = 0
        counterScreen.text = "Значение счётчика: 0"
        let currentDate = DateFormatter.localizedString(from: Date(), dateStyle: .medium, timeStyle: .short)
        let newDate = "\(currentDate)\n"
        textUpdated.text.append(newDate + "Значение сброшено\n")
        
        let rangeText = NSRange(location: 50, length: textUpdated.text.count - 50)
        textUpdated.scrollRangeToVisible(rangeText)
    }
    
    @objc func plusCounter() {
        counter += 1
        counterScreen.text = "Значение счётчика: \(counter)"
        
        if (counter < 0) {
            counterScreen.text = "Значение счётчика: 0"
        }
        let currentDate = DateFormatter.localizedString(from: Date(), dateStyle: .medium, timeStyle: .short)
        let newDate = "\(currentDate)\n"
        textUpdated.text.append(newDate + "Значение изменено на: +1\n")
        
        let rangeText = NSRange(location: 50, length: textUpdated.text.count - 50)
        textUpdated.scrollRangeToVisible(rangeText)
    }
    
    @objc func minusCounter() {
        
        counter -= 1
        counterScreen.text = "Значение счётчика: \(counter)"
        
        if (counter >= 0) {
            let currentDate = DateFormatter.localizedString(from: Date(), dateStyle: .medium, timeStyle: .short)
            let newDate = "\(currentDate)\n"
            textUpdated.text.append(newDate + "Значение изменено на: -1\n")
        } else {
            counter = 0
            let currentDate = DateFormatter.localizedString(from: Date(), dateStyle: .medium, timeStyle: .short)
            let newDate = "\(currentDate)\n"
            counterScreen.text = "Значение счётчика: 0"
            textUpdated.text.append(newDate + "Попытка уменьшить значение счётчика ниже 0\n")
        }
        let rangeText = NSRange(location: 50, length: textUpdated.text.count - 50)
        textUpdated.scrollRangeToVisible(rangeText)
    }
}

