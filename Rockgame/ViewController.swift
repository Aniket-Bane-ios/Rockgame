//
//  ViewController.swift
//  Rockgame
//
//  Created by Aniket Bane on 11/02/24.
//

import UIKit
class ViewController: UIViewController {
    
    @IBOutlet weak var resultLabelView: UILabel!
    
    @IBOutlet weak var submitButton: UIButton!
    
    @IBOutlet weak var PickerView: UIPickerView!
    
    @IBOutlet weak var resultImageView: UIImageView!
    @IBOutlet weak var linkdinImageView: UIImageView!
    
    private let computer = computer_Cpp_Wrapper()            // Initializing an instance of the class
    
    private var userSelected : String = "Stone"
    
    private let userSelections : [String] = ["Stone", "Paper", "Scissor"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        linkdinImageView.isHidden = true
        resultLabelView.text = "Let's play!"
        resultLabelView.textColor = UIColor.systemIndigo
        resultImageView.image = UIImage(named: "logo")
        
    }
    
    @IBAction func onSubmitButtonClick(_ sender: UIButton) {
        resultLabelView.isHidden = false
        let result = computer.playGame(userSelected) 
        changeUI(result ?? "")
    }
    
    
    private func changeUI(_ result:String) {
        if (result == "You win for having the right guess.") {
            resultLabelView.text = result
            resultLabelView.textColor = UIColor.systemGreen
            resultImageView.image = UIImage(named: "winner")
        } else if (result == "We regret.This time, computer won."){
            resultLabelView.text = result
            resultLabelView.textColor = UIColor.systemPink
            resultImageView.image = UIImage(named: "loser")
        }else if (result == "Oh dear! You both made the same guess; try again!"){
            resultLabelView.text = result
            resultLabelView.textColor = UIColor.systemOrange
            resultImageView.image = UIImage(named: "equal")
        }else{
            resultLabelView.text = result
            resultLabelView.textColor = UIColor.systemOrange
            resultImageView.image = UIImage(named: "broken")
        }
    }
}


extension ViewController: UIPickerViewDataSource, UIPickerViewDelegate{
    
    // MARK: - UIPickerViewDataSource
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return userSelections.count
    }
    
    // MARK: - UIPickerViewDelegate
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return userSelections[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        computer.playGame(userSelections[row])
    }
    
}
