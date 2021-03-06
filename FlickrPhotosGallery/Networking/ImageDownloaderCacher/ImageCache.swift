//
//  ImageCache.swift
//  FlickrPhotosGallery
//
//  Created by Dipika Bari on 08/03/2022.
//

import Foundation
import UIKit

class ImageCache {
    
    static let shared = ImageCache()
    
    private init() {}
    var cache = NSCache<NSString, UIImage>()
    
    func get(forKey: String) -> UIImage? {
        return cache.object(forKey: NSString(string: forKey))
    }
    
    func set(forKey: String, image: UIImage) {
        cache.setObject(image, forKey: NSString(string: forKey))
    }
}

extension ImageCache {
    private static var imageCache = ImageCache()
    static func getImageCache() -> ImageCache {
        return imageCache
    }
}
