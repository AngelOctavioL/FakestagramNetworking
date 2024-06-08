//
//  This file is for educational purposes only. It may contain code snippets, examples, images, and explanations
//  intended to help understand concepts and improve programming skills.
//

import UIKit

class PhotosModel {
    var photos: [Photo]?
    
    func photo(for index: Int) -> Photo? {
        photos?[index]
    }
    
    func getNumberOfPhotos() -> Int {
        photos?.count ?? 0
    }
}

extension PhotosModel {
    func getPhoto() throws {
        guard let url = Bundle.main.url(forResource: "Photos", withExtension: "json"),
              let data = try? Data(contentsOf: url) else { throw UserModelError.fileError }
        let photosDTOs = try [PhotosDTO](data: data)
        photos = photosDTOs.enumerated().map({ (index, photo) in
            if index == 0 {
                Photo(image: .dog1, caption: photo.title)
            } else if index % 2 == 0 {
                Photo(image: .images4, caption: photo.title)
            } else {
                Photo(image: .dog2Jpg, caption: photo.title)
            }
        })
    }
}
