//
//  KeywordsViewController.swift
//  TimeVisualizer
//
//  Created by admin on 18/12/2021.
//

import UIKit

class KeywordsViewController: UIViewController {
    
    var controllDelegate: ControllDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func keywordsButton(_ sender: UIButton) {
        guard let backColor = sender.titleColor(for: .normal) else { return }
        
        switch sender.tag {
        case 1:
            controllDelegate?.keywordPassing(keyword: "ios", backColor: backColor)
        case 2:
            controllDelegate?.keywordPassing(keyword: "swift", backColor: backColor)
        case 3:
            controllDelegate?.keywordPassing(keyword: "algorithms", backColor: backColor)
        case 4:
            controllDelegate?.keywordPassing(keyword: "data structures", backColor: backColor)
        case 5:
            controllDelegate?.keywordPassing(keyword: "uikit", backColor: backColor)
        case 6:
            controllDelegate?.keywordPassing(keyword: "swift ui", backColor: backColor)
        default:
            return
        }
        dismiss(animated: true, completion: nil)
    }

}
