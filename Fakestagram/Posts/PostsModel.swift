//
//  This file is for educational purposes only. It may contain code snippets, examples, images, and explanations
//  intended to help understand concepts and improve programming skills.
//

import Foundation

class PostsModel {
    var posts: [Post]?
    
    func post(for index: Int) -> Post? {
        posts?[index]
    }
    
    func getNumberOfPosts() -> Int {
        posts?.count ?? 0
    }
}

extension PostsModel {
    func getPost() throws {
        guard let url = Bundle.main.url(forResource: "Posts", withExtension: "json"),
              let data = try? Data(contentsOf: url) else { throw UserModelError.fileError }
        let postsDTOs = try [PostsDTO](data: data)
        posts = postsDTOs.enumerated().map({ (index, post) in
            Post(title: post.title, body: post.body)
        })
    }
}
