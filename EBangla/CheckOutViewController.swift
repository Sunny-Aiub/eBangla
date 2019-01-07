//
//  CheckOutViewController.swift
//  EBangla
//
//  Created by Sunny Chowdhury on 1/7/19.
//  Copyright © 2019 Sunny Chowdhury. All rights reserved.
//

import UIKit
import TTGSnackbar

class CheckOutViewController: UIViewController {
    
    @IBOutlet weak var txtFullName: UITextField!
    @IBOutlet weak var txtPhoneNumer: UITextField!
    @IBOutlet weak var txtCity: UITextField!
    @IBOutlet weak var txtRegion: UITextField!
    @IBOutlet weak var txtArea: UITextField!
    @IBOutlet weak var txtAddress: UITextField!
    
    @IBOutlet weak var btnConfirm: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Check Out"
        
        btnConfirm.layer.cornerRadius = 10
    }
    
    
    @IBAction func confirmCheckIn(_ sender: Any) {
        
        if
            txtArea.text == "" || txtCity.text == "" || txtRegion.text == "" || txtAddress.text == "" || txtFullName.text == "" || txtPhoneNumer.text == "" {
            
            let snackbar = TTGSnackbar(message: "Fill Up All Info Please !", duration: .short)
            snackbar.backgroundColor = UIColor.red
            snackbar.show()
        }
        else if (txtPhoneNumer.text?.count)! != 11{
            let snackbar = TTGSnackbar(message: "Mobile Number Must Be 11 Digit! ", duration: .short)
            snackbar.backgroundColor = UIColor.red
            snackbar.show()
        }
            
        else{
            
            CartList.removeAll()

            let alert = UIAlertController(title: "Check Out Successful!", message: "We Will Contact With You Soon", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default) {
                UIAlertAction in
                NSLog("OK Pressed")
                self.navigationController?.popToRootViewController(animated: true)

            }
            // Add the actions
            alert.addAction(okAction)
            self.present(alert, animated: true, completion: nil)
            ()
            
        }
        
    }
}
