//
//  ViewController.swift
//  iOSCharts
//
//  Created by Student on 2/28/20.
//  Copyright © 2020 student. All rights reserved.
//

import UIKit

import Charts
import TinyConstraints

/// View Controller class for graph
class ViewController: UIViewController {
    
    
    /// static data as of now to display graph, y values as reaction time in seconds, x axis as number of reactions.
    let graphValues:[ChartDataEntry] = [
        ChartDataEntry(x:0.0, y: 10.0),
        ChartDataEntry(x:1.0, y: 4.0),
        ChartDataEntry(x:2.0, y: 6.0),
        ChartDataEntry(x:3.0, y: 11.0),
        ChartDataEntry(x:4.0, y: 15.7),
        ChartDataEntry(x:5.0, y: 11.2),
        ChartDataEntry(x:6.0, y : 1.9),
        ChartDataEntry(x:7.0, y: 4.7),
        ChartDataEntry(x:8.0, y: 2.2),
        ChartDataEntry(x:9.0, y: 9.0),
        ChartDataEntry(x:10.0, y: 11.65),
        ChartDataEntry(x:11.0, y: 6.8),]
    
    
    /// lineChartView for displaying the chart
    lazy var lineChartView: LineChartView = {
        let lineChartView = LineChartView()
        lineChartView.backgroundColor = .systemGray
        lineChartView.rightAxis.enabled = false
        
        /// yAxis constraints
        let yAxis = lineChartView.leftAxis
        yAxis.labelFont = .boldSystemFont(ofSize: 15)
        yAxis.axisLineWidth = 2
        yAxis.axisLineColor = .black
        
        
        /// xAxis constraints
        let xAxis = lineChartView.xAxis
        xAxis.labelPosition = .bottom
        xAxis.axisLineWidth = 2
        xAxis.labelFont = .boldSystemFont(ofSize: 15)
        xAxis.axisLineColor = .black
        xAxis.labelHeight = 20
        
        
        lineChartView.animate(xAxisDuration: 2)
        return lineChartView
    }()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.addSubview(lineChartView)
        lineChartView.centerInSuperview()
        lineChartView.width(to: view)
        lineChartView.heightToWidth(of: view)
        setData()
        
        navigationItem.title = "Reaction Times Graph"
    }
    
    
    /// setData funcion to set data on graph
    func setData(){
        let dataSet = LineChartDataSet(entries: graphValues, label: "Reaction Time in seconds")
        dataSet.lineWidth = 2
        let data = LineChartData(dataSet: dataSet)
        lineChartView.data = data
    }


}

