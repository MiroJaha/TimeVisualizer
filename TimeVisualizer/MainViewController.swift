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
    var weekCount = [Week]()
    var dataList = [Times]()
    var daysList = [Days]()
    @IBOutlet weak var mainTableView: UITableView!
    @IBOutlet weak var dayPickerView: UIPickerView!
    var selectedDay = 0
    
    let days = ["Saterday","Sunday","Monday","Tuseday","Wednisday","Thursday","Friday"]
    let times = ["4:00","4:30","5:00","5:30","6:00","6:30","7:00","7:30","8:00","8:30","9:00","9:30"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //startNewWeek()
        fetchingData()
        
        mainTableView.dataSource = self
        mainTableView.delegate = self
        dayPickerView.delegate = self
        dayPickerView.dataSource = self
    }
    
    func fetchingData() {
        let weekResult: NSFetchRequest<Week> = Week.fetchRequest()
        let dataResult: NSFetchRequest<Times> = Times.fetchRequest()
        let daysResult: NSFetchRequest<Days> = Days.fetchRequest()
        do {
            weekCount = try context.fetch(weekResult)
            daysList = try context.fetch(daysResult)
            dataList = try context.fetch(dataResult)
        }catch {
            print(error)
        }
        mainTableView.reloadData()
    }

    func startNewWeek() {
        let date = Date()
        let formatedDate = DateFormatter()
        formatedDate.dateStyle = .short
        formatedDate.timeStyle = .none
        var setDate = formatedDate.string(from: date)
        setDate.removeLast(6)
        var dayDate = Int(setDate)! - 1
        
        let newWeek = Week(context: context)
        newWeek.weekNumber = Int32(weekCount.count)
        save()
        
        for day in days{
            let newDay = Days(context: context)
            newDay.inWeek = newWeek
            newDay.day = day
            dayDate += 1
            newDay.date = String(dayDate)
            save()
            
            for time in times{
                let newData = Times(context: context)
                newData.inDay = newDay
                newData.inDay?.inWeek = newWeek
                newData.time = time
                newData.note = " "
                save()
            }
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
        if dataList.count > 1{
            return 7
        }else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomTableViewCell
        cell.timeLabel.text = dataList[indexPath.row].time
        cell.taskTextfieald.text = dataList[indexPath.row].note
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "addKeyword", sender: indexPath)
    }
    
    func tableView(_ tableView: UITableView, didHighlightRowAt indexPath: IndexPath) {
        
    }
}

extension MainViewController: ControllDelegate {
    func keywordPassing(keyword: String, indexPath: NSIndexPath) {
        guard let currentNote = dataList[indexPath.row].note else { return }
        dataList[indexPath.row].note = "\(currentNote) \(keyword)"
        save()
        fetchingData()
    }
}

//MARK: Picker View Codes
extension MainViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    //Number of rows in the Picker View
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    //Number of elements in the row
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return days.count
    }
    //Elements that will be displayed
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        //Styling string element before display
        let day = NSAttributedString(string: days[row], attributes: [
            NSAttributedString.Key.foregroundColor: UIColor.white,
            NSAttributedString.Key.font: UIFont(descriptor: UIFontDescriptor.preferredFontDescriptor(withTextStyle: .largeTitle), size: 28),
        ])
        return day
    }
    //Save selected timer
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedDay = row
        mainTableView.reloadData()
    }
}
