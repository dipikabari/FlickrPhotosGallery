//
//  NetworkManager.swift
//  FlickrPhotosGallery
//
//  Created by Dipika Bari on 08/03/2022.
//

import Foundation

protocol Networkable {
    func fetchData(text:String, completion: @escaping (FlickrResponseModel?, Error?) -> Void)
}

class NetworkManager: Networkable {
    
    func fetchData(text:String, completion: @escaping (FlickrResponseModel?, Error?) -> Void){
        
        guard let url = URL(string: fetchUrlforSearch(searchText: text).absoluteString) else { return }
            
            URLSession.shared.dataTask(with: url) { data,urlResponse, error in
                if let data =  data{
                    do {
                        let result: FlickrResponseModel = try JSONDecoder().decode(FlickrResponseModel.self, from: data)
                        completion(result, nil)
                    }catch let error {
                        completion(nil, error)
                    }
                 }
            }
            .resume()
        }
    
    
   /* construct the url for flickr */
    func fetchUrlforSearch(searchText: String) -> URL {
        var components = URLComponents()
        
        components.scheme = "https"
        components.host = "www.flickr.com"
        components.path = "/services/rest"
            
        components.queryItems = [
             URLQueryItem(name: "method", value: NetworkURL.method),
             URLQueryItem(name: "api_key", value: NetworkURL.api_key),
             URLQueryItem(name: "format", value: NetworkURL.format),
             URLQueryItem(name: "nojsoncallback", value: NetworkURL.nojsoncallback),
             URLQueryItem(name: "text", value: searchText),
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
