//
//  Transition.swift
//  Interview
//
//  Created by kevin14 on 15/1/3.
//  Copyright (c) 2015年 kevin14. All rights reserved.
//

import UIKit

struct Transition {
    static func push()->CATransition {
        
        var transition:CATransition = CATransition()
        transition.duration = 0.3
        transition.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut)
        transition.type = kCATransitionPush
        transition.subtype = kCATransitionFromRight
        
        return transition
    }
    
    static func dismiss() -> CATransition {
    
        var transition:CATransition = CATransition()
        transition.duration = 0.3
        transition.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut)
        transition.type = kCATransitionPush
        transition.subtype = kCATransitionFromLeft
        
        return transition

    }
}
