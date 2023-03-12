//
//  CategoriesViewController.swift
//  FinalProject
//
//  Created by Luis Javier Canto Hurtado on 25/04/21.
//

import UIKit

class CategoriesViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    //array of categories
    var categories = ["Refris", "Lavadoras", "Carpintería","Estufas", "Cerrajería", "Drenaje", "Electricista", "Limpieza"]
    
    func getLayout() -> UICollectionViewLayout {
            let layout:UICollectionViewFlowLayout =  UICollectionViewFlowLayout()

            layout.itemSize = CGSize(width: 150, height: 250)
            layout.sectionInset = UIEdgeInsets(top: 25, left: 25, bottom: 25, right: 25)

            return layout as UICollectionViewLayout

        }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        self.collectionView!.collectionViewLayout = self.getLayout()
    }
}


extension CategoriesViewController: UICollectionViewDelegate, UICollectionViewDataSource   {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "customCell", for: indexPath) as! CustomCollectionViewCell
        cell.nameLabel.text = categories[indexPath.row]
        cell.imageView.image = UIImage(named: categories[indexPath.row])
        cell.imageView.layer.cornerRadius = cell.imageView.bounds.height / 2
        cell.imageView.clipsToBounds = true
//        cell.imageView.layer.cornerRadius = cell.imageView.frame.height / 2
        cell.imageView.contentMode = .scaleAspectFill
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(identifier: "DetailViewController") as? DetailViewController
        vc?.name = categories[indexPath.row]
        self.navigationController?.pushViewController(vc!, animated: true)
    }
}
