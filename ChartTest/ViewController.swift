//
//  ViewController.swift
//  ChartTest
//
//  Created by Md Sazzad Islam on 6/16/17.
//  Copyright © 2017 Dynamic Solution Innovators. All rights reserved.
//

import UIKit
import Charts

class ViewController: UIViewController {
    
    @IBOutlet weak var barChartView: BarChartView!
    @IBOutlet weak var pieChartLeft: PieChartView!
    @IBOutlet weak var pieChartRight: PieChartView!
    @IBOutlet weak var pieContainer: UIView!
    @IBOutlet weak var leftPieContainer: UIView!
    @IBOutlet weak var rightPieContainer: UIView!
    @IBOutlet weak var pieChartLeftContainerWidth: NSLayoutConstraint!
    @IBOutlet weak var pieChartLeftContainerHeight: NSLayoutConstraint!
    @IBOutlet weak var pieChartRightContainerWidth: NSLayoutConstraint!
    @IBOutlet weak var pieChartRightContainerHeight: NSLayoutConstraint!
    
    
    
    var months: [String]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pieChartLeftContainerWidth.constant = pieContainer.frame.width / 2
        pieChartLeftContainerHeight.constant = pieContainer.frame.height - 20
        pieChartRightContainerWidth.constant = pieContainer.frame.width / 2
        pieChartRightContainerHeight.constant = pieContainer.frame.height - 20
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        months = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug"]
        let unitsSold = [20.0, 4.0, 6.0, 3.0, 12.0, 16.0, 4.0, 18.0]
        
