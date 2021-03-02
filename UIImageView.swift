//
//  UIImageView.swift
//  mymarvel
//
//  Created by Gilberto Masetto on 02/03/21.
//  Copyright © 2021 Gilberto Masetto. All rights reserved.
//

import UIKit

let imageCache = NSCache<AnyObject, AnyObject>()

extension UIImageView {

    func loadImageCache(urlString: String) {

        let url = URL(string: urlString)!

        if let imageFromCache = imageCache.object(forKey: urlString as AnyObject) as? UIImage {
            self.image = imageFromCache
            return
        } else {
            let dataTask = URLSession.shared.dataTask(with: url) { [weak self] (data, _, _) in
                if let data = data {
                    DispatchQueue.main.async {
                        if let imageToCache = UIImage(data: data){
                            imageCache.setObject(imageToCache, forKey: urlString as AnyObject)
                            self?.image = imageToCache
                        }
                    }
                }
            }
            dataTask.resume()
        }
    }
}
