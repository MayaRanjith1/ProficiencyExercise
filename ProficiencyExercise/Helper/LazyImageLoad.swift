//
//  LazyImageLoad.swift
//  ProficiencyExercise
//
//  Created by Ranjith Karuvadiyil on 29/07/20.
//  Copyright © 2020 Mistybits Pvt Ltd. All rights reserved.
//

import UIKit
import SDWebImage

class LazyImageLoad {

    static func setImageOnImageViewFromUrl(imageView: UIImageView, url: String??,response: @escaping (_ image: UIImage?) -> Void){
        
        imageView.sd_cancelCurrentImageLoad()
        guard let urlString = url, let pathUrl = getURLFromString(url: urlString) else {
            response(nil)
            return
        }
        imageView.sd_imageIndicator = SDWebImageActivityIndicator.gray
        imageView.sd_setImage(with: pathUrl,completed: { (image,error,type,url) in
            
            response(image)
            
        })
    }
    
    class func getURLFromString(url: String?) -> URL? {
        print("url\(url ?? "") ")
        let removePercentEncodingURL = url?.removingPercentEncoding
        let urlWithEscapingString = removePercentEncodingURL?.addingPercentEncoding(withAllowedCharacters:
            NSCharacterSet.urlQueryAllowed)
        let strURL: URL?
        if url!.isEmpty {
            return nil
        }else{
           strURL = URL(string: (urlWithEscapingString ?? ""))!
        }
        return strURL
    }
}
