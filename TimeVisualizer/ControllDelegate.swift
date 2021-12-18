//
//  ControllDelegate.swift
//  TimeVisualizer
//
//  Created by admin on 18/12/2021.
//

import Foundation
import UIKit

protocol ControllDelegate: AnyObject {
    func keywordPassing(keyword: String, backColor: UIColor, indexPath: NSIndexPath)
}
