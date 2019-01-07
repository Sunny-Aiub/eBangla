//
//  BookDetailsViewController.swift
//  EBangla
//
//  Created by Sunny Chowdhury on 1/6/19.
//  Copyright © 2019 Sunny Chowdhury. All rights reserved.
//

import UIKit
import TTGSnackbar

class BookDetailsViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var priceLbl: UILabel!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var authorNameLbl: UILabel!
    @IBOutlet weak var publicationNameLbl: UILabel!
    @IBOutlet weak var categoryNameLbl: UILabel!
    @IBOutlet weak var releaseDateLbl: UILabel!
    @IBOutlet weak var editionLbl: UILabel!
    @IBOutlet weak var btnAddedToWishList: UIButton!
    @IBOutlet weak var btnAddToCartList: UIButton!
    
    var book : Book?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        do {
            let url = URL(string:book?.image ?? "")
            let data = try Data(contentsOf: url!)
            imageView.image = UIImage(data: data)
            
        }
        catch{
            print(error)
        }
        
        priceLbl.text = "BDT: " + (book?.price ?? "0") + "Tk"
        titleLbl.text = book?.name
        authorNameLbl.text = book?.writer
        publicationNameLbl.text = book?.publication
        categoryNameLbl.text = book?.category
        releaseDateLbl.text = book?.releaseDate
        editionLbl.text = book?.edition
        
        for i in 0..<WishList.count {
            
            let bookName = WishList[i].name
            if bookName == book?.name
            {
                self.btnAddedToWishList.setTitle("Wish Listed", for: .normal)
            }
        }
        
    }
    
    @IBAction func addedToWishList(_ sender: Any)
    {

        if self.btnAddedToWishList.currentTitle == "Add To WishList" {
            
            WishList.append(book!)
            self.btnAddedToWishList.setTitle("Wish Listed", for: .normal)
            
            let snackbar = TTGSnackbar(message: "Added To WishList !", duration: .short)
            snackbar.backgroundColor = UIColor.green
            snackbar.show()
        }
        else {
            let snackbar = TTGSnackbar(message: "Already WishListed !", duration: .short)
            snackbar.backgroundColor = UIColor.blue
            snackbar.show()
        }
    }
    
    @IBAction func addToCartList(_ sender: Any) {
        
        
        if self.btnAddToCartList.currentTitle == "Add To Cart" {
            
            
            CartList.append(book!)
            print(CartList)
            self.btnAddToCartList.setTitle("Added To Cart", for: .normal)
            
            let snackbar = TTGSnackbar(message: "Added To Cart !", duration: .short)
            snackbar.backgroundColor = UIColor.green
            snackbar.show()
            
        }
        else {
            
            let snackbar = TTGSnackbar(message: "This Item is Already Added To Cart! Add Multiple From The Cart List", duration: .short)
            snackbar.backgroundColor = UIColor.blue
            snackbar.show()
        }
        
        
    }
    
    

}
