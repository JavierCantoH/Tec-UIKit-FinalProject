//
//  CommentsViewController.swift
//  FinalProject
//
//  Created by Luis Javier Canto Hurtado on 25/04/21.
//

import UIKit

class CommentsViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var comments = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Reviews"
        tableView.dataSource = self
    }
    
    @IBAction func loadComments(_ sender: Any) {
        JSONClient.instance.sendRequest(url: "https://my-json-server.typicode.com/JavierCantoH/mockjson/comments")
        { (str, array, error) in
                    if error == nil {
                        DispatchQueue.main.async {
                            self.comments = array
                            self.tableView.reloadData()
                        }
                    }
            }
    }
}


extension CommentsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return comments.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "commentCell", for: indexPath)
        cell.textLabel?.text = comments[indexPath.row]
        return cell
    }
}
