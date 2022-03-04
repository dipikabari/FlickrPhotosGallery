//
//  NetworkManager.swift
//  FlickrPhotosGallery
//
//  Created by Dipika Bari on 04/03/2022.
//

import Foundation

class NetworkManager {
    
    func fetchData( completion: @escaping (FlickrResponseModel) -> Void){
        
        if let url = URL(string: fetchUrlforSearch().absoluteString){
            print("url:  \(url)")
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
    
   /* construct the url for flickr */
    func fetchUrlforSearch() -> URL{
        var components = URLComponents()
        
        components.scheme = "https"
        components.host = "www.flickr.com"
        components.path = "/services/rest"
            
        components.queryItems = [
             URLQueryItem(name: "method", value: NetworkURL.method),
             URLQueryItem(name: "api_key", value: NetworkURL.api_key),
             URLQueryItem(name: "format", value: NetworkURL.format),
             URLQueryItem(name: "nojsoncallback", value: NetworkURL.nojsoncallback),
             URLQueryItem(name: "text", value: "cat"),
            ]

        guard let url = components.url else {
            preconditionFailure("Invalid URL string")
        }
            
        return url
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
