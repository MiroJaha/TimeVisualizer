//
//  ViewController.swift
//  TimeVisualizer
//
//  Created by admin on 17/12/2021.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func addButton(_ sender: UIButton) {
        let chartsViewController = ChartsViewController()
//        let chartsViewController = storyboard?.instantiateViewController(withIdentifier: "another") as! ChartsViewController
        self.present(chartsViewController, animated: true, completion: nil)
//        self.navigationController?.pushViewController(chartsViewController, animated: true)
    }
    
}

