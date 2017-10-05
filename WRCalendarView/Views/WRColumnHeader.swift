//
//  ScheduleWeekColumnHeader.swift
//  Argos
//
//  Created by wayfinder on 2017. 4. 2..
//  Copyright © 2017년 Tong. All rights reserved.
//

import UIKit
import DateToolsSwift
public protocol WRColumnHeaderDelegate : class {
    func wrColumnHeaderConfigure(_ header : WRColumnHeader, forDate date: Date)
    func wrColumnHeaderCrossButtonSelected(_ header : WRColumnHeader, forDate date: Date)
}

public class WRColumnHeader: UICollectionReusableView {
    weak var delegate : WRColumnHeaderDelegate!

    @IBOutlet public weak var dayLbl: UILabel!
    @IBOutlet public weak var weekdayLbl: UILabel!
    @IBOutlet public weak var crossButton: UIButton!
    
    let calendar = Calendar.current
    let dateFormatter = DateFormatter()
    
    override public func awakeFromNib() {
        super.awakeFromNib()        
    }
    
    var date: Date? {
        didSet {
            if let date = date {
                delegate.wrColumnHeaderConfigure(self, forDate: date)
            }
        }
    }
    
    @IBAction func crossButtonSelecte(_ sender: Any) {
        delegate.wrColumnHeaderCrossButtonSelected(self, forDate: date!)
    }
    
    override public func prepareForReuse() {
        super.prepareForReuse()
        dayLbl.text = ""
        weekdayLbl.text = ""
    }
}

class ShrinkingLabel : UILabel {}
