//
//  ViewController.swift
//  FlickrPhotosGallery
//
//  Created by Dipika Bari on 04/03/2022.
//

import UIKit

class ViewController: UIViewController {
    private var viewModel: FlickrViewModel!

    
    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel = FlickrViewModel(view: self)          //initialize viewModel
        viewModel.fetchData()

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
