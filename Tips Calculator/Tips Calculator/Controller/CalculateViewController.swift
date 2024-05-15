//
//  ViewController.swift
//  Tips Calculator
//
//  Created by Adithya on 13/05/24.
//goToResults
import UIKit

class CalculateViewController: UIViewController, UITextFieldDelegate {
    
    //Declaration & Outlets here!
    
    @IBOutlet weak var txtBill: UITextField!
    
    @IBOutlet weak var btnZeroPercent: UIButton!
    
    @IBOutlet weak var btnTenPercent: UIButton!
    
    @IBOutlet weak var btnTwentyPercent: UIButton!
    
    @IBOutlet weak var btnCalculate: UIButton!
    
    @IBOutlet weak var stepper: UIStepper!
    
    @IBOutlet weak var lblSplit: UILabel!
    
    var tip : Double = 0
    var numberOfPeople : Int = 2
    
    var calculation = CalculateTips()
    
    override func viewDidLoad() {
        // Do any additional setup after loading the view.
        //As soon as view is loaded set these values
        super.viewDidLoad()
        stepper.minimumValue = 2
        stepper.maximumValue = 100
        stepper.autorepeat = false
        stepper.value = 2
        self.txtBill.delegate = self
        
    }
    
    //Setting Action for Tip buttons (0%, 10% & 20%)
    
    @IBAction func btnTipPercentagePressed(_ sender: UIButton) {
        txtBill.resignFirstResponder()
        //Setting tips to false
        btnZeroPercent.isSelected = false
        btnTenPercent.isSelected = false
        btnTwentyPercent.isSelected = false
        
        //Here, setting the selected buttons state to true
        
        sender.isSelected = true
        let selectedTip =  String(sender.currentTitle!.dropLast())
        calculation.calculte(selectedTip)
        
        
    }
    
    
    @IBAction func setNumberOfSplits(_ sender: UIStepper) {
        lblSplit.text =  String(Int(sender.value))
        numberOfPeople = calculation.numberOfPeople(Int(sender.value))
        
    }
    
    @IBAction func btnCalculatePressed(_ sender: UIButton) {
        
        txtBill.resignFirstResponder()
        
        if(numberOfPeople > 1){
            
            calculation.getTheBill(txtBill.text!)
            performSegue(withIdentifier: "goToResults", sender: self)
        }
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResults"{
            let vc = segue.destination as! ResultsViewController
            let finalResult = calculation.calculateResult()
            vc.result = finalResult
            vc.numberOfPeople = self.numberOfPeople
            vc.tip = calculation.getTipsValue()
            
            
        }
    }
    
    
}

