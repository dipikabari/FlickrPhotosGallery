//
//  FlickrPhotosGalleryTests.swift
//  FlickrPhotosGalleryTests
//
//  Created by MAC on 08/03/22.
//

import XCTest
@testable import FlickrPhotosGallery

class FlickrViewModelTests: XCTestCase {

    var viewModel: FlickrViewModel!
    
    override func setUpWithError() throws {
        let vc = PhotoSearchViewController()
        let mockNetwrokManager = MockNetworkManager()
        
        viewModel = FlickrViewModel(delegate: vc, networkManager: mockNetwrokManager)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    
    func testFetchData_success() {
        
        viewModel.fetchData(text: "search_succcess")
        
        
        XCTAssertEqual(viewModel.photosCount, 100)
        
        var url:String? = viewModel.getImageUrl(index: 0)
        
        XCTAssertEqual(url!, "https://live.staticflickr.com/65535/51880456842_bd33d5c1c8_w.jpg")
        
        
         url = viewModel.getImageUrl(index: 101)
        
         XCTAssertNil(url)

    }

    
    func testFetchData_failure() {
        
        viewModel.fetchData(text: "search_failure")
        
        
        XCTAssertEqual(viewModel.photosCount, 0)
        
        let url:String? = viewModel.getImageUrl(index: 0)
        
        XCTAssertNil(url)


    }

}
