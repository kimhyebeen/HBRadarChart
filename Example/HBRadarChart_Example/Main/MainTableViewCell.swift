//
//  MainTableViewCell.swift
//  HBRadarChart_Example
//
//  Created by 김혜빈 on 2021/03/30.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import UIKit

class MainTableViewCell: UITableViewCell {
    static let identifier = "cell"
    let chartLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupChartLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupChartLabel() {
        chartLabel.text = "text"
        self.contentView.addSubview(chartLabel)
        
        chartLabel.translatesAutoresizingMaskIntoConstraints = false
        chartLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 8).isActive = true
        chartLabel.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -8).isActive = true
        chartLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 12).isActive = true
        chartLabel.trailingAnchor.constraint(lessThanOrEqualTo: self.contentView.trailingAnchor, constant: -12).isActive = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
