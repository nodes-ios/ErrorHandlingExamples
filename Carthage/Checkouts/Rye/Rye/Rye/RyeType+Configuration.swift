//
//  RyeAlertType.swift
//  Rye
//
//  Created by Andrei Hogea on 12/06/2019.
//  Copyright © 2019 Nodes. All rights reserved.
//

import UIKit

public typealias RyeConfiguration = [Rye.Configuration.Key: Any]

public struct Rye {
    
    public enum AlertType {
        /**
         a SnackBar alert. Displayed at applications UIViewController level
         */
        case snackBar
        /**
         a Toast like alert. Displayed at alert level of the key UIWindow.
         */
        case toast
    }
    
    public enum ViewType {
        case standard(configuration: RyeConfiguration?)
        case custom(UIView, animationType: AnimationType = .slideInOut)
    }
    
    public enum Configuration {
        public enum Key: String {
            /**
             RyeView's background color
             */
            case backgroundColor
            /**
             RyeView's text color
             */
            case textColor
            /**
             RyeView's font
             */
            case textFont
            /**
             RyeView's text
             */
            case text
            /**
             RyeView's corner radius
             */
            case cornerRadius
            /**
             RyeView's animation type
             */
            case animationType
            /**
             RyeView's animation duration
             */
            case animationDuration
        }
    }
    
    public enum Position {
        case top(inset: CGFloat)
        case bottom(inset: CGFloat)
    }
    
    public enum AnimationType {
        case slideInOut
        case fadeInOut
    }
    
}
