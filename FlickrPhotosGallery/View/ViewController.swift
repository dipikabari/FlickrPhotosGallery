//
//  ViewController.swift
//  FlickrPhotosGallery
//
//  Created by Dipika Bari on 04/03/2022.
//

import UIKit

class ViewController: UIViewController {
    
    private var viewModel: FlickrViewModel!

    @IBOutlet private weak var searchImage: UISearchBar!
    let searchController = UISearchController(searchResultsController: nil)

    @IBOutlet private weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel = FlickrViewModel(view: self)          //initialize viewModel
        searchImage.delegate = self
                
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        collectionView.dataSource = self

    }
}
 
/* Search bar */
extension ViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
       // DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
        print("search for \(searchText)")
        self.viewModel.fetchData(text: searchText)
        //}
        DispatchQueue.main.asyncAfter(deadline: .now() + 8) {
            if(self.viewModel.photoArray.count > 0){
                self.viewModel.downloadImages()
               // self.flickrPhoto.image = UIImage(data: self.viewModel.imageData)
                self.collectionView.reloadData()

            }
        }
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        self.collectionView.reloadData()
    }
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print("numberOfItemsInSection  \(viewModel.imageArray.count)")
        return viewModel.imageArray.count
    }
     
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "customCell", for: indexPath) as! FlickrPhotosCollectionViewCell
        
        cell.flickrPhoto.image = UIImage(data: self.viewModel.imageArray[indexPath.row])
        
        return cell
    }
     
}


/* Conform to protocol */
extension ViewController: FlickrViewProtocol {
    func displayError(_ message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        let doneButton = UIAlertAction(title: "Done", style: .default, handler: nil)
        alert.addAction(doneButton)
        present(alert, animated: true, completion: nil)
    }
}


