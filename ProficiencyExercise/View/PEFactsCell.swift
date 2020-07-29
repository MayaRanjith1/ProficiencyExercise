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
    
    let factTitleLabel: UILabel = {
        let factTitleLabel = UILabel()
        factTitleLabel.backgroundColor = .white
        factTitleLabel.textColor = .black

        factTitleLabel.numberOfLines = 0
        factTitleLabel.textAlignment = NSTextAlignment.center
        factTitleLabel.font = UIFont.boldSystemFont(ofSize: 18.0)
        factTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        return factTitleLabel
    }()
    
    let factDescLabel: UILabel = {
        let factDescLabel = UILabel()
        factDescLabel.backgroundColor = .white
        factDescLabel.textColor = .black
        factDescLabel.numberOfLines = 0
        factDescLabel.textAlignment = NSTextAlignment.center

        factDescLabel.translatesAutoresizingMaskIntoConstraints = false
        return factDescLabel
    }()
    
    let factImageView: UIImageView = {
        let factImageView = UIImageView()
        factImageView.translatesAutoresizingMaskIntoConstraints = false
        factImageView.image = UIImage(named: "no-image-icon")
        return factImageView
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
        contentView.addSubview(factTitleLabel)
        factTitleLabel.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        factTitleLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor).isActive = true
        factTitleLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor).isActive = true
        
        contentView.addSubview(factDescLabel)
        factDescLabel.topAnchor.constraint(equalTo: factTitleLabel.bottomAnchor, constant: 1).isActive = true
        factDescLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor).isActive = true
        factDescLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor).isActive = true
        
        contentView.addSubview(factImageView)
        factImageView.topAnchor.constraint(equalTo: factDescLabel.bottomAnchor, constant: 10).isActive = true
        factImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        factImageView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        factImageView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        
        if let lastSubview = contentView.subviews.last {
            contentView.bottomAnchor.constraint(equalTo: lastSubview.bottomAnchor, constant: 10).isActive = true
        }
        
    }
    
    func setupCellWithValues(model:FactRows){
        factTitleLabel.text = model.title
        factDescLabel.text = model.description
        LazyImageLoad.setImageOnImageViewFromUrl(imageView: factImageView,url:model.imageName){(image) in
            if image == nil {
                DispatchQueue.main.async {
                    self.factImageView.image = UIImage(named: "no-image-icon")
                    
                }
            }
        }
        
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.backgroundColor = .white
    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
