//
//  Trip.swift
//  
//
//  Created by Wojtek on 21/06/2019.
//

import Foundation

class Trip{
    let persons : [Person]
    let name    : String
    let bills   : [Bill]
    
    init(persons p:[Person], name n:String, bills b:[Bill]){
        persons = p
        name = n
        bills = b
    }
    
    init(_ n:String){
        name = n
        persons = []
        bills = []
    }
}
