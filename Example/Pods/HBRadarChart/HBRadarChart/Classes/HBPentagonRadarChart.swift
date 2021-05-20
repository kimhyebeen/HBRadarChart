//
//  HBPentagonRadarChart.swift
//  HBRadarChart
//
//  Created by 김혜빈 on 2021/03/26.
//

import UIKit

open class HBPentagonRadarChart: UIView {

    open var pentagonColor: UIColor = UIColor.systemGray.withAlphaComponent(0.05)
    open var pentagonMaxSize: CGFloat = 220
    open var pentagonSpacing: CGFloat = 20
    
    open var graphStrokeColor: UIColor = UIColor.systemGray.withAlphaComponent(0.8)
    open var graphFillColor: UIColor = UIColor.systemYellow.withAlphaComponent(0.4)
    open var graphValues: [Int] = [4,4,4,4,4]
    open var graphLineWidth: CGFloat = 1
    open var isDottedLine: Bool = true
    open var isStrokeGraph: Bool = true
    open var isFillGraph: Bool = false
    
    open var contentsColors: [UIColor] = [.systemPurple, .systemBlue, .systemPink, .systemGreen, .systemYellow]
    open var circleSize: CGFloat = 4
    open var circleHidden: Bool = false
    
    private var chartSpacingFromView: CGFloat = 12
    private var pointList: [[CGPoint]] = Array(repeating: Array(repeating: CGPoint(x: 0, y: 0), count: 6), count: 5)
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
    }
    
    required public init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setupView()
    }
    
    private func setupView() {
        self.backgroundColor = .clear
        pentagonMaxSize = self.frame.width - chartSpacingFromView * 2
    }
    
    open override func draw(_ rect: CGRect) {
        if pentagonMaxSize - pentagonSpacing*8 <= 10 { return }
        
        for i in 0..<5 { drawPentagon(rect, i) }
        makeGraph()
        if !circleHidden { drawCircle() }
    }
    
    private func drawPentagon(_ rect: CGRect,_ index: Int) {
        let radius = (pentagonMaxSize - pentagonSpacing * 2 * CGFloat(index))
        let pp = HBPentagonPoint(midX: pentagonMaxSize/2 + chartSpacingFromView, midY: pentagonMaxSize/2 + chartSpacingFromView, width: radius, count: (pentagonMaxSize - radius) / (pentagonSpacing * 2), spacing: pentagonSpacing)
        pointList[index] = pp.getPoints()
        
        drawPentagonPath(rect, index)
    }
    
    private func drawPentagonPath(_ rect: CGRect,_ index: Int) {
        let center = CGPoint(x: rect.midX, y: rect.midY)
        let path = UIBezierPath()
        path.move(to: center)
        
        for i in 0..<6 { path.addLine(to: pointList[index][i]) }
        
        pentagonColor.setFill()
        path.close()
        path.fill()
    }
    
    private func makeGraph() {
        if graphValues.count != 5 { return }
        
        let graphPath = UIBezierPath()
        graphPath.move(to: graphValues[0] < 0 || graphValues[0] >= 5 ? pointList[4][0] : pointList[graphValues[0]][0])
        
        for i in 1..<5 {
            graphPath.addLine(to: graphValues[i] < 0 || graphValues[i] >= 5 ? pointList[4][i] : pointList[graphValues[i]][i])
        }
        graphPath.addLine(to: pointList[graphValues[0]][0])

        graphPath.lineWidth = graphLineWidth
        graphPath.close()
        
        if isDottedLine {
            let pattern: [CGFloat] = [5,4]
            graphPath.setLineDash(pattern, count: pattern.count, phase: 0)
        }
        if isStrokeGraph {
            graphStrokeColor.set()
            graphPath.stroke()
        }
        if isFillGraph {
            graphFillColor.setFill()
            graphPath.fill()
        }
    }
    
    private func drawCircle() {
        if graphValues.count != 5 { return }
        
        for i in 0..<5 {
            let circlePath = UIBezierPath()
            circlePath.move(to: graphValues[i] < 0 || graphValues[i] >= 5 ? pointList[4][i] : pointList[graphValues[i]][i])
            circlePath.addArc(withCenter: graphValues[i] < 0 || graphValues[i] >= 5 ? pointList[4][i] : pointList[graphValues[i]][i], radius: circleSize, startAngle: 0, endAngle: 2 * .pi, clockwise: true)
            contentsColors[i].set()
            circlePath.fill()
        }
    }

}
