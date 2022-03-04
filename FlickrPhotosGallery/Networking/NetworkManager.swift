//
//  NetworkManager.swift
//  FlickrPhotosGallery
//
//  Created by Dipika Bari on 04/03/2022.
//

import Foundation

class NetworkManager {
    
    let urlString = "https://www.flickr.com/services/rest/?method=flickr.photos.search&api_key=3af99bda83cc336f598271e144587b58&format=json&nojsoncallback=1&text=cat"
    
    func fetchData( completion: @escaping (FlickrResponseModel) -> Void){
        
        if let url = URL(string: urlString ){
            
            URLSession.shared.dataTask(with: url) { data,urlResponse, error in
                if let data =  data{
                    do {
                        let result: FlickrResponseModel = try JSONDecoder().decode(FlickrResponseModel.self, from: data)
                        completion(result)
                    }catch let error {
                        print(error)
                    }
                 }
            }
            .resume()
        }
    }
    
    func getImageData(from url: String, completion: @escaping (Data?) -> Void) {
            guard let url = URL(string: url) else { completion(nil)
                return
            }
            
            URLSession.shared.dataTask(with: url) { data, response, error in
                completion(data)
            }
            .resume()
    }
    
}
