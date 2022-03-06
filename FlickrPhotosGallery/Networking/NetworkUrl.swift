//
//  NetworkUrl.swift
//  FlickrPhotosGallery
//
//  Created by Dipika Bari on 04/03/2022.
//
/*
   https://www.flickr.com/services/rest/
   ?method=flickr.photos.search
   &api_key=3af99bda83cc336f598271e144587b58
   &format=json
   &nojsoncallback=1
   &text=cat
*/

import Foundation

enum NetworkURL {
  
    static let baseURL = "https://www.flickr.com/services/rest/"
    static let method = "flickr.photos.search"
    static let api_key = "3af99bda83cc336f598271e144587b58"
    static let format = "json"
    static let nojsoncallback = "1"
    
    
    
    static let baseImageURL = "https://live.staticflickr.com/"
}



