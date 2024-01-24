//
//  CAGradientLayer+ListStyle.swift
//  TaskPlanner
//
//  Created by Test on 24.01.24.
//

import UIKit

extension CAGradientLayer {
    static func gradientLayer(for style: ReminderListStyle, in frame: CGRect) -> Self {
        let layer = Self()
        layer.colors = colors(for: style)
        layer.frame = frame
        return layer
    }
    
    private static func colors(for style: ReminderListStyle) -> [CGColor] {
        let beginColor: UIColor
        let endColor: UIColor
        
        switch style {
        case .all:
            beginColor = .TodayGradientAllBegin
            endColor = .TodayGradientAllEnd
        case .future:
            beginColor = .TodayGradientFutureBegin
            endColor = .TodayGradientFutureEnd
        case .today:
            beginColor = .TodayGradientTodayBegin
            endColor = .TodayGradientTodayEnd
        }
        return [beginColor.cgColor, endColor.cgColor]
    }
}
