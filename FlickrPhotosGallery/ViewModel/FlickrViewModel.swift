//
//  FlickrViewModel.swift
//  FlickrPhotosGallery
//
//  Created by Dipika Bari on 04/03/2022.
//

import Foundation

class FlickrViewModel {
    
    private let networkManager = NetworkManager()
    private let view: FlickrViewProtocol

    var photoArray = [Photo]()
    var imageArray = [Data]()
    var imageData = Data()
    init(view: FlickrViewProtocol){
        self.view = view
    }
    
    /* get response from api into your defined array*/
    func fetchData(text: String){
      
      DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
         self.networkManager.fetchData(text: text) { [weak self] array in
         self?.photoArray = array.photos.photo
         print(self?.photoArray.count)
       }
          
      }
  }
    
    /* Construct the image url from json data
     https://live.staticflickr.com/<server>/<id>_<secret>_w.jpg
    */
    
    /* download image form imageurl */
    func downloadImages()  {
        print("downloadImage()")

        let baseUrl = NetworkURL.baseImageURL
        let completeUrlArray = photoArray.map {
            "\(baseUrl)\($0.server)/\($0.id)_\($0.secret)_w.jpg"
        }
        
        for (index, url) in completeUrlArray.enumerated() {
             print(url)
             networkManager.getImageData(from: url) { [weak self] data in
                if let data = data {
                    self?.imageData = data
                    self?.imageArray[index] = data
                }
            }
        }
        // return self.imageData
    }
    
   
}

