//
//  DiaryListTVC.swift
//  DiaryApp
//
//  Created by Sagar on 11/09/20.
//  Copyright © 2020 Trootech. All rights reserved.
//

import UIKit

protocol DiaryListTVCDelegate: class {
    func editTapped(_ note: DiaryListModel)
    func deleteTapped(_ note: DiaryListModel)
}

class DiaryListTVC: UITableViewCell {
    
    //--------------------------------------------------
    // MARK:- Outlets
    //--------------------------------------------------
    
    @IBOutlet weak var diaryView: UIView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblDescription: UILabel!
    @IBOutlet weak var lblTime: UILabel!
    
    @IBOutlet weak var btnEdit: UIButton!
    @IBOutlet weak var btnDelete: UIButton!
    
    @IBOutlet weak var viewPinCircle: UIView!
    @IBOutlet weak var viewTopVerticalLine: UIView!
    @IBOutlet weak var viewBottomVerticalLine: UIView!
    
    
    //--------------------------------------------------
    // MARK:- Variables
    //--------------------------------------------------
    
    var note: DiaryListModel?
    
    weak var delegate: DiaryListTVCDelegate?
    
    
    //--------------------------------------------------
    // MARK:- Abstract Method
    //--------------------------------------------------
    
    class func nib() -> UINib {
        return UINib(nibName: "DiaryListTVC", bundle: nil)
    }
    
    
    //--------------------------------------------------
    // MARK:- Action Methods
    //--------------------------------------------------
    
    @IBAction func btnDeleteTapped(_ sender: UIButton) {
        
        if let selfDelegate = self.delegate, self.note != nil {
            selfDelegate.deleteTapped(self.note!)
        }
    }
    
    //--------------------------------------------------
    
    @IBAction func btnEditTapped(_ sender: UIButton) {
        
        if let selfDelegate = self.delegate, self.note != nil {
            selfDelegate.editTapped(self.note!)
        }
    }
    
    
    //--------------------------------------------------
    // MARK:- Custom Methods
    //--------------------------------------------------
    
    func configure(diary: DiaryListModel?) {
        
        self.note = diary
        
        // Set border to pin view
        self.viewPinCircle.layer.borderWidth = 1
        self.viewPinCircle.layer.borderColor = UIColor.lightGray.cgColor
        self.viewBottomVerticalLine.backgroundColor = .lightGray
        self.viewTopVerticalLine.backgroundColor = .lightGray
        
        // Set title
        self.lblTitle.text = diary?.title ?? ""
        self.lblDescription.text = diary?.content ?? ""
        
        if let strDate = diary?.date, let strNewDate = Date.stringDate(strDate, currentFormat: "yyyy-MM-dd'T'HH:mm:ss.SSSZ", needFormat: "dd/MM/yyyy HH:mm:ss") {
            
            let dateFromatter = DateFormatter()
            dateFromatter.dateFormat = "dd/MM/yyyy HH:mm:ss"
            
            if let date = dateFromatter.date(from: strNewDate) {
                
                if let duration = Date().offset(from: date) {
                    
                    if duration.1 == .years {
                        self.lblTime.text = "\(duration.0) years ago"
                    }
                    else if duration.1 == .month {
                        self.lblTime.text = "\(duration.0) months ago"
                    }
                    else if duration.1 == .weeks {
                        self.lblTime.text = "\(duration.0) weeks ago"
                    }
                    else if duration.1 == .days {
                        self.lblTime.text = "\(duration.0) days ago"
                    }
                    else if duration.1 == .hours {
                        self.lblTime.text = "\(duration.0) hours ago"
                    }
                    else if duration.1 == .minutes {
                        self.lblTime.text = "\(duration.0) minutes ago"
                    }
                    else if duration.1 == .seconds {
                        self.lblTime.text = "\(duration.0) seconds ago"
                    }
                }
            }
        }
    }
    
    
    //--------------------------------------------------
    // MARK:- View Life Cycle Methods
    //--------------------------------------------------
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
