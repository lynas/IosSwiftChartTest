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
    
    var months: [String]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        months = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug"]
        let unitsSold = [20.0, 4.0, 6.0, 3.0, 12.0, 16.0, 4.0, 18.0]
        
        setChart(dataPoints: months, values: unitsSold)
        setPieChartLeft(dataPoints: months, values: unitsSold)
        
    }
    
    
    func setPieChartLeft(dataPoints: [String], values: [Double]) {
        pieChartLeft.noDataText = "You need to provide data for the chart."
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
        pieChartLeft.frame = CGRect(x: 0, y: 0, width: 500, height: 500)
        pieChartLeft.transparentCircleColor = nil
        pieChartLeft.holeColor = nil
        //pieChartLeft.sizeToFit()
        pieChartLeft.holeRadiusPercent = 0.7
        //pieChartLeft.transparentCircleRadiusPercent = -10
        
        pieChartLeft.animate(xAxisDuration: 2.0, yAxisDuration: 2.0)
        pieChartLeft.data = chartData
        pieChartLeft.chartDescription = nil
        
        
        /*let myString = "Professional "
        let myAttribute = [ NSForegroundColorAttributeName: UIColor.white ]
        let myAttrString = NSMutableAttributedString(string: myString, attributes: myAttribute)
        
        let myStringB = "info 70%"
        //let myAttributeB = [ NSForegroundColorAttributeName: UIColor.blue , NSTextEffectAttributeName : .white ]
        let myAttributeB = [ NSForegroundColorAttributeName: UIColor.white, NSFontAttributeName: UIFont(name: "AvenirNext-Medium", size: 22)!]
        let myAttrStringB = NSAttributedString(string: myStringB, attributes: myAttributeB)*/
        
        let str = "<style type=\"text/css\">#blue{color: #ffffff; font-weight: Bold; font-size: 12; text-align: center;} #percent{color: #ffffff;font-size: 15; text-align: center;}</style><div id=\"blue\">Professional</div><div id=\"blue\">info <span id=\"percent\">70%</span></div>".html2AttStr!
        
        pieChartLeft.centerAttributedText = str
        
    }
    
    
    
    
    func setChart(dataPoints: [String], values: [Double]) {
        barChartView.noDataText = "You need to provide data for the chart."
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
