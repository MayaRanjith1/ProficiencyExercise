//
//  PEFactsViewController.swift
//  ProficiencyExercise
//
//  Created by Maya Ranjith  on 28/07/20.
//

import UIKit

class PEFactsViewController: UITableViewController {
    
    // MARK:- Variable Initialization
    
    var pullToRefresh = UIRefreshControl()
    var factsArray: [FactRows] = []
    var viewModel: PEViewModel = {
        let viewmod = PEViewModel()
        return viewmod
    }()
    
    //MARK:- Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.tableView.register(PEFactsCell.self, forCellReuseIdentifier:CellIdentifiers.factCell)
        self.tableView.backgroundColor = .white
        getFactsData()
        pullToRefreshCall()
    }
    
    //MARK:- private Methods
    
    private func getFactsData(){
        viewModel.getFactData { (isSuccess) in
            if isSuccess{
                self.factsArray = self.viewModel.factDetails!
                DispatchQueue.main.async {
                    
                    if self.factsArray.count>0{
                        self.tableView.reloadData()
                    }
                }
                
            }
        }
    }
    
    func pullToRefreshCall(){
        self.pullToRefresh.attributedTitle = NSAttributedString(string: "Pull to refresh")
        self.pullToRefresh.addTarget(self, action: #selector(handleRefresh), for: .valueChanged)
        self.view.addSubview(self.pullToRefresh)
        
    }
    
    @objc func handleRefresh(_ refreshControl: UIRefreshControl){
        getFactsData()
        refreshControl.endRefreshing()
    }
    
    //MARK:- UITableview Datasource Methods
    
    override   func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.factsArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:PEFactsCell = (tableView.dequeueReusableCell(withIdentifier: CellIdentifiers.factCell, for: indexPath) as? PEFactsCell)!
        
        if self.factsArray.count>0{
            cell.setupCellWithValues(model: self.factsArray[indexPath.row])
        }
        
        return cell
    }
    
    //MARK:- UITableview delegate Methods
    
    override   func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    
}

