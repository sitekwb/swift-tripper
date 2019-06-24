//
//  Model.swift
//  Tripper
//
//  Created by Wojtek on 21/06/2019.
//  Copyright © 2019 Wojciech Sitek. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class Model{
    
    public enum ViewState{
        case start
        case newBill
        case newTrip
    }
    
    var viewState:ViewState = .start {
        didSet{
            switch viewState{
                case .start:
                    print("TODO")
                case .newBill:
                    print("TODO")
                default:
                    print("TODO")
            }
        }
    }
    
    var tripTmp    : Trip?
    var trips       : [Trip] = []
    var context: NSManagedObjectContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    
    func fetchTrips(){
        do{
            let trips = try self.context.fetch(Trip.fetchRequest() as NSFetchRequest<Trip>)
            //TODO REMOVE TEST
            for trip in trips{
                print("Name: \(String(describing: trip.name)), Email: \(String(describing: trip.date))")
            }
            
        }
        catch{
            print("Data fetching failed!")
        }
    }
    
    public static func sendViewStateNotification(_ state:ViewState){
        let notificationCenter = NotificationCenter.default
        let notification = Notification(name: Notification.Name(rawValue: "viewStateNotification"), object: state)
        notificationCenter.post(notification)
    }
    
    public static func sendNewTripNotification(_ tripInfo:[String:Any]){
        let notificationCenter = NotificationCenter.default
        let notification = Notification(name: Notification.Name(rawValue: "newTripNotification"), object: tripInfo)
        notificationCenter.post(notification)
    }
    
    public func getTrips() ->[Trip]{
        return trips
    }
    
    
    init(){
        //TODO remove test
        print("Model init start")
        
        //fetch trips from Core Data
        fetchTrips()
        
        //observe changing view state
        NotificationCenter.default.addObserver(
            forName: NSNotification.Name(rawValue: "viewStateNotification"),
            object:  nil,
            queue:   nil
        ){ (theNotification:Notification) -> Void in
            self.viewState = theNotification.object as! ViewState
            print("View state is now \(self.viewState)")
        }
        
        //observe adding new trip
        NotificationCenter.default.addObserver(
            forName: NSNotification.Name(rawValue: "newTripNotification"),
            object:  nil,
            queue:   nil
        ){ (theNotification:Notification) -> Void in
            
            let tripInfo = theNotification.object as! [String:Any]
            
            let name = (tripInfo["name"] ?? "Name") as! String
            let date = (tripInfo["date"] ?? NSDate()) as! NSDate
            
            if self.viewState == .newTrip && self.uniqueTrip(name, date){
                self.tripTmp = Trip(context: self.context)
                self.tripTmp!.name = name
                self.tripTmp!.date = date
                self.context.insert(self.tripTmp!)
                do{
                    try self.context.save()
                }catch{
                    print("Failed saving context")
                }
                self.trips.append(self.tripTmp!)
            }
        }
        
        //observe adding new bill
        /* TODO TO FINISH LATER!
        NotificationCenter.default.addObserver(
            forName: NSNotification.Name(rawValue: "newBillNotification"),
            object:  nil,
            queue:   nil
        ){ (theNotification:Notification) -> Void in
            
            let tripIndex = theNotification.object as! Int
            
            if self.viewState == .newBill && self.uniqueTrip(name, date){
                self.tripTmp = Trip(context: self.context)
                self.tripTmp!.name = name
                self.tripTmp!.date = date
                self.context.insert(self.tripTmp!)
                do{
                    try self.context.save()
                }catch{
                    print("Failed saving context")
                }
                self.trips.append(self.tripTmp!)
            }
        }
        */
        
        //TODO remove test
        print("Model init finish")
    }
    
    
    func uniqueTrip(_ name:String, _ date:NSDate) ->Bool{
        for trip in trips {
            if trip.name == name && trip.date == date{
                return false
            }
        }
        return true
    }
    
    
}
