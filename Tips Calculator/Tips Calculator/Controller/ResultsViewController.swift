//
//  ResultsViewController.swift
//  Tips Calculator
//
//  Created by Adithya on 13/05/24.
//

import UIKit

class ResultsViewController: UIViewController {
    
    @IBOutlet weak var lblResultDetails: UILabel!
    @IBOutlet weak var lblResult: UILabel!
    var result:String = ""
    var numberOfPeople:Int = 2
    var tip : Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lblResult.text = result
        lblResultDetails.text = "Split between \(numberOfPeople) people, with \(tip)% tip."
        
    }

    @IBAction func btnReCalculatePressed(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
}
