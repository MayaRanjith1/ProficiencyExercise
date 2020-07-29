//
//  PEFactsViewController.swift
//  ProficiencyExercise
//
//  Created by Ranjith Karuvadiyil on 28/07/20.
//  Copyright © 2020 Mistybits Pvt Ltd. All rights reserved.
//

import UIKit

class PEFactsViewController: UITableViewController {
    
    lazy var viewModel: PEViewModel = {
        let viewmod = PEViewModel()
        return viewmod
    }()
    
    var factsArray: [FactRows] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.tableView.register(PEFactsCell.self, forCellReuseIdentifier:CellIdentifiers.factCell)
        getFactsData()
        
        
    }
    
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
    
    override   func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.factsArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:PEFactsCell = (tableView.dequeueReusableCell(withIdentifier: CellIdentifiers.factCell, for: indexPath) as? PEFactsCell)!

        if self.factsArray.count>0{
            
        }
        if (model != nil) {
            let photos = self.model!.rowsItem
            let headline = photos[indexPath.row]
            // print(headline.title!)
            cell.rowTitleLabel.text = headline.title
            cell.rowDescLabel.text = headline.description
            let imageValue:String = headline.imageHref
            //  print(headline.title)
            if imageValue.isEmpty {
                cell.rowImageView.image = UIImage(named: "no-image-icon-23494")
            }else{
                  let url = URL(string:(headline.imageHref))
                URLSession.shared.dataTask(with: url!) { data, response, error in
                    guard
                        let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                        let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                        let data = data, error == nil,
                        let image = UIImage(data: data)
                        else { return }
                    DispatchQueue.main.async() {
                        cell.rowImageView.image = image
                    }
                    }.resume()

            }
        }
        return cell
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

