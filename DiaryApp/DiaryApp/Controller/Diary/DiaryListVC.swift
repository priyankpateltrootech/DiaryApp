//
//  DiaryListVC.swift
//  DiaryApp
//
//  Created by Sagar on 11/09/20.
//  Copyright © 2020 Trootech. All rights reserved.
//

import UIKit

class DiaryListVC: BaseVC {

    //--------------------------------------------------
    // MARK:- Outlets
    //--------------------------------------------------
    
    @IBOutlet weak var tblNotes         : UITableView!
    @IBOutlet weak var lblEmptyData     : UILabel!
    
    
    //--------------------------------------------------
    // MARK:- Variables
    //--------------------------------------------------
    
    var arrDiaryList                    : [DiaryListModel]?
    var dictDiaryList                   : Dictionary<String, [DiaryListModel]>?
    
    var arrDates                        : [String]?
    
    
    //--------------------------------------------------
    // MARK:- Abstract Method
    //--------------------------------------------------
    
    class func viewController() -> DiaryListVC {
        return UIStoryboard.Diary.instantiateViewController(withIdentifier: "DiaryListVC") as! DiaryListVC
    }
    
    
    //--------------------------------------------------
    // MARK:- Web Service Call Methods
    //--------------------------------------------------
    
    func callWSToGetNotesList() {
        
        DataManager.shared.getDiaryList { (result) in
            
            switch result {
                
            case .success(let responseModel):

                self.arrDiaryList = responseModel
                self.manipualteData()
                
                break
                
            case .failure(let afError):
                self.showAlert(message: afError.localizedDescription)
            }
        }
    }
    
    
    //--------------------------------------------------
    // MARK:- Custom Methods
    //--------------------------------------------------
    
    func setupView() {
        
        // Register Cell
        self.tblNotes.register(DiaryListTVC.nib(), forCellReuseIdentifier: "DiaryListTVC")
        self.tblNotes.rowHeight = UITableView.automaticDimension
        self.tblNotes.estimatedRowHeight = UITableView.automaticDimension
    }
    
    
    //--------------------------------------------------
    
    func showTable(show: Bool) {
        self.tblNotes.isHidden = !show
        self.lblEmptyData.isHidden = show
        show ? self.tblNotes.reloadData() : print("Empty Data")
    }
    
    //--------------------------------------------------
    
    func manipualteData() {
        
        // Grouping list by date
        self.dictDiaryList = Dictionary(grouping: self.arrDiaryList!) {
            let strDate = Date.stringDate($0.date ?? "", currentFormat: "yyyy-MM-dd'T'HH:mm:ss.SSSZ", needFormat: "dd/MM/yyyy")
            return strDate ?? ""
        }
        
        // Remove nil values
        self.dictDiaryList?.removeValue(forKey: "")
        
        if self.dictDiaryList != nil, self.dictDiaryList!.count > 0 {
            
            // Get all dates
            self.arrDates = Array(self.dictDiaryList!.keys)
            
            // Sorting date
            self.arrDates?.sort {
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "dd/MM/yyyy"
                if let date1 = dateFormatter.date(from: $0),
                    let date2 = dateFormatter.date(from: $1){
                    return date1 > date2
                } else {
                    return false
                }
            }
            
            self.showTable(show: true)
        } else {
            self.showTable(show: false)
        }
        
    }
    
    
    
    //--------------------------------------------------
    // MARK:- View Life Cycle Methods
    //--------------------------------------------------
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
        
        if Reachability.isConnectedToNetwork() {
            self.callWSToGetNotesList()
        } else {
            self.showAlert(message: "Internet not available")
        }
    }
}


//--------------------------------------------------
// MARK:- Extension - UITableViewDataSource
//--------------------------------------------------

extension DiaryListVC: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.arrDates?.count ?? 0
    }
    
    //--------------------------------------------------
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        let key = self.arrDates?[section] ?? ""
        return self.dictDiaryList?[key]?.count ?? 0
    }
    
    //--------------------------------------------------
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let diaryListCell = tableView.dequeueReusableCell(withIdentifier: "DiaryListTVC", for: indexPath) as! DiaryListTVC
        diaryListCell.delegate = self
        diaryListCell.diaryView.addShadowCornerRadius(offset: CGSize(width: 2, height: 2), opacity: 0.8, shadowRadius: 5, radius: 10)
        
        let key = self.arrDates?[indexPath.section] ?? ""
        
        if let arrData = self.dictDiaryList?[key] {
            
            let notes = arrData[indexPath.row]
            diaryListCell.configure(diary: notes)
        }
        
        // Hide/Show top bottom.
        diaryListCell.viewBottomVerticalLine.isHidden = (2 == indexPath.row)
        
        return diaryListCell
    }
    
    //--------------------------------------------------
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        return self.arrDates?[section]
    }
}


//--------------------------------------------------
// MARK:- Extension - UITableViewDelegate
//--------------------------------------------------

extension DiaryListVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let headerView = DurationHeaderView.instanceFromNib()
        headerView.lblTitle.text = nil
        
        if let strDate = self.arrDates?[section] {
            
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd/MM/yyyy"
            
            // Get date
            if let date = dateFormatter.date(from: strDate) {
                
                // Days
                let days = Date().days(from: date)
                
                if days < 30 {
                    if days == 0 {
                        headerView.lblTitle.text = "Today"
                    }
                    else if days == 1 {
                        headerView.lblTitle.text = "Yesterday"
                    }
                    else {
                        
                        // Check month of date
                        let todayMonth = Date().monthTwoDigit_Int
                        let dateMonth = date.monthTwoDigit_Int
                        
                        if todayMonth == dateMonth {
                            headerView.lblTitle.text = strDate
                        } else {
                            headerView.lblTitle.text = date.monthNameFull
                        }
                    }
                } else {
                    
                    // Get month difference
                    let months = Date().months(from: date)
                    
                    if months <= 12 {
                        
                        // Get year difference
                        let todayYear = Date().yearFourDigit_Int
                        let dateYear = date.yearFourDigit_Int
                        
                        if todayYear == dateYear {
                            headerView.lblTitle.text = date.monthNameFull
                        } else {
                            headerView.lblTitle.text = "\(date.monthNameFull) \(date.yearFourDigit)"
                        }
                        
                    } else {
                        headerView.lblTitle.text = "\(date.monthNameFull) \(date.yearFourDigit)"
                    }
                }
            }
        }
        
        return headerView
    }
    
    //--------------------------------------------------
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
}


//--------------------------------------------------
// MARK:- Extension - DiaryListTVCDelegate
//--------------------------------------------------

extension DiaryListVC: DiaryListTVCDelegate {
    
    func editTapped(_ note: DiaryListModel) {
        let addDiaryVC = AddDiaryVC.viewController()
        addDiaryVC.isAddDiary = false
        addDiaryVC.diary = note
        self.navigationController?.pushViewController(addDiaryVC, animated: true)
    }
    
    //--------------------------------------------------
    
    func deleteTapped(_ note: DiaryListModel) {
        
        let actionYes = UIAlertAction(title: "Yes", style: .default) { (_) in
            
            guard self.arrDiaryList != nil else { return }
            
            // Remove note
            self.arrDiaryList?.removeAll(where: { $0.id == note.id })
            
            self.manipualteData()
        }
        
        let actionCancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        self.showAlert(message: "Are you sure you want to delete this note?", actions: [actionYes, actionCancel], style: .alert)
    }
}
