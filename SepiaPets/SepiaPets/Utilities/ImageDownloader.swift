//
//  ImageDownloader.swift
//  SepiaPets
//
//  Created by Sushobhit Jain on 25/10/22.
//

import Foundation
import UIKit

let imageCache = NSCache<AnyObject, AnyObject>()
let activityView = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.large)
extension UIImageView {
  func loadRemoteImageFrom(urlString: String){
    let url = URL(string: urlString)
    image = nil
    activityView.center = self.center
    activityView.color = .black
    self.addSubview(activityView)
    activityView.startAnimating()
    if let imageFromCache = imageCache.object(forKey: urlString as AnyObject) as? UIImage {
      self.image = imageFromCache
      activityView.stopAnimating()
      activityView.removeFromSuperview()
      return
    }
    URLSession.shared.dataTask(with: url!) {
      data, response, error in
      DispatchQueue.main.async {
        activityView.stopAnimating()
        activityView.removeFromSuperview()
      }
      if let response = data {
        DispatchQueue.main.async {
          if let imageToCache = UIImage(data: response) {
            imageCache.setObject(imageToCache, forKey: urlString as AnyObject)
            self.image = imageToCache
          }else{
            self.loadRemoteImageFrom(urlString: imageNotFound)
          }
        }
      }
    }.resume()
  }
}

let imageNotFound = "https://via.placeholder.com/300/000000/FFFFFF/?text=Image%20Not%20Found"
