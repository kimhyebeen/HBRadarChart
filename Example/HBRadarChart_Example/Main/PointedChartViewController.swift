//
//  PointedChartViewController.swift
//  HBRadarChart_Example
//
//  Created by 김혜빈 on 2021/03/30.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import UIKit

class PointedChartViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.title = "point chart"
        
        setupChart()
    }
    
    private func setupChart() {
        let chart = HBPentagonRadarChart(frame: CGRect(x: self.view.frame.midX - 110, y: self.view.frame.midY - 110, width: 220, height: 220))
        chart.graphValues = [3,4,2,0,3]
        chart.isStrokeGraph = false
        chart.circleHidden = false
        self.view.addSubview(chart)
    }

}
