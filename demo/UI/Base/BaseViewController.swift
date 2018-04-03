//
//  BaseViewController.swift
//  demo
//
//  Created by Bassem Qoulta on 4/2/18.
//  Copyright © 2018 Bassem Qoulta. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    
    fileprivate lazy var activityIndicatorView: UIActivityIndicatorView = {
        let activityIndicatorView = UIActivityIndicatorView()
        activityIndicatorView.color = UIColor.gray
        activityIndicatorView.sizeToFit()
        return activityIndicatorView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func showErrorMessage(_ message: String) {
        let alertViewController = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        alertViewController.addAction(UIAlertAction.init(title: "OK", style: UIAlertActionStyle.default, handler: nil))
        self.present(alertViewController, animated: true, completion: nil)
    }
    
    func showLoadingView(_ tableView: UITableView){
        tableView.sectionFooterHeight = 60
        tableView.tableFooterView = activityIndicatorView
        activityIndicatorView.startAnimating()
    }
    
    func hideLoadingView(_ tableView: UITableView){
        if activityIndicatorView.isDescendant(of: tableView) {
            activityIndicatorView.stopAnimating()
            activityIndicatorView.removeFromSuperview()
            tableView.tableFooterView = nil
        }
    }
}
