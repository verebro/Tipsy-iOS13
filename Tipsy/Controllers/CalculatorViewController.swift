//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var tipPrcnt = 0.0
    var peopleAmount = 2
    var billTotal = 0.0
    var result = "0.0"
    
    @IBAction func tipChanged(_ sender: UIButton) {
       
        billTextField.endEditing(true)
        
       zeroPctButton.isSelected = false
             tenPctButton.isSelected = false
             twentyPctButton.isSelected = false
             sender.isSelected = true
        
        let buttonTitle = sender.currentTitle!
               let buttonTitleMinusPercentSign = String(buttonTitle.dropLast())
               let buttonTitleAsANumber = Double(buttonTitleMinusPercentSign)!
               tipPrcnt = buttonTitleAsANumber / 100
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = String(format: "%.0f", sender.value)
        peopleAmount = Int(sender.value)

    }
    @IBAction func calculatePressed(_ sender: UIButton) {
       
       let bill = billTextField.text!
        if bill != "" {
            billTotal = Double(bill)!
            let summ = (billTotal + billTotal * tipPrcnt) / Double(peopleAmount)
            result = String(format: "%.2f", summ)
        }
         self.performSegue(withIdentifier: "goToResults", sender: self)
    }
        
       
       
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    
            if segue.identifier == "goToResults"{
                
                let destinationController = segue.destination as! ResultsViewController
                destinationController.split = peopleAmount
                destinationController.tip = Int(tipPrcnt * 100)
                destinationController.finalResult = result
            }
        }
}
