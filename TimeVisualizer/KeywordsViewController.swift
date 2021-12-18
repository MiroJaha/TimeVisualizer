//
//  KeywordsViewController.swift
//  TimeVisualizer
//
//  Created by admin on 18/12/2021.
//

import UIKit

class KeywordsViewController: UIViewController {
    
    var controllDelegate: ControllDelegate?
    var indexPath: NSIndexPath?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func keywordsButton(_ sender: UIButton) {
        guard let backColor = sender.titleColor(for: .normal) else { return }
        guard let indexPath = self.indexPath else { return }
        
        switch sender.tag {
        case 1:
            controllDelegate?.keywordPassing(keyword: "ios", backColor: backColor, indexPath: indexPath)
        case 2:
            controllDelegate?.keywordPassing(keyword: "swift", backColor: backColor, indexPath: indexPath)
        case 3:
            controllDelegate?.keywordPassing(keyword: "algorithms", backColor: backColor, indexPath: indexPath)
        case 4:
            controllDelegate?.keywordPassing(keyword: "data structures", backColor: backColor, indexPath: indexPath)
        case 5:
            controllDelegate?.keywordPassing(keyword: "uikit", backColor: backColor, indexPath: indexPath)
        case 6:
            controllDelegate?.keywordPassing(keyword: "swift ui", backColor: backColor, indexPath: indexPath)
        default:
            return
        }
        dismiss(animated: true, completion: nil)
    }

}
