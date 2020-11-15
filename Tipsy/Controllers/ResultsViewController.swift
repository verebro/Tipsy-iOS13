//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Владислав Керечанин on 21.07.2020.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {

    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    var finalResult = ""
    var split: Int?
    var tip: Int?

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        totalLabel.text = finalResult
        
        settingsLabel.text = "Split between \(split) people with \(tip)% tip"

  
    }
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
       
    }
    
}
