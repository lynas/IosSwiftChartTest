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
    @IBOutlet weak var profileLeft: NSLayoutConstraint!
    @IBOutlet weak var syncTrail: NSLayoutConstraint!
    @IBOutlet weak var barChartHeight: NSLayoutConstraint!
    @IBOutlet weak var titleBarHeight: NSLayoutConstraint!
    @IBOutlet weak var menuImgHeight: NSLayoutConstraint!
    @IBOutlet weak var menuImgWidth: NSLayoutConstraint!
    @IBOutlet weak var searchBGHeight: NSLayoutConstraint!
    @IBOutlet weak var searchHostHeight: NSLayoutConstraint!
    @IBOutlet weak var searchHostTop: NSLayoutConstraint!
    @IBOutlet weak var overallStatHeight: NSLayoutConstraint!
    @IBOutlet weak var statHeight: NSLayoutConstraint!
    @IBOutlet weak var statDetailView: UIScrollView!
    
    
    
    
    var months: [String]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pieLeftWidth.constant = self.view.frame.width / 2
        pieLeftHeight.constant = self.view.frame.width / 2
        pieRightWidth.constant = self.view.frame.width / 2
        pieRightHeight.constant = self.view.frame.width / 2
        profileLeft.constant = self.view.frame.width * 7 / 100
        syncTrail.constant = self.view.frame.width * 5 / 100
        barChartHeight.constant = self.view.frame.width * 65 / 100
        titleBarHeight.constant = self.view.frame.width * 10 / 100
        menuImgHeight.constant = self.view.frame.width * 7 / 100
        menuImgWidth.constant = self.view.frame.width * 7 / 100
        searchBGHeight.constant = self.view.frame.width * 18 / 100
        searchHostHeight.constant = self.view.frame.width * 8 / 100
        searchHostTop.constant = self.view.frame.width * 5 / 100
        overallStatHeight.constant = self.view.frame.width * 6 / 100
        statHeight.constant = self.view.frame.width * 10 / 100
        print("fs \(self.view.frame.width * 10 / 100)")
        
        let infoView1 = InfoView(frame: statDetailView.frame, circleColor: UIColor(hex: 0x005C75), name: "Speciality", count: "764")
        
        statDetailView.addSubview(infoView1)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // let unitsSold = [20.0, 4.0, 6.0, 3.0, 12.0, 16.0, 4.0, 18.0]
        // let marker : [Double] = [100, 200, 300, 400, 500, 600, 700, 800]
        
        let marker : [Double] = [10.0, 20, 30, 70, 80, 90, 100, 200, 300, 400]
        
        let unitsSoldLp = [20, 40, 10, 20, 10.0]
        let unitsSoldRp = [100.0]
        
        setBarChart(marker: marker)
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
    
    func setBarChart(marker : [Double]) {
        barChartView.noDataText = ""
        
        var dataEntries: [BarChartDataEntry] = []
        for i in 0..<marker.count {
            let dataEntry = BarChartDataEntry(x: Double(i), y: marker[i])
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
        chartData.barWidth = 0.4
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


class InfoView : UIView {
    var circleColor:UIColor!
    var name : String!
    var count : String!
    var originPoint : CGFloat = 5.0
    
    init(frame: CGRect, circleColor:UIColor, name:String, count:String) {
        super.init(frame: frame)
        self.circleColor = circleColor
        self.name = name
        self.count = count
        setLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setLayout(){
        let frameHeight = self.frame.height
        print("FF : \(self.frame.width)----\(self.frame.height)")
        let circleView : UIView = UIView(frame: CGRect(x: 5.0, y: (frameHeight * 30 / 100) , width: frameHeight / 2, height: frameHeight / 2))
        circleFilledWithOutline(circleView: circleView, fillColor: circleColor, outlineColor: circleColor)
        addSubview(circleView)
        originPoint = originPoint + (frameHeight / 2 ) + 10
        let ss : CGFloat = CGFloat(self.name.characters.count)
        let nameLabel : UILabel = UILabel(frame:
            CGRect(x: originPoint, y: (frameHeight * 30 / 100), width: (ss * 8), height: frameHeight / 2))
        //nameLabel.backgroundColor = UIColor.blue
        nameLabel.text = name
        nameLabel.textColor = UIColor.white
        addSubview(nameLabel)
        originPoint = originPoint + (ss * 8)
        let countLabel : UILabel = UILabel(frame:
            CGRect(x: originPoint, y: (frameHeight * 30 / 100), width: CGFloat(count.characters.count) * 12, height: frameHeight / 2))
        countLabel.font = UIFont(name: "Roboto-Bold", size: 14)
        countLabel.text = count
        countLabel.textColor = UIColor.white
        //countLabel.backgroundColor = UIColor.red
        addSubview(countLabel)

    }
    func circleFilledWithOutline(circleView: UIView, fillColor: UIColor, outlineColor:UIColor) {
        let circleLayer = CAShapeLayer()
        let width = Double(circleView.bounds.size.width);
        let height = Double(circleView.bounds.size.height);
        circleLayer.bounds = CGRect(x: 2.0, y: 2.0, width: width-2.0, height: height-2.0)
        circleLayer.position = CGPoint(x: width/2, y: height/2);
        let rect = CGRect(x: 2.0, y: 2.0, width: width-2.0, height: height-2.0)
        let path = UIBezierPath.init(ovalIn: rect)
        circleLayer.path = path.cgPath
        circleLayer.fillColor = fillColor.cgColor
        circleLayer.strokeColor = outlineColor.cgColor
        circleLayer.lineWidth = 2.0
        circleView.layer.addSublayer(circleLayer)
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
