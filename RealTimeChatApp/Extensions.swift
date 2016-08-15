//
//  Extensions.swift
//  RealTimeChatApp
//
//  Created by German Mendoza on 8/12/16.
//  Copyright © 2016 German LLC. All rights reserved.
//

import UIKit

extension UIColor {

    convenience init(r: CGFloat, g:CGFloat, b:CGFloat) {
        self.init(red: r/255, green: g/255, blue:b/255, alpha:1)
    }

}

let imageCache = NSCache()

extension UIImageView {

    func loadImageUsingCacheWithUrlString(urlString:String) {
        
        self.image = nil
        if let cachedImage = imageCache.objectForKey(urlString) as? UIImage {
            self.image = cachedImage
        }
        
        let url = NSURL(string: urlString)
        NSURLSession.sharedSession().dataTaskWithURL(url!, completionHandler: { (data, response, error) in
            
            if error != nil {
                print(error)
                return
            }
            
            dispatch_async(dispatch_get_main_queue(), {
                if let downloadImage = UIImage(data: data!) {
                    imageCache.setObject(downloadImage, forKey: urlString)
                    self.image = downloadImage
                }
            })
            
            
            
        }).resume()
        
    }
    
}
