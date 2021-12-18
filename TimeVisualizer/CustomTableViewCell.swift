//
//  CustomTableViewCell.swift
//  TimeVisualizer
//
//  Created by admin on 18/12/2021.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var taskTextfieald: UITextField!
    
//    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
//        super.init(style: style, reuseIdentifier: reuseIdentifier)
//        KeywordsViewController().controllDelegate = self
//    }
//    
//    required init?(coder: NSCoder) {
//        super.init(coder: coder)
//    }
    
}

//extension CustomTableViewCell: ControllDelegate {
//    func keywordPassing(keyword: String, backColor: UIColor) {
//        taskTextfieald.text = keyword
//        taskTextfieald.textColor = backColor
//    }
//}
