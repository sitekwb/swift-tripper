//
//  Bill.swift
//  Tripper
//
//  Created by Wojtek on 21/06/2019.
//  Copyright © 2019 Wojciech Sitek. All rights reserved.
//

import Foundation

class Bill{
    let trip : Trip
    let name : String
    let persons : [(Person, Double)]
    
    init(trip t:Trip, name n:String, persons p:[(Person,Double)]){
        trip = t
        name = n
        persons = p
    }
}
