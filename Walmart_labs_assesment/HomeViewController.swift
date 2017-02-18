//
//  HomeViewController.swift
//  Walmart_labs_assesment
//
//  Created by Praven on 2/17/17.
//  Copyright © 2017 Pravendra Singh. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var searchTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        searchTextField.text = kEmptyString
    }
    
    // pragma mark IBAction
    // Search button action
    @IBAction func searchButtonClicked() {
        searchTextField.resignFirstResponder()
        if searchTextField.text != kEmptyString {
            self.performSegue(withIdentifier: kSearchResultSegue, sender: nil)
        }else {
            UIAlertController.showAlert(title: kErrorTitle, message: kEmptySearchFieldMessage, completionHandler: { (alertAction) in
                
            })
        }
    }
    
    // pragma mark UITextFieldDelegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchTextField.resignFirstResponder()
        return true
    }
    
    // overriding touchBegan function for hiding Keyboard
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        searchTextField.resignFirstResponder()
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
        
        // pass search string to Search result view for marking network call.
        if segue.identifier == kSearchResultSegue {
            let searchResult = segue.destination as! SearchResultView
            searchResult.searchString = self.searchTextField.text;
        }
    }

}
