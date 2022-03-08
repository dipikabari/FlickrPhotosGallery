# FlickrPhotosGallery
search images


Requirements

• Flickr url that should be used is: https://www.flickr.com/services/feeds/docs/photos_public
• Image metadata should be visible for each picture

Optional
• Search for images by tag
• Image caching
• Order by date taken or date published
• Save image to the System Gallery
• Open image in system browser
• Share picture by email

References
• JSON feed documentation: https://www.flickr.com/services/api/response.json.html

Tech Stack 

1. Using MVVM architecture 
2. Applied protocol delegate pattern to communicate b/w viewModel and View 
3. Implemented image caching functionality using NSCache 
4. using Singleton desing pattern. 
5. Used URLSession for Rest API call. 
6. Used Storybaord to create UI. Implemented CollectionView to show Images.
7. Unit tested ViewModel , FlickrViewModel had 91.0% code coverage. 
8. Applied Mocking and Stubbing technique to test netowrk layer. 

  
