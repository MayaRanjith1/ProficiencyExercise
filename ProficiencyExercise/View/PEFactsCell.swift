//
//  PEFactsCell.swift
//  ProficiencyExercise
//
//  Created by Ranjith Karuvadiyil on 29/07/20.
//  Copyright © 2020 Mistybits Pvt Ltd. All rights reserved.
//

import UIKit

class PEFactsCell: UITableViewCell {
    lazy var width: NSLayoutConstraint = {
        let width = contentView.widthAnchor.constraint(equalToConstant: bounds.size.width)
        width.isActive = true
        return width
    }()
    
    let rowTitleLabel: UILabel = {
        let rowTitleLabel = UILabel()
        rowTitleLabel.backgroundColor = .white
        rowTitleLabel.numberOfLines = 0
        rowTitleLabel.textAlignment = NSTextAlignment.center
        rowTitleLabel.font = UIFont.boldSystemFont(ofSize: 18.0)
        rowTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        return rowTitleLabel
    }()
    
    let rowDescLabel: UILabel = {
        let rowDescLabel = UILabel()
        rowDescLabel.backgroundColor = .white
        rowDescLabel.numberOfLines = 0
        rowDescLabel.translatesAutoresizingMaskIntoConstraints = false
        return rowDescLabel
    }()
    
    let rowImageView: UIImageView = {
        let rowImageView = UIImageView()
        rowImageView.translatesAutoresizingMaskIntoConstraints = false
        rowImageView.image = UIImage(named: "no-image-icon-23494")
        return rowImageView
    }()
    

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
          super.init(style: style, reuseIdentifier: reuseIdentifier)
          contentView.backgroundColor = UIColor.white
          setupViews()

      }
    
    required init?(coder aDecoder: NSCoder) {
          fatalError("init(coder:) has not been implemented")
      }
    fileprivate func setupViews() {
           contentView.addSubview(rowTitleLabel)
           rowTitleLabel.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
           rowTitleLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor).isActive = true
           rowTitleLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor).isActive = true
           
           contentView.addSubview(rowDescLabel)
           rowDescLabel.topAnchor.constraint(equalTo: rowTitleLabel.bottomAnchor, constant: 1).isActive = true
           rowDescLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor).isActive = true
           rowDescLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor).isActive = true
           
           contentView.addSubview(rowImageView)
           rowImageView.topAnchor.constraint(equalTo: rowDescLabel.bottomAnchor, constant: 10).isActive = true
           rowImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
           rowImageView.heightAnchor.constraint(equalToConstant: 100).isActive = true
           rowImageView.widthAnchor.constraint(equalToConstant: 100).isActive = true
           
           if let lastSubview = contentView.subviews.last {
               contentView.bottomAnchor.constraint(equalTo: lastSubview.bottomAnchor, constant: 10).isActive = true
           }
           
       }
    
    func setupCellWithValues(model:FactRows){
        
    }
   

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
