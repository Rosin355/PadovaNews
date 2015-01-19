//
//  Date.swift
//  PadovaNews
//
//  Created by Romesh Singhabahu on 17/01/15.
//  Copyright (c) 2015 Romesh Singhabahu. All rights reserved.
//

import Foundation

class Date {
    class func from (#year: Int, month: Int, day: Int) -> NSDate {
        
        var components = NSDateComponents ()
        components.year = year
        components.month = month
        components.day = day
        
        var gregorianCalendar  = NSCalendar (calendarIdentifier: NSGregorianCalendar)
        var date = gregorianCalendar?.dateFromComponents(components)
        
        return date!
        
        }
    
    class func toString (#date: NSDate) ->String {
        
        let dateStringFormatter = NSDateFormatter (); dateStringFormatter.dateFormat = "dd-MM-yyyy"
        let datestring = dateStringFormatter.stringFromDate(date)
        
        
        return datestring
    }
}