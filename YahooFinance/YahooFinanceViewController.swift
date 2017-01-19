//
//  YahooFinanceViewController.swift
//  YahooFinance
//
//  Created by yangjehpark on 2017. 1. 18..
//  Copyright © 2017년 yangjehpark. All rights reserved.
//

import UIKit

class YahooFinanceViewController: UIViewController {
    
    let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
    var loadingView: UIView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.initLoadingView()
    }
    
    func initLoadingView() {
        let activityIndicatorView = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.WhiteLarge)
        activityIndicatorView.startAnimating()
        activityIndicatorView.center = CGPointMake(UIScreen.mainScreen().bounds.width/2, UIScreen.mainScreen().bounds.height/2)
        
        self.loadingView = UIView(frame: CGRectMake(0, 0, UIScreen.mainScreen().bounds.width, UIScreen.mainScreen().bounds.height))
        self.loadingView!.backgroundColor = UIColor.grayColor()
        self.loadingView!.alpha = 0.5
        self.loadingView!.addSubview(activityIndicatorView)
        self.loadingView!.userInteractionEnabled = false
    }
    
    func showLoadingView() {
        if (self.loadingView != nil) {
            self.view.addSubview(self.loadingView!)
        }
    }
    
    func hideLoadingView() {
        if (self.loadingView != nil) {
            self.loadingView!.removeFromSuperview()
        }
    }
    
    func showPopup(title title: String, message: String, completionHandler: (complete: Bool) -> Void) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.Alert)
        let cancel = UIAlertAction(title: "OK", style: UIAlertActionStyle.Cancel) { (alertAction:UIAlertAction) -> Void in
            completionHandler(complete: true)
        }
        alertController.addAction(cancel)
        self.presentViewController(alertController, animated: true, completion: nil)
    }
}