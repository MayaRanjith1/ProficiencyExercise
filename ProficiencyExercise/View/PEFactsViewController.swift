//
//  PEFactsViewController.swift
//  ProficiencyExercise
//
//  Created by Ranjith Karuvadiyil on 28/07/20.
//  Copyright © 2020 Mistybits Pvt Ltd. All rights reserved.
//

import UIKit

class PEFactsViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.tableView.register(PEFactsCell.self, forCellReuseIdentifier: PEConstants.CellIdentifiers.factCell)

    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
