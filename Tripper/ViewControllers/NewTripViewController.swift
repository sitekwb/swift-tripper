//
//  NewTripViewController.swift
//  Tripper
//
//  Created by Wojtek on 24/06/2019.
//  Copyright © 2019 Wojciech Sitek. All rights reserved.
//

import UIKit

class NewTripViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var datePicker: UIDatePicker!
    
    @IBAction func pushedSave(_ sender: UIButton) {
        let tripInfo = [
            "name" : nameTextField.text!,
            "date" : datePicker.date
            ] as [String : Any]
        Model.sendNewTripNotification(tripInfo)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
