//
//  Test_View.swift
//  EricaTPC01CustomAlignmentRect2
//
//  Created by prenez on 4/11/15.
//  Copyright (c) 2015 Prenezsoft. All rights reserved.
//

import UIKit



class Test_View : UIView {
    
    override func drawRect(rect: CGRect) {
       
        var path : UIBezierPath? = nil // changed from NSBezierPath
        
        let dx : CGFloat  = (self.frame.size.width - 170) / 2.0
        let dy : CGFloat = (self.frame.size.height - 170)
        
        
        // draw a shadow
        
        var rect: CGRect = CGRect(x: 8.0 + dx, y: -8.0 + dy, width: 160.0, height: 160.0)
        path = UIBezierPath(roundedRect: rect, cornerRadius: 32.0)
        
        UIColor.blackColor().colorWithAlphaComponent(0.3).set()
        path?.fill()
        
        // draw shape with outline
        rect.origin = CGPoint( x: dx, y: dy)
        UIColor.blackColor().set()
        path?.lineWidth = 6
        path?.stroke()
        
        UIColor.orangeColor().set()
        path?.fill()


    }
   
    
   #if USE_ALIGNMENT_RECTS
    
    override func frameForAlignmentRect( alignmentRect: CGRect) -> CGRect {
        
        var rect: CGRect = CGRect(origin: alignmentRect.origin, size: CGSize(width: alignmentRect.size.width * 1.06250, height: alignmentRect.size.height * 1.06250))
        
        return rect
    }
    
    override func alignmentRectForFrame( frame: CGRect) -> CGRect {
        var rect: CGRect? = nil
        var dy : CGFloat = (frame.size.height - 170) / 2.0
        rect?.origin = CGPoint(x: frame.origin.x, y: frame.origin.y + dy)
        rect?.size.width = frame.size.width * 0.94117
        rect?.size.height = frame.size.height * 0.94117
        return rect!
        
    }
    
    
  #endif
    
    
    
    
}
