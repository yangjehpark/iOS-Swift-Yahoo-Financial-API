//
//  BasicPopup.swift
//  SyrupStyle
//
//  Created by yangjehpark on 2015. 7. 1..
//  Copyright (c) 2015년 skplanet. All rights reserved.
//

import UIKit

class Popup {
    
    class func simpleAlert(title title: String, message: String, viewController: UIViewController) {
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.Alert)
        let cancel = UIAlertAction(title: "확인", style: UIAlertActionStyle.Cancel) { (alertAction:UIAlertAction) -> Void in
            alertController.dismissViewControllerAnimated(true, completion: nil)
        }
        alertController.addAction(cancel)
        viewController.presentViewController(alertController, animated: true, completion: nil)
    }
    
    class func handlerAlert(title title: String, message: String, viewController: UIViewController, completionHandler: (isDone: Bool) -> Void) {
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.Alert)
        let cancel = UIAlertAction(title: "확인", style: UIAlertActionStyle.Cancel) { (alertAction:UIAlertAction) -> Void in
            alertController.dismissViewControllerAnimated(true, completion: nil)
            completionHandler(isDone: true)
        }
        alertController.addAction(cancel)
        viewController.presentViewController(alertController, animated: true, completion: nil)
    }
    
    class func textFieldAlert(title title:String?, message:String, textField1Text:String, textField1Placehold:String, textField2Text:String, textField2Placehold:String, viewController:UIViewController, completionHandler: (complete: Bool, textField1Text:String?, textField2Text:String?) -> Void) {
        
        let alertController = UIAlertController(title: title, message: "\n\n\n\n\n\n\n\n", preferredStyle: UIAlertControllerStyle.Alert)
        
        let customViewRect = CGRectMake(0, 60, 270, 120)
        let customView = UIView(frame: customViewRect)
        customView.backgroundColor = UIColor.clearColor()
        
        let label1 = UILabel(frame: CGRectMake(15, 0, 240, 20))
        label1.font = UIFont.systemFontOfSize(13)
        label1.text = textField1Placehold
        customView.addSubview(label1)
        
        let textField1 = UITextField(frame: CGRectMake(15, 25, 240, 30))
        textField1.text = textField1Text
        textField1.font = UIFont.systemFontOfSize(16)
        textField1.keyboardType = UIKeyboardType.NumberPad
        textField1.borderStyle = UITextBorderStyle.RoundedRect
        customView.addSubview(textField1)

        let label2 = UILabel(frame: CGRectMake(15, 70, 240, 20))
        label2.font = UIFont.systemFontOfSize(13)
        label2.text = textField2Placehold
        customView.addSubview(label2)
        
        let textField2 = UITextField(frame: CGRectMake(15, 95, 240, 30))
        textField2.text = textField2Text
        textField2.font = UIFont.systemFontOfSize(15)
        textField2.borderStyle = UITextBorderStyle.RoundedRect
        textField2.keyboardType = UIKeyboardType.DecimalPad
        customView.addSubview(textField2)
        
        alertController.view.addSubview(customView)
        
        let cancel = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel) {
            (alertAction:UIAlertAction) -> Void in
            
            alertController.dismissViewControllerAnimated(true, completion: nil)
            completionHandler(complete: false, textField1Text: nil, textField2Text: nil)
        }
        let ok = UIAlertAction(title: "Confirm", style: UIAlertActionStyle.Default) {
            (alertAction:UIAlertAction) -> Void in
            
            alertController.dismissViewControllerAnimated(true, completion: nil)
            completionHandler(complete: true, textField1Text: textField1.text, textField2Text: textField2.text)
        }
        
        alertController.addAction(cancel)
        alertController.addAction(ok)
        
        textField1.becomeFirstResponder()
        viewController.presentViewController(alertController, animated: true, completion: nil)
    }
}