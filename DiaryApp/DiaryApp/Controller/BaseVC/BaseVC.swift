//
//  BaseVC.swift
//  DiaryApp
//
//  Created by Sagar on 11/09/20.
//  Copyright © 2020 Trootech. All rights reserved.
//

import UIKit

class BaseVC: UIViewController {
    
    //--------------------------------------------------
    // MARK:- Variables
    //--------------------------------------------------
    
    
    
    
    
    
    //--------------------------------------------------
    // MARK:- Action Methods
    //--------------------------------------------------
    
    
    
    
    //--------------------------------------------------
    // MARK:- Custom Methods
    //--------------------------------------------------
    
    func showAlert(title: String? = "Diary App", message: String, actions: [UIAlertAction]? = nil, style: UIAlertController.Style? = .alert) {
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: style!)
        
        if actions != nil, actions!.count > 0 {
            actions!.forEach {
                alertController.addAction($0)
            }
        } else {
            let actionOK = UIAlertAction(title: "OK", style: .default, handler: nil)
            alertController.addAction(actionOK)
        }
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    
    //--------------------------------------------------
    // MARK:- View Life Cycle Methods
    //--------------------------------------------------
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