        setBarChart(dataPoints: months, values: unitsSold)
        setPieChartLeft(dataPoints: months, values: unitsSold)
        let unitsSoldRp = [100.0]
        setPieChartRight(values: unitsSoldRp)
        
    }
    
    func setPieChartRight(values: [Double]) {
        pieChartRight.noDataText = "You need to provide data for the chart."
        var dataEntries: [PieChartDataEntry] = []
        for i in 0..<1 {
            let dataEntry = PieChartDataEntry(value: values[i])
            dataEntries.append(dataEntry)
        }
        let c1 = UIColor(hex: 0x3EC1C1)
        let chartDataSet = PieChartDataSet(values: dataEntries, label: nil)
        chartDataSet.form = .empty
        chartDataSet.colors = [c1]
        let chartData = PieChartData(dataSet: chartDataSet)
        pieChartRight.data = chartData
        
        
        
        pieChartRight.transparentCircleColor = nil
        pieChartRight.holeColor = nil
        pieChartRight.holeRadiusPercent = 0.7
        pieChartLeft.transparentCircleRadiusPercent = -10
        pieChartRight.animate(xAxisDuration: 2.0, yAxisDuration: 2.0)
        pieChartRight.chartDescription = nil
        setRightPieChartCenterText()
    }
    
    private func setRightPieChartCenterText(){
        pieChartRight.setExtraOffsets(left: 1.0, top: 1.0, right: -30.0, bottom: -1000.0)
        let normalStyle = "#normal{color: #ffffff; font-size: 16; text-align: center;}"
        let firstLineStyle = "#blue{color: #ffffff; font-weight: Bold; font-size: 14; text-align: center;}"
        let percentStyle = "#percent{color: #ffffff;font-size: 20; text-align: center;}"
        let style = "<style type=\"text/css\">\(normalStyle)\(firstLineStyle)\(percentStyle)</style>"
        let firstLine = "<div id=\"normal\">Your offline data</div>"
        let secondLine = "<div id=\"normal\">is <span id=\"percent\">100%</span> Synced</div>"
        let str = "\(style)\(firstLine)\(secondLine)".html2AttStr!
        pieChartRight.centerAttributedText = str
    }
    
    
    func setPieChartLeft(dataPoints: [String], values: [Double]) {
        pieChartLeft.noDataText = ""
        var dataEntries: [PieChartDataEntry] = []
        for i in 0..<dataPoints.count {
            let dataEntry = PieChartDataEntry(value: values[i])
            dataEntries.append(dataEntry)
        }
        let c1 = UIColor(hex: 0x3EC1C1)
        let c2 = UIColor(hex: 0x209999)
        let c3 = UIColor(hex: 0x093B64)
        let c4 = UIColor(hex: 0x005C75)
        
        let chartDataSet = PieChartDataSet(values: dataEntries, label: nil)
        chartDataSet.form = .empty
        chartDataSet.colors = [c1, c2, c3, c4]
        let chartData = PieChartData(dataSet: chartDataSet)
        pieChartLeft.data = chartData
        pieChartLeft.transparentCircleColor = nil
        pieChartLeft.holeColor = nil
        pieChartLeft.holeRadiusPercent = 0.7
        
        
        pieChartLeft.animate(xAxisDuration: 2.0, yAxisDuration: 2.0)
        pieChartLeft.chartDescription = nil
        
        
        leftPieChartCenterTextDesign()
    }
    
    private func leftPieChartCenterTextDesign(){
        let styleNormal = "#normal{color: #ffffff; font-size: 16; text-align: center;}"
        let styleBlue = "#blue{color: #ffffff; font-weight: Bold; font-size: 18; text-align: center;}"
        let stylePercent = "#percent{color: #ffffff;font-size: 20; text-align: center;}"
        let style = "<style type=\"text/css\">\(styleNormal)\(styleBlue)\(stylePercent)</style>"
        let firstLine = "<div id=\"blue\">Professional</div>"
        let secondLine = "<div id=\"normal\">info <span id=\"percent\">70%</span></div>"
        let str = "\(style)\(firstLine)\(secondLine)".html2AttStr!
        pieChartLeft.centerAttributedText = str
    }
    
    
    
    
    func setBarChart(dataPoints: [String], values: [Double]) {
        barChartView.noDataText = ""
        var dataEntries: [BarChartDataEntry] = []
        let marker : [Double] = [100, 200, 300, 400, 500, 600, 700, 800]
        for i in 0..<dataPoints.count {
            let dataEntry = BarChartDataEntry(x: values[i], y: marker[i])
            dataEntries.append(dataEntry)
        }
        let c1 = UIColor(hex: 0x3EC1C1)
        let c2 = UIColor(hex: 0x209999)
        let c3 = UIColor(hex: 0x093B64)
        let c4 = UIColor(hex: 0x005C75)
        
        let chartDataSet = BarChartDataSet(values: dataEntries, label: nil)
        chartDataSet.form = .empty
        
        chartDataSet.colors = [c1, c2, c3, c4]
        let chartData = BarChartData(dataSet: chartDataSet)
        //barChartView.xAxis.labelPosition = .bottom
        barChartView.scaleXEnabled = false
        barChartView.scaleYEnabled = false
        barChartView.highlighter = nil
        barChartView.rightAxis.enabled = false
        //barChartView.xAxis.drawGridLinesEnabled = false
        barChartView.xAxis.enabled = false
        barChartView.animate(xAxisDuration: 2.0, yAxisDuration: 2.0)
        barChartView.data = chartData
        barChartView.chartDescription = nil
        barChartView.rightYAxisRenderer = YAxisRenderer(viewPortHandler: nil, yAxis: nil, transformer: nil)
        //barChartView.xAxisRenderer = XAxisRenderer(viewPortHandler: nil, xAxis: nil, transformer: nil)
        
    }
    
    
}

extension String {
    var html2AttStr: NSAttributedString? {
        return try? NSAttributedString(data: Data(utf8), options: [NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType, NSCharacterEncodingDocumentAttribute: String.Encoding.utf8.rawValue], documentAttributes: nil)
    }
}

extension UIColor {
    
    convenience init(hex: Int) {
        let components = (
            R: CGFloat((hex >> 16) & 0xff) / 255,
            G: CGFloat((hex >> 08) & 0xff) / 255,
            B: CGFloat((hex >> 00) & 0xff) / 255
        )
        self.init(red: components.R, green: components.G, blue: components.B, alpha: 1)
    }
    
}
