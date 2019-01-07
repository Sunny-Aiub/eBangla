//
//  CartViewController.swift
//  EBangla
//
//  Created by Sunny Chowdhury on 1/6/19.
//  Copyright © 2019 Sunny Chowdhury. All rights reserved.
//

import UIKit
import TTGSnackbar

class CartViewController: UIViewController , UITableViewDelegate, UITableViewDataSource{

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var lblTotalPrice: UILabel!
    
    var TotalPrice: Int = 0
    var FinalPrice : Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "Cart"
        
        
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        
        self.tableView.rowHeight = 136;
       
        if CartList.count == 0 {
            self.lblTotalPrice.text =  "0.0 Tk"

        }else{
            self.lblTotalPrice.text = String(FinalPrice) + " Tk"

        }

        tableView.reloadData()

    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return CartList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CartListTableViewCell", for: indexPath) as! CartListTableViewCell
        
        let book = CartList[indexPath.row]
        cell.nameLbl.text = book.name
        cell.priceLbl.text = "BDT: " + book.price + "Tk"
        do {
            let url = URL(string:book.image)
            let data = try Data(contentsOf: url!)
            cell.itemImageView.image = UIImage(data: data)
            
        }
        catch{
            print(error)
        }
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let selectedCell:CartListTableViewCell = tableView.cellForRow(at: indexPath as IndexPath)! as! CartListTableViewCell
        selectedCell.IsSelectedImageView.isHidden = false
        selectedCell.IsSelectedImageView.backgroundColor = UIColor.groupTableViewBackground
        selectedCell.IsSelectedImageView.image = UIImage(named: "selected")
        
        let book = CartList[indexPath.row]
        let count: Int = Int( selectedCell.noOfItemLbl.text!) ?? 0
        let price = Int( book.price) ?? 0
        
        TotalPrice = count * price
        FinalPrice += TotalPrice
        
        self.lblTotalPrice.text = String(FinalPrice) + " Tk"
        TotalPrice = 0
        
    }
    
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        
        let selectedCell:CartListTableViewCell = tableView.cellForRow(at: indexPath as IndexPath)! as! CartListTableViewCell
        selectedCell.IsSelectedImageView.backgroundColor = UIColor.groupTableViewBackground
        selectedCell.IsSelectedImageView.image = UIImage(named: "unselected")
        
        let book = CartList[indexPath.row]
        let count: Int = Int( selectedCell.noOfItemLbl.text!) ?? 0
        let price = Int( book.price) ?? 0
        
        TotalPrice = count * price
        FinalPrice -= TotalPrice
        
        self.lblTotalPrice.text = String(FinalPrice) + " Tk"

        if FinalPrice < 0{
            self.lblTotalPrice.text = "0.0 Tk"

        }
    }

    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if (editingStyle == UITableViewCell.EditingStyle.delete) {
            
            let selectedCell:CartListTableViewCell = tableView.cellForRow(at: indexPath as IndexPath)! as! CartListTableViewCell
            
            selectedCell.IsSelectedImageView.backgroundColor = UIColor.groupTableViewBackground
            selectedCell.IsSelectedImageView.image = UIImage(named: "unselected")
            
            let book = CartList[indexPath.row]
            let count: Int = Int( selectedCell.noOfItemLbl.text!) ?? 0
            let price = Int( book.price) ?? 0
            
            TotalPrice = count * price
            FinalPrice -= TotalPrice
            CartList.remove(at: indexPath.row)
            
            if FinalPrice < 0{
                self.lblTotalPrice.text = "0.0 Tk"
                
            }else{
                self.lblTotalPrice.text = String(FinalPrice) + " Tk"

            }

            let snackbar = TTGSnackbar(message: "Item Deleted !", duration: .short)
            snackbar.backgroundColor = UIColor.red
            snackbar.show()
            tableView.reloadData()
            
            
        }
    }
    
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 136
    }

    
    @IBAction func checkOutClicked(_ sender: Any) {
        
        if lblTotalPrice.text == "0.0 Tk"  || lblTotalPrice.text == "0 Tk"{
            
            let snackbar = TTGSnackbar(message: "Click On An ItemA To Go For Check Out", duration: .short)
            snackbar.backgroundColor = UIColor.red
            snackbar.show()
            
        } else {
            
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "CheckOutViewController") as! CheckOutViewController
            //vc.book = book
            self.navigationController?.pushViewController(vc, animated: true)
            
        }
        
    }
    
}
