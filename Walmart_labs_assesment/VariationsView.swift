//
//  VariationsView.swift
//  Walmart_labs_assesment
//
//  Created by Praven on 2/18/17.
//  Copyright © 2017 Pravendra Singh. All rights reserved.
//

import UIKit

class VariationsView: UIViewController, UITableViewDataSource {

    @IBOutlet weak var variationsTable: UITableView!
    var longForm: LongForm?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension VariationsView {
    
    // pragma Mark UITableView Datasource methods
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (longForm?.vars.count)!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "cell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as! CustomCell
        let longForm = self.longForm?.vars[indexPath.row] as! Variation
        cell.lfLabel.text = longForm.lf
        cell.sinceLabel.text = String(format: kSinceText,longForm.since)
        cell.freqLabel.text = String(format: kFrequencyText,longForm.freq)
        return cell
    }
}
