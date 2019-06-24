//
//  NewThingViewController.swift
//  Tripper
//
//  Created by Wojtek on 22/06/2019.
//  Copyright © 2019 Wojciech Sitek. All rights reserved.
//

import UIKit

class NewThingViewController: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    @IBAction func pushedNewTrip(_ sender: UIButton) {
        Model.sendViewStateNotification(Model.ViewState.newTrip)
    }
    
    @IBAction func pushedNewBill(_ sender: UIButton) {
        Model.sendViewStateNotification(Model.ViewState.newBill)
    }
}
