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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        KeywordsViewController().controllDelegate = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

extension CustomTableViewCell: ControllDelegate {
    func keywordPassing(keyword: String, backColor: UIColor) {
        taskTextfieald.text = keyword
        taskTextfieald.textColor = backColor
    }
}
