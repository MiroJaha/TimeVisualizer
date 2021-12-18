//
//  ViewController.swift
//  TimeVisualizer
//
//  Created by admin on 17/12/2021.
//

import UIKit
import CoreData

class MainViewController: UIViewController {
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    let save = (UIApplication.shared.delegate as! AppDelegate).saveContext
    var dataList = [Times]()
    @IBOutlet weak var mainTableView: UITableView!
    
    let days = ["Saterday","Sunday","Monday","Tuseday","Wednisday","Thursday","Friday"]
    let times = ["4:00","4:30","5:00","5:30","6:00","6:30","7:00","7:30","8:00","8:30","9:00","9:30"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       // saveNewData()
        fetchingData()
        
        mainTableView.dataSource = self
        mainTableView.delegate = self
        
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
        let date = Date()
        let formatedDate = DateFormatter()
        formatedDate.dateStyle = .short
        formatedDate.timeStyle = .none
        var setDate = formatedDate.string(from: date)
        setDate.removeLast(6)
        for time in times{
            let newData = Times(context: context)
            newData.inDay?.inWeek?.weekNumber = 1
            newData.inDay?.day = "SaterDay"
            newData.inDay?.date = setDate
        
            newData.time = time
            save()
        }
        
        mainTableView.reloadData()
    }
    
    @IBAction func addButton(_ sender: UIButton) {
        let chartsViewController = ChartsViewController()
//        let chartsViewController = storyboard?.instantiateViewController(withIdentifier: "another") as! ChartsViewController
        self.present(chartsViewController, animated: true, completion: nil)
//        self.navigationController?.pushViewController(chartsViewController, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let indexPath = sender as? NSIndexPath else { return }
        let destination = segue.destination as! KeywordsViewController
        destination.controllDelegate = self
        destination.indexPath = indexPath
    }
    
}

extension MainViewController: UITableViewDataSource, UITableViewDelegate {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomTableViewCell
        cell.timeLabel.text = dataList[indexPath.row].time
        cell.taskTextfieald.text = dataList[indexPath.row].note
        print(dataList[indexPath.row].inDay?.inWeek?.weekNumber)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "addKeyword", sender: indexPath)
    }
    
    func tableView(_ tableView: UITableView, didHighlightRowAt indexPath: IndexPath) {
        
    }
}

extension MainViewController: ControllDelegate {
    func keywordPassing(keyword: String, backColor: UIColor, indexPath: NSIndexPath) {
        
        dataList[indexPath.row].note = keyword
        save()
        mainTableView.reloadData()
    }
    
    
}
