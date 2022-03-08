//
//  FlickrViewProtocol.swift
//  FlickrPhotosGallery
//
//  Created by Dipika Bari on 04/03/2022.
//

import Foundation

protocol FlickrViewProtocol: AnyObject {
    func displayError(_ message: String)
    func refreshUI()
}
