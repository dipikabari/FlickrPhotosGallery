//
//  FlickrViewModel.swift
//  FlickrPhotosGallery
//
//  Created by Dipika Bari on 04/03/2022.
//

import Foundation

class FlickrViewModel {
    
    private let networkManager: Networkable
    
    private weak var delegate: FlickrViewProtocol?

    private var photoArray = [Photo]()
    
    var photosCount:Int {
        return photoArray.count
    }
    
    init(delegate: FlickrViewProtocol, networkManager:Networkable = NetworkManager()){
        self.delegate = delegate
        self.networkManager = networkManager
    }
    
    /* get response from api into your defined array*/
    func fetchData(text: String){
          
          self.networkManager.fetchData(text: text) { [weak self] response, error in
              
              guard let response = response , error == nil else {
                  self?.delegate?.displayError("Failed to Search, Pls try again!")
                  return
              }

              self?.photoArray = response.photos.photo
              
              DispatchQueue.main.async {
                  self?.delegate?.refreshUI()
              }
          }
      
      
  }
    
    func getImageUrl(index: Int) -> String? {
        
        if index < photosCount && index >= 0  {
            let photo = photoArray[index]
          return "\(NetworkURL.baseImageURL)\(photo.server)/\(photo.id)_\(photo.secret)_w.jpg"
        }
        
        return nil
    }
       
}


