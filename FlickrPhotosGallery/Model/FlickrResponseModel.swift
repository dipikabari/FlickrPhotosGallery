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
    let photo: [Photo]
}

struct Photo: Codable {
    let id: String
    let owner: String
    let secret: String
    let server: String
    let title: String
}
