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
    
    @IBOutlet weak var pieLeftHeight: NSLayoutConstraint!
    @IBOutlet weak var pieLeftWidth: NSLayoutConstraint!
    
    @IBOutlet weak var pieRightWidth: NSLayoutConstraint!
    @IBOutlet weak var pieRightHeight: NSLayoutConstraint!
    
    
    
    var months: [String]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pieLeftWidth.constant = self.view.frame.width / 2
        pieLeftHeight.constant = self.view.frame.width / 2
        pieRightWidth.constant = self.view.frame.width / 2
        pieRightHeight.constant = self.view.frame.width / 2
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let unitsSold = [20.0, 4.0, 6.0, 3.0, 12.0, 16.0, 4.0, 18.0]
        let unitsSoldLp = [20, 40, 10, 20, 10.0]
        let unitsSoldRp = [100.0]
        
        setBarChart(values: unitsSold)
        setPieChartLeft(values: unitsSoldLp)
        setPieChartRight(values: unitsSoldRp)
        
    }
    
    private func setPieChartRight(values: [Double]) {
        pieChartRight.setExtraOffsets(left: 0.0, top: 0.0, right: -30.0, bottom: -30.0)
        pieChartRight.noDataText = ""
        var dataEntries: [PieChartDataEntry] = []
        for i in 0..<1 {
            let dataEntry = PieChartDataEntry(value: values[i])
            dataEntries.append(dataEntry)
        }
        let c1 = UIColor(hex: 0x3EC1C1)
        let chartDataSet = PieChartDataSet(values: dataEntries, label: nil)
        chartDataSet.form = .empty
        chartDataSet.drawValuesEnabled = false
        chartDataSet.colors = [c1]
        let chartData = PieChartData(dataSet: chartDataSet)
        pieChartRight.data = chartData
        
        
        
        pieChartRight.transparentCircleColor = nil
        pieChartRight.holeColor = nil
        pieChartRight.holeRadiusPercent = 0.7
        pieChartRight.animate(xAxisDuration: 2.0, yAxisDuration: 2.0)
        pieChartRight.chartDescription = nil
        setRightPieChartCenterText()
    }
    
    private func setPieChartLeft(values: [Double]) {
        pieChartLeft.setExtraOffsets(left: -30.0, top: 0.0, right: 0.0, bottom: -30.0)
        pieChartLeft.noDataText = ""
        var dataEntries: [PieChartDataEntry] = []
        for i in 0..<4 {
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
        chartDataSet.drawValuesEnabled = false
        let chartData = PieChartData(dataSet: chartDataSet)
        pieChartLeft.data = chartData
        pieChartLeft.transparentCircleColor = nil
        pieChartLeft.holeColor = nil
        pieChartLeft.holeRadiusPercent = 0.7
        pieChartLeft.animate(xAxisDuration: 2.0, yAxisDuration: 2.0)
        pieChartLeft.chartDescription = nil
        leftPieChartCenterTextDesign()
    }
    
    private func setRightPieChartCenterText(){
        let topFontSize = self.view.frame.width * 3.8 / 100
        let percentFontSize = self.view.frame.width * 5 / 100
        let firstLineStyle = "#firstLine{color: #ffffff; font-size: \(topFontSize); font-weight: Bold; text-align: center;}"
        let secondLineStyle = "#secondLine{color: #ffffff; font-size: \(topFontSize); text-align: center;}"
        let percentStyle = "#percent{color: #ffffff;font-size: \(percentFontSize); text-align: center;}"
        let style = "<style type=\"text/css\">\(firstLineStyle)\(secondLineStyle)\(percentStyle)</style>"
        let firstLine = "<div id=\"firstLine\">Your offline data</div>"
        let secondLine = "<div id=\"secondLine\">is <span id=\"percent\">100%</span> Synced</div>"
        let str = "\(style)\(firstLine)\(secondLine)".html2AttStr!
        pieChartRight.centerAttributedText = str
        print("fs \(self.view.frame.width * 5 / 100)")
    }
    
    private func leftPieChartCenterTextDesign(){
        let topFontSize = self.view.frame.width * 5 / 100
        let bottomFontSize = self.view.frame.width * 4.74 / 100
        let percentFontSize = self.view.frame.width * 7.5 / 100
        let styleFirstLine = "#firstLine{color: #ffffff;font-weight: Bold; font-size: \(topFontSize); text-align: center;}"
        let styleSecondLine = "#secondLine{color: #ffffff; font-size: \(bottomFontSize); text-align: center;}"
        let stylePercent = "#percent{color: #ffffff;font-size: \(percentFontSize); text-align: center;}"
        let style = "<style type=\"text/css\">\(styleFirstLine)\(styleSecondLine)\(stylePercent)</style>"
        let firstLine = "<div id=\"firstLine\">Professional</div>"
        let secondLine = "<div id=\"secondLine\">info <span id=\"percent\">70%</span></div>"
        let str = "\(style)\(firstLine)\(secondLine)".html2AttStr!
        pieChartLeft.centerAttributedText = str
    }
    
    func setBarChart(values: [Double]) {
        barChartView.noDataText = ""
        var dataEntries: [BarChartDataEntry] = []
        let marker : [Double] = [100, 200, 300, 400, 500, 600, 700, 800]
        for i in 0..<7 {
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
