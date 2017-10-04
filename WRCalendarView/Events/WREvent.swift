//
//  WREvent.swift
//  Pods
//
//  Created by wayfinder on 2017. 4. 29..
//
//

import UIKit
import DateToolsSwift

open class WREvent: TimePeriod {
    open var title: String = ""
    open var id: String = ""
    open var color : UIColor = UIColor.blue
//    open class func make(date:Date, chunk: TimeChunk, title: String) -> WREvent {
//        let event = WREvent(beginning: date, chunk: chunk)
//        event.title = title
//        
//        return event
//    }
    
    public init(start: Date?, end: Date?, title: String, id: String, color : UIColor) {
        super.init()
        self.beginning = start
        self.end = end
        self.title = title
        self.id = id
        self.color = color
    }
}
