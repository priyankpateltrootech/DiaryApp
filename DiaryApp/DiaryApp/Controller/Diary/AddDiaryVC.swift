//
//  AddDiaryVC.swift
//  DiaryApp
//
//  Created by Sagar on 11/09/20.
//  Copyright © 2020 Trootech. All rights reserved.
//

import UIKit

class AddDiaryVC: BaseVC {

    //--------------------------------------------------
    // MARK:- Outlets
    //--------------------------------------------------
    
    @IBOutlet weak var txtTitle: UITextField!
    @IBOutlet weak var tvDescription: UITextView!
    @IBOutlet weak var labelPlaceholder: UILabel!
    @IBOutlet weak var btnSave: UIButton!
    
    @IBOutlet weak var const_tvDescription_height: NSLayoutConstraint!
    
    
    //--------------------------------------------------
    // MARK:- Variables
    //--------------------------------------------------
    
    var isAddDiary      = true
    var diary           : DiaryListModel?
    
    
    //--------------------------------------------------
    // MARK:- Abstract Method
    //--------------------------------------------------
    
    class func viewController() -> AddDiaryVC {
        return UIStoryboard.Diary.instantiateViewController(withIdentifier: "AddDiaryVC") as! AddDiaryVC
    }
    
    
    //--------------------------------------------------
    // MARK:- Action Methods
    //--------------------------------------------------
    
    @IBAction func btnSaveTapped(_ sender: UIButton) {
        
        let alertAction = UIAlertAction(title: "Ok", style: .default) { (_) in
            self.navigationController?.popViewController(animated: true)
        }
        
        self.showAlert(message: "API for this functioality is under development", actions: [alertAction])
    }
    
    
    //--------------------------------------------------
    // MARK:- Custom Methods
    //--------------------------------------------------
    
    func setupView() {
        
        self.title = self.diary?.title ?? "Diary Title"
        
        if !self.isAddDiary {
            self.txtTitle.text = self.diary?.title ?? ""
            self.tvDescription.text = self.diary?.content ?? ""
            self.labelPlaceholder.isHidden = (self.tvDescription.text.count > 0)
        }
    }
    
    
    //--------------------------------------------------
    // MARK:- View Life Cycle Methods
    //--------------------------------------------------
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
    }
}


//--------------------------------------------------
// MARK:- Extension: UITextFieldDelegate
//--------------------------------------------------

extension AddDiaryVC: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        self.tvDescription.becomeFirstResponder()
        return true
    }
}


//--------------------------------------------------
// MARK:- Extension: UITextViewDelegate
//--------------------------------------------------

extension AddDiaryVC: UITextViewDelegate {
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        
        // get the current text, or use an empty string if that failed
        let currentText = textView.text ?? ""
        
        // attempt to read the range they are trying to change, or exit if we can't
        guard let stringRange = Range(range, in: currentText) else { return false }
        
        // add their new text to the existing text
        let updatedText = currentText.replacingCharacters(in: stringRange, with: text)
        
        if updatedText.count == 0 {
            self.labelPlaceholder.isHidden = false
        } else {
            self.labelPlaceholder.isHidden = true
        }
        
        return true
    }
}
