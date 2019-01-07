//
//  WishListViewController.swift
//  EBangla
//
//  Created by Sunny Chowdhury on 1/6/19.
//  Copyright © 2019 Sunny Chowdhury. All rights reserved.
//

import UIKit
import TTGSnackbar

class WishListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "Wish List"
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        self.tableView.rowHeight = 130;

        tableView.reloadData()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return WishList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "WishListTableViewCell", for: indexPath) as! WishListTableViewCell
        
        let book = WishList[indexPath.row]
        cell.nameLbl.text = book.name
        cell.priceLbl.text = "BDT-" + book.price + "Tk"
        do {
            let url = URL(string:book.image)
            let data = try Data(contentsOf: url!)
            cell.bookImageView.image = UIImage(data: data)
            
        }
        catch{
            print(error)
        }
        
        return cell
        
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let book = WishList[indexPath.row]
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "BookDetailsViewController") as! BookDetailsViewController
        vc.book = book
        self.navigationController?.pushViewController(vc, animated: true)
        
    }

    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if (editingStyle == UITableViewCell.EditingStyle.delete) {
           
            WishList.remove(at: indexPath.row)
            let snackbar = TTGSnackbar(message: "Item Deleted !", duration: .short)
            snackbar.backgroundColor = UIColor.red
            snackbar.show()
            tableView.reloadData()
            
            
        }
    }

    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 130
    }
    
}
