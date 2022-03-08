//
//  ViewController.swift
//  FlickrPhotosGallery
//
//  Created by Dipika Bari on 04/03/2022.
//

import UIKit

class PhotoSearchViewController: UIViewController {
    
    
    private var viewModel: FlickrViewModel!

    @IBOutlet private weak var searchImage: UISearchBar!
    let searchController = UISearchController(searchResultsController: nil)

    @IBOutlet private weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel = FlickrViewModel(delegate: self)          //initialize viewModel
        searchImage.delegate = self
        collectionView.dataSource = self

    }
}

/* Search bar */
extension PhotoSearchViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            self.viewModel.fetchData(text: searchText)
        }
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        self.collectionView.reloadData()
    }
}

extension PhotoSearchViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.photosCount
    }
     
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "customCell", for: indexPath) as! FlickrPhotosCollectionViewCell
        
        if let imageUrl = viewModel.getImageUrl(index: indexPath.row) {
            cell.flickrPhoto.loadImageFromUrl(urlString:imageUrl )
        }
        return cell
    }
     
}


/* Conform to protocol */
extension PhotoSearchViewController: FlickrViewProtocol {
    func displayError(_ message: String) {
        DispatchQueue.main.async {

        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        let doneButton = UIAlertAction(title: "Done", style: .default, handler: nil)
        alert.addAction(doneButton)
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    func refreshUI() {
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }

}



