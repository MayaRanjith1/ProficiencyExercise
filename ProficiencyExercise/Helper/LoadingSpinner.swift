//
//  LoadingSpinner.swift
//  ProficiencyExercise
//
//  Created by Ranjith Karuvadiyil on 03/08/20.
//  Copyright © 2020 Mistybits Pvt Ltd. All rights reserved.
//

import UIKit

class LoadingSpinner: UIView {
    var centerView: UIView?
    var  activityIndicator : UIActivityIndicatorView?
    
    static let shared = LoadingSpinner()
    
    static func show(){
        shared.showSpinner()
    }
    
    static func hide(){
        shared.hideSpinner()
    }
    
    //MARK:- Instance method
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.init_View()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func init_View(){
        let black = UIColor.black
        let blackTrans = UIColor.withAlphaComponent(black)(0.6)
        backgroundColor = blackTrans
    }
    
    func showSpinner(){
        let keyWindow = UIApplication.shared.connectedScenes
        .filter({$0.activationState == .foregroundActive})
        .map({$0 as? UIWindowScene})
        .compactMap({$0})
        .first?.windows
        .filter({$0.isKeyWindow}).first
        if let parentView = keyWindow?.rootViewController?.view{
            frame = CGRect(x: 0, y: 0, width: parentView.bounds.width, height: parentView.bounds.height)
            parentView.addSubview(self)
            if centerView == nil{
                addCenterView()
            }
            activityIndicator?.startAnimating()
        }
    }
    
    func hideSpinner(){
        if activityIndicator != nil{
            activityIndicator?.stopAnimating()
        }
        if superview != nil{
            removeFromSuperview()
        }
    }
    
    func addCenterView(){
        let viewWidth: CGFloat = 100
        centerView = UIView(frame: CGRect(x: 0, y: 0, width: viewWidth, height: viewWidth))
        addSubview(centerView!)
        centerView?.translatesAutoresizingMaskIntoConstraints = false
        centerView?.heightAnchor.constraint(equalToConstant: viewWidth).isActive = true
        centerView?.widthAnchor.constraint(equalToConstant: viewWidth).isActive = true
        centerView?.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        centerView?.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true

        centerView?.backgroundColor = UIColor.gray
        centerView?.layer.cornerRadius = 10
        centerView?.layer.masksToBounds = true
        
        activityIndicator = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.large)
        centerView?.addSubview(activityIndicator!)
        activityIndicator?.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator?.centerXAnchor.constraint(equalTo: centerView!.centerXAnchor).isActive = true
        activityIndicator?.centerYAnchor.constraint(equalTo: centerView!.centerYAnchor).isActive = true

        
    }

}
