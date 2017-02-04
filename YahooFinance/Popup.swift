//
//  BasicPopup.swift
//  SyrupStyle
//
//  Created by yangjehpark on 2015. 7. 1..
//  Copyright (c) 2015년 skplanet. All rights reserved.
//

import UIKit

class Popup {
    
    class func simpleAlert(title: String, message: String, viewController: UIViewController) {
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        let cancel = UIAlertAction(title: "확인", style: UIAlertActionStyle.cancel) { (alertAction:UIAlertAction) -> Void in
            alertController.dismiss(animated: true, completion: nil)
        }
        alertController.addAction(cancel)
        viewController.present(alertController, animated: true, completion: nil)
    }
    
    class func handlerAlert(title: String, message: String, viewController: UIViewController, completionHandler: @escaping (_ isDone: Bool) -> Void) {
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        let cancel = UIAlertAction(title: "확인", style: UIAlertActionStyle.cancel) { (alertAction:UIAlertAction) -> Void in
            alertController.dismiss(animated: true, completion: nil)
            completionHandler(true)
        }
        alertController.addAction(cancel)
        viewController.present(alertController, animated: true, completion: nil)
    }
}
