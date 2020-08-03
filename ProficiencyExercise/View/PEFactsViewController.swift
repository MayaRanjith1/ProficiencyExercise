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
        viewModel.delegate = self
        pullToRefreshCall()
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        getFactsData()
    }
    //MARK:- private Methods
    
    private func getFactsData(){
        LoadingSpinner.show()
        viewModel.fetchFactData()
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
    
    private func showAlert(title:String,message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        self.present(alert, animated: true)
    }
    
    
    
    //MARK:- UITableview Datasource Methods
    
    override   func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return viewModel.factDetails?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:PEFactsCell = (tableView.dequeueReusableCell(withIdentifier: CellIdentifiers.factCell, for: indexPath) as? PEFactsCell)!
        
        if viewModel.factDetails?.count ?? 0 > 0{
            cell.setupCellWithValues(model: (viewModel.factDetails?[indexPath.row])!)
        }
        
        return cell
    }
    
    //MARK:- UITableview delegate Methods
    
    override   func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    
}
extension PEFactsViewController: PEViewModelDelegate{
    func showNetworkError() {
        showAlert(title: "", message: NetworkError.noInternet)
    }
    
    func fetchedFacts() {
        DispatchQueue.main.async {
            LoadingSpinner.hide()

            self.tableView.reloadData()
            
        }
    }
    
    func showRequestError(_ error: String) {
        showAlert(title: "", message: NetworkError.noDatafound)
    }
    
}

