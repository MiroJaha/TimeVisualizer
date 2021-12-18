//
//  ChartsViewController.swift
//  TimeVisualizer
//
//  Created by admin on 18/12/2021.
//

import UIKit
import Charts
import CoreData

class ChartsViewController: UIViewController, ChartViewDelegate {
    
    var pieChart = PieChartView()
    var lineChart = LineChartView()
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var dataList = [Times]()
    var switchButton: UIButton = {
        let button = UIButton(frame: .zero)
        button.automaticallyUpdatesConfiguration = false
        button.setTitle("SWITCH", for: .normal)
        button.layer.backgroundColor = UIColor.red.cgColor
        button.titleLabel?.adjustsFontSizeToFitWidth = true
        button.titleLabel?.font = .systemFont(ofSize: 18, weight: .bold)
        return button
    }()
    var chartView = UIView()
    var chartValues = [(String, Int)]()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .green

        pieChart.delegate = self
        
    }
    
    func fetchingData() {
        let dataResult: NSFetchRequest<Times> = Times.fetchRequest()
        do {
            dataList = try context.fetch(dataResult)
        }catch {
            print(error)
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        chartView.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.width)
        view.addSubview(chartView)
        
        setUpPieChart()
        chartView.addSubview(pieChart)
        pieChart.isHidden = true

        setUpLineChart()
        chartView.addSubview(lineChart)
        lineChart.isHidden = false
    }
    
    func setUpPieChart() {
        pieChart.frame = CGRect(x: 0, y: 0, width: self.chartView.frame.width, height: self.chartView.frame.width)
        var entries = [PieChartDataEntry]()
        entries.append(PieChartDataEntry(value: Double(10),label: "IOS"))
        entries.append(PieChartDataEntry(value: Double(10),label: "algoriths"))
        entries.append(PieChartDataEntry(value: Double(10),label: "uikit"))
        entries.append(PieChartDataEntry(value: Double(10),label: "swiftt"))
        entries.append(PieChartDataEntry(value: Double(10),label: "data structures"))
        entries.append(PieChartDataEntry(value: Double(10),label: "swift ui"))
        let dataSet = PieChartDataSet(entries: entries, label: "")
        dataSet.colors = [.systemCyan, .blue, .purple, .systemCyan, .blue, .purple]
        let data = PieChartData(dataSet: dataSet)
        pieChart.data = data
        //pieChart.chartDescription?.enabled = false
        //pieChart.drawHoleEnabled = false //To Add Hole in the Middle
        pieChart.rotationAngle = 0
        pieChart.rotationEnabled = false //For Rotating The Chart
        //pieChart.isUserInteractionEnabled = false //Used For Clicking on the chart
        //pieChart.legend.enabled = false //Used To Display Uder Data
        pieChart.drawSlicesUnderHoleEnabled = false
        //pieChart.drawEntryLabelsEnabled = false //Rwiting Entry Label in slices
        pieChart.usePercentValuesEnabled = true
    }
    
    func setUpLineChart() {
        lineChart.frame = CGRect(x: 0, y: 0, width: self.chartView.frame.width, height: self.chartView.frame.width)
        var entries = [ChartDataEntry]()
        entries.append(ChartDataEntry(x: 10, y: 10))
        entries.append(ChartDataEntry(x: 20, y: 20))
        let dataSet = LineChartDataSet(entries: entries, label: "")
        dataSet.colors = [.systemCyan, .blue, .purple, .systemCyan, .blue, .purple]
        let data = LineChartData(dataSet: dataSet)
        lineChart.data = data
    }
    
    func calculatingTotal() {
        
    }
    
}

