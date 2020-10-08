//
//  MainViewController.swift
//  KeyboardController
//
//  Created by Igor Kulik on 08.10.2020.
//

import Foundation
import UIKit

final class MainViewController: UITableViewController {

    // MARK: - UIViewController

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.tableFooterView = UIView(frame: .zero)
        if #available(iOS 11.0, *) {
            navigationController?.navigationBar.prefersLargeTitles = true
        }
    }
}
