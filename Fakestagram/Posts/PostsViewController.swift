//
//  This file is for educational purposes only. It may contain code snippets, examples, images, and explanations
//  intended to help understand concepts and improve programming skills.
//

import UIKit

class PostsViewController: UITableViewController {
    
    private var postsModel = PostsModel()
    
    override init(style: UITableView.Style) {
        super.init(style: style)
        tabBarItem.image = UIImage(systemName: "text.viewfinder")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Post"
        tableView.register(PostCell.self, forCellReuseIdentifier: PostCell.name)
        try? postsModel.getPost()
        tableView.reloadData()
    }

}

extension PostsViewController {
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PostCell.name, for: indexPath) as? PostCell,
            let post = postsModel.post(for: indexPath.section) else { return UITableViewCell () }
        cell.captionedPost = post
        return cell
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        postsModel.getNumberOfPosts()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
}
