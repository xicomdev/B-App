//
//  ProfileVC.swift
//  B-App
//
//  Created by Ankit Chhabra on 9/25/17.
//  Copyright © 2017 Ankit Chhabra. All rights reserved.
//

import UIKit

class ProfileVC: UIViewController {

    @IBOutlet weak var imgvwDP: UIImageView!
    @IBOutlet weak var btnSelectPhoto: UIButton!
    @IBOutlet weak var btnPassword: UIButton!
    @IBOutlet weak var txtfldEmail: UITextField!
    @IBOutlet weak var txtfldPhone: UITextField!
    @IBOutlet weak var txtfldLastName: UITextField!
    @IBOutlet weak var txtfldName: UITextField!
    @IBOutlet weak var btnEdit: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        imgvwDP.layer.cornerRadius = imgvwDP.frame.size.width/2
        txtfldEmail.text = User.me.email
        txtfldName.text = User.me.firstname
        txtfldLastName.text = User.me.lastname
        txtfldPhone.text = User.me.phone_no
        
        setInteractionOff()
        imgvwDP.layer.cornerRadius = imgvwDP.frame.width / 2

    }

    @IBAction func actionEditBtn(_ sender: Any) {
        if btnEdit.title(for: .normal) == "Edit"{
            btnEdit.setTitle("Save", for: .normal)
            setInteractionOn()
        }else {
            btnEdit.setTitle("Edit", for: .normal)
            setInteractionOff()
        }
    }
    
    @IBAction func actionSelectPhoto(_ sender: Any) {
    }
    
    @IBAction func actionBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func actionPasswordBtn(_ sender: Any) {
        self.pushViewController(controllerName: "PasswordVC", storyboardName: profileStoryboard)
    }
    
    func setInteractionOff() {
        txtfldEmail.isUserInteractionEnabled = false
        txtfldName.isUserInteractionEnabled = false
        txtfldLastName.isUserInteractionEnabled = false
        txtfldPhone.isUserInteractionEnabled = false
        btnSelectPhoto.isUserInteractionEnabled = false
    }
    
    func setInteractionOn() {
        txtfldEmail.isUserInteractionEnabled = true
        txtfldName.isUserInteractionEnabled = true
        txtfldLastName.isUserInteractionEnabled = true
        txtfldPhone.isUserInteractionEnabled = true
        btnSelectPhoto.isUserInteractionEnabled = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
