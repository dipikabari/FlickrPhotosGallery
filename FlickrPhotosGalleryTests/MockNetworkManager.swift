//
//  MockNetworkManager.swift
//  FlickrPhotosGalleryTests
//
//  Created by MAC on 08/03/22.
//

import Foundation
@testable import FlickrPhotosGallery


class MockNetworkManager: Networkable {
    func fetchData(text: String, completion: @escaping (FlickrResponseModel?, Error?) -> Void) {
        
        let bundle = Bundle(for:MockNetworkManager.self)
        
        guard let url = bundle.url(forResource:text, withExtension:"json"),
              let data = try? Data(contentsOf: url)

        else {
            return
        }
        
         do {
            let result: FlickrResponseModel = try JSONDecoder().decode(FlickrResponseModel.self, from: data)
            completion(result, nil)
        }catch let error {
            completion(nil, error)
        }

    }
}
