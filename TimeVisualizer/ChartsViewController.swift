//
//  ChartsViewController.swift
//  TimeVisualizer
//
//  Created by admin on 18/12/2021.
//

import UIKit
import Charts
import CoreData

class ChartsViewController: UIViewController {
    
    var pieChart = PieChartView()
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var dataList = [Times]()

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
        
        pieChart.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.width)
        self.view.addSubview(pieChart)
        var entries = [ChartDataEntry]()
        
        for x in 0..<9 {
            entries.append(ChartDataEntry(x: 0, y: Double(x),data: "Hello"))
        }
        entries.append(ChartDataEntry(x: 0, y: 10, data: "Bye"))
        
        let set = PieChartDataSet(entries: entries)
        set.colors = ChartColorTemplates.colorful()
        let data = PieChartData(dataSet: set)
        pieChart.data = data
        
        
    }
}

extension ChartsViewController: ChartViewDelegate {
    
}
