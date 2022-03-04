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
    
    init(view: FlickrViewProtocol){
        self.view = view
    }
    
    /* get response from api into your defined array*/
    func fetchData(){
        
       networkManager.fetchData{ [weak self] array in
       self?.photoArray = array.photos.photo
       print(self?.photoArray.count)
       print(self?.photoArray[0].title)
      }
        
    }
    
    

}

