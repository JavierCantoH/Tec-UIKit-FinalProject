//
//  DetailViewController.swift
//  FinalProject
//
//  Created by Luis Javier Canto Hurtado on 25/04/21.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var name = ""
    let employers = ["juan", "pedro", "paco", "alejandra"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = name
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension DetailViewController: UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return employers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customCell") as! CustomCellTableViewCell
        
        let employer = employers[indexPath.row]
        cell.employerImg.image = UIImage(named: employer)
        cell.employerLabel.text = employer
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "DetailWorkerViewController") as? DetailWorkerViewController
        vc?.image = UIImage(named: employers[indexPath.row])!
        vc?.name = employers[indexPath.row]
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
}
