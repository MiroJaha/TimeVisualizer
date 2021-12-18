//
//  ViewController.swift
//  TimeVisualizer
//
//  Created by admin on 17/12/2021.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var dataList = [Times]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let date = Date()
        let formatedDate = DateFormatter()
        formatedDate.dateStyle = .short
        
        formatedDate.timeStyle = .none
    }
    
    func fetchingData() {
        let dataResult: NSFetchRequest<Times> = Times.fetchRequest()
        do {
            dataList = try context.fetch(dataResult)
        }catch {
            print(error)
        }
    }

    func saveNewData() {
        let newData = Times(context: context)
        newData.inDay?.inWeek?.weekNumber = 1
        newData.inDay?.day = ""
        newData.inDay?.date = ""
        newData.four = ""
        newData.fourThirty = ""
        newData.five = ""
        newData.fiveThirty = ""
        newData.six = ""
        newData.sixThirty = ""
        newData.seven = ""
        newData.sevenThirty = ""
        newData.eight = ""
        newData.eightThirty = ""
        newData.nine = ""
        newData.nineThirty = ""
    }
    
    @IBAction func addButton(_ sender: UIButton) {
        let chartsViewController = ChartsViewController()
//        let chartsViewController = storyboard?.instantiateViewController(withIdentifier: "another") as! ChartsViewController
        self.present(chartsViewController, animated: true, completion: nil)
//        self.navigationController?.pushViewController(chartsViewController, animated: true)
    }
    
}

