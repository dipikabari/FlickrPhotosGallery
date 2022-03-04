//
//  FlickrResponseModel.swift
//  FlickrPhotosGallery
//
//  Created by Dipika Bari on 04/03/2022.
//

import Foundation

struct FlickrResponseModel: Codable {
    let photos: FlickrPhotos
}

struct FlickrPhotos: Codable{
    let page: Int
    let pages: Int
    let perpage: Int
    let total: Int
    let photo: [Photo]
}

struct Photo: Codable {
    let id: String
    let owner: String
    let secret: String
    let server: String
    let farm: Int
    let title: String
    
   // let url_m: String?
}
