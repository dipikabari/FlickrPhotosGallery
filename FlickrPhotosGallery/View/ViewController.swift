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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel = FlickrViewModel(view: self)          //initialize viewModel
        searchImage.delegate = self
    }


}

/* Search bar */
extension ViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        viewModel.fetchData(text: searchText)
        print("search for \(searchText)")
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
