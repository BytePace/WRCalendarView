//
//  WREventCell.swift
//  Pods
//
//  Created by wayfinder on 2017. 4. 30..
//
//

import UIKit

public protocol WREventCellDelegate : class {
    func wrEventCellConfigure(cell : WREventCell, forEvent : WREvent)
}
public class WREventCell: UICollectionViewCell {
    weak var delegate : WREventCellDelegate!
    @IBOutlet public weak var titleLabel: UILabel!
    @IBOutlet public weak var centeredLabel: UILabel!
    
    override public func awakeFromNib() {
        super.awakeFromNib()
        
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 4)
        layer.shadowRadius = 5
        layer.shadowOpacity = 0
        
        updateColors()
    }
    
    override public var isSelected: Bool {
        didSet {
            if isSelected && isSelected != oldValue {
                UIView.animate(withDuration: TimeInterval(0.2), animations: { [unowned self] in
                    self.transform = CGAffineTransform.init(scaleX: 1.025, y: 1.025)
                    self.layer.shadowOpacity = 0.2
                    }, completion: { [unowned self] _ in
                        self.transform = CGAffineTransform.identity
                })
            } else if isSelected {
                layer.shadowOpacity = 0.2
            } else {
                layer.shadowOpacity = 0.0
            }
            updateColors()
        }
    }
    
    var event: WREvent? {
        didSet {
            if let event = event {
                delegate.wrEventCellConfigure(cell: self, forEvent: event)
            }
        }
    }
    
    func updateColors() {
        //        contentView.backgroundColor = backgroundColorHighlighted(isSelected)
        //        borderView.backgroundColor = borderColor()
        titleLabel.textColor = UIColor.white
    }
    
    //    func backgroundColorHighlighted(_ selected: Bool) -> UIColor {
    //        let color = event?.color ?? UIColor(red: 100/255, green: 150/255, blue: 207/255, alpha: 1)
    //        return selected ? color.withAlphaComponent(0.1) : color
    //    }
    //
    //    func textColorHighlighted(_ selected: Bool) -> UIColor {
    //        return selected ? UIColor.white : UIColor(hexString: "21729c")!
    //    }
    //
    //    func borderColor() -> UIColor {
    //        return self.backgroundColorHighlighted(false).withAlphaComponent(1.0)
    //    }
}
