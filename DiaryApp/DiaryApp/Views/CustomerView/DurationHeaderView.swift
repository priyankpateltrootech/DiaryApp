//
//  DurationHeaderView.swift
//  DiaryApp
//
//  Created by Sagar on 11/09/20.
//  Copyright © 2020 Trootech. All rights reserved.
//

import UIKit

class DurationHeaderView: UIView {
    
    //--------------------------------------------------
    // MARK:- Outlets
    //--------------------------------------------------
    
    @IBOutlet weak var lblTitle: UILabel!
    

    //--------------------------------------------------
    // MARK:- Custom Methods
    //--------------------------------------------------
    
    class func instanceFromNib() -> DurationHeaderView {
        return UINib(nibName: "DurationHeaderView", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! DurationHeaderView
    }
}
