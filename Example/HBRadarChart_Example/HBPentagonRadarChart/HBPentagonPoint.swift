//
//  HBPentagonPoint.swift
//  HBRadarChart_Example
//
//  Created by 김혜빈 on 2021/03/30.
//  Copyright © 2021 CocoaPods. All rights reserved.
//
import UIKit

struct HBPentagonPoint {
    var midX: CGFloat
    var midY: CGFloat
    var width: CGFloat
    var count: CGFloat
    var spacing: CGFloat = 20
    var spacingFromSuperView: CGFloat = 12
    
    private let radian: CGFloat = 54 * CGFloat.pi / 180
    
    func getPoints() -> [CGPoint] {
        var points: [CGPoint] = []
        
        points.append(CGPoint(x: midX, y: spacingFromSuperView + spacing * count))
        points.append(CGPoint(x: midX + (width * cos(radian) * sin(radian)), y: spacingFromSuperView + spacing * count + (width * cos(radian) * cos(radian))))
        points.append(CGPoint(x: midX + (width/2 * cos(radian)), y: midY + (width/2 * sin(radian))))
        points.append(CGPoint(x: midX - (width/2 * cos(radian)), y: midY + (width/2 * sin(radian))))
        points.append(CGPoint(x: midX - (width * cos(radian) * sin(radian)), y: spacingFromSuperView + spacing * count + (width * cos(radian) * cos(radian))))
        points.append(CGPoint(x: midX, y: spacingFromSuperView + spacing * count))
        
        return points
    }
}
