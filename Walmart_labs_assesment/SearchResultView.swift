//
//  SearchResultView.swift
//  Walmart_labs_assesment
//
//  Created by Praven on 2/17/17.
//  Copyright © 2017 Pravendra Singh. All rights reserved.
//

import UIKit
import MBProgressHUD

class SearchResultView: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var resultTable: UITableView!
    var searchString: String?
    var acronym: Acronym?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
         searchAcronyms(for: searchString)
    }
    
    // Search long forms of Acronyms
    // passing Acronym as parameter
    fileprivate func searchAcronyms(for acronyms:String?) {
        
        guard let acronyms = acronyms else {
            return
        }
        
        MBProgressHUD.showAdded(to: self.view, animated: true)
        let networkReq = NetworkRequest()
        networkReq.searchLongFormsFor(acronyms) { ( response:Acronym?, error:Error?) in
            
            DispatchQueue.main.async {
                MBProgressHUD.hide(for: self.view, animated: true)
                if error == nil && response != nil {
                    self.acronym = response
                    self.resultTable.reloadData()
                }else {
                    if error != nil {
                        self.showAlertView((error?.localizedDescription)!)
                    }else {
                        self.showAlertView(kGeneralErrorMessage)
                    }
                }
            }
        }
    }
    
    // show AlertView
    fileprivate func showAlertView(_ message:String) {
        UIAlertController.showAlert(title: kErrorTitle, message: message) { (alert) in
            if alert == alertAction.OK {
                self.navigationController?.popViewController(animated: true)
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        if segue.identifier == kVariationSegue {
            let indexPath = self.resultTable.indexPathForSelectedRow
            let variationView = segue.destination as! VariationsView
            variationView.longForm = self.acronym?.lfs[indexPath!.row] as! LongForm?
        }
    }
    
}

extension SearchResultView {
    
    // pragma Mark UITableView Datasource methods
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if self.acronym != nil {
            return self.acronym!.lfs.count
        }else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "cell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as! CustomCell
        let longForm = self.acronym?.lfs[indexPath.row] as! LongForm
        cell.lfLabel.text = longForm.lf
        cell.sinceLabel.text = String(format: kSinceText,longForm.since)
        cell.freqLabel.text = String(format: kFrequencyText,longForm.frequency)
        return cell
    }
    
    // pragma Mark UITableView Delegate method
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let longForm = self.acronym?.lfs[indexPath.row] as! LongForm
        guard longForm.vars.count > 0 else {
            UIAlertController.showAlert(title: kVeariationsErrorTitle, message: String(format:kVariationsErrorMessage,longForm.lf), completionHandler: { (alertAction) in
                
            })
            return
        }
        self.performSegue(withIdentifier: kVariationSegue, sender: nil)
    }
}
