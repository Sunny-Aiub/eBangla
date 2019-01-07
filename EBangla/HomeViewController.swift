//
//  HomeViewController.swift
//  EBangla
//
//  Created by Sunny Chowdhury on 1/6/19.
//  Copyright © 2019 Sunny Chowdhury. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
   
    @IBOutlet weak var CollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "EBangla"
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return Booklist.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionCell", for: indexPath) as! CollectionViewCell
        
        let book = Booklist[indexPath.row]
        
        cell.titleLbl.text = book.name
        cell.priceLbl.text = "BDT-" + book.price + "Tk"
        cell.authorNameLbl.text = book.writer
        
        do {
            let url = URL(string:book.image)
            let data = try Data(contentsOf: url!)
            cell.imageView.image = UIImage(data: data)
            
        }
        catch{
            print(error)
        }
        

        return cell
        
    }
    

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let book = Booklist[indexPath.row]
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "BookDetailsViewController") as! BookDetailsViewController
        vc.book = book
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
}
