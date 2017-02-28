//
//  YahooFinanceViewController.swift
//  YahooFinance
//
//  Created by yangjehpark on 2017. 1. 18..
//  Copyright © 2017년 yangjehpark. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class YahooFinanceViewController: UIViewController {
    
    let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
    var loadingView: UIView?
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initLoadingView()
    }
        
    func initLoadingView() {
        let activityIndicatorView = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.whiteLarge)
        activityIndicatorView.startAnimating()
        activityIndicatorView.center = CGPoint(x: UIScreen.main.bounds.width/2, y: UIScreen.main.bounds.height/2)
        
        self.loadingView = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
        self.loadingView!.backgroundColor = UIColor.gray
        self.loadingView!.alpha = 0.5
        self.loadingView!.addSubview(activityIndicatorView)
        self.loadingView!.isUserInteractionEnabled = false
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
    
    func showPopup(title: String, message: String, completionHandler: @escaping (_ complete: Bool) -> Void) {
        
        Popup.handlerAlert(title: title, message: message, viewController: self) { (complete) in
            completionHandler(true)
        }        
    }
}
