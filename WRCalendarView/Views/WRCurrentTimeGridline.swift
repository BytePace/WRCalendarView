//
//  WRCurrentTimeGridline.swift
//
//  Created by wayfinder on 2017. 4. 6..
//  Copyright © 2017년 revo. All rights reserved.
//

import UIKit

class WRCurrentTimeGridline: UICollectionReusableView {
    let circleView1 = UIView(frame: CGRect(x: 0, y: 0, width: 4, height: 4))
    let circleView2 = UIView(frame: CGRect(x: 0, y: 0, width: 4, height: 4))
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor(hexString: "5E97E7")
        addSubview(circleView1)
        addSubview(circleView2)
        circleView1.layer.cornerRadius = 2
        circleView2.layer.cornerRadius = 2
        
        circleView1.layer.masksToBounds = true
        circleView2.layer.masksToBounds = true
        
        circleView1.backgroundColor = backgroundColor
        circleView2.backgroundColor = backgroundColor
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        var f = circleView2.bounds
        f.origin.y = -circleView1.frame.size.height / 2
        f.origin.x = -circleView1.frame.size.width / 2
        circleView1.frame = f
        f.origin.x = bounds.size.width - circleView2.frame.size.width / 2
        circleView2.frame = f
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
