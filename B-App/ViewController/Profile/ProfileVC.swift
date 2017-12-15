//
//  ProfileVC.swift
//  B-App
//
//  Created by Ankit Chhabra on 9/25/17.
//  Copyright © 2017 Ankit Chhabra. All rights reserved.
//

import UIKit

class ProfileVC: UIViewController , UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var imgvwDP: UIImageView!
    @IBOutlet weak var btnSelectPhoto: UIButton!
    @IBOutlet weak var btnPassword: UIButton!
    @IBOutlet weak var txtfldEmail: UITextField!
    @IBOutlet weak var txtfldPhone: UITextField!
    @IBOutlet weak var txtfldLastName: UITextField!
    @IBOutlet weak var txtfldName: UITextField!
    @IBOutlet weak var btnEdit: UIButton!
    
    var ImagePicker = UIImagePickerController()
    var selectedImg : UIImage? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imgvwDP.layer.cornerRadius = imgvwDP.frame.size.width/2
        txtfldEmail.text = User.me.email
        txtfldName.text = User.me.firstname
        txtfldLastName.text = User.me.lastname
        txtfldPhone.text = User.me.phone_no
        
        setInteractionOff()

    }

    override func viewDidLayoutSubviews() {
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
        customActionSheet()
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
    
    //MARK: - Images picker methods
    
    
    func customActionSheet()
    {
        let myActionSheet = UIAlertController()
        
        let galleryAction = UIAlertAction(title: "Gallery", style: .default, handler: {
            (alert: UIAlertAction!) -> Void in
            self.openGallary()
        })
        let cmaeraAction = UIAlertAction(title: "Camera", style: .default, handler: {
            (alert: UIAlertAction!) -> Void in
            self.openCamera()
        })
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: {
            (alert: UIAlertAction!) -> Void in
        })
        
        myActionSheet.addAction(galleryAction)
        myActionSheet.addAction(cmaeraAction)
        myActionSheet.addAction(cancelAction)
        
        self.present(myActionSheet, animated: true, completion: nil)
        
    }
    
    func openCamera(){
        
        DispatchQueue.main.async {
            
            if(UIImagePickerController .isSourceTypeAvailable(UIImagePickerControllerSourceType.camera))  {
                self.ImagePicker.sourceType = UIImagePickerControllerSourceType.camera
                self.ImagePicker.delegate = self
                self.ImagePicker.allowsEditing = false
                self .present(self.ImagePicker, animated: true, completion: nil)
            }
            else {
                let alert = UIAlertController(title: "Alert", message: "Camera is not supported", preferredStyle: UIAlertControllerStyle.alert)
                let okAction = UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil)
                alert.addAction(okAction)
                self.present(alert, animated: true, completion: nil)
            }
        }
    }
    
    func openGallary()
    {
        ImagePicker.delegate = self
        ImagePicker.allowsEditing = true //2
        ImagePicker.sourceType = .photoLibrary //3
        present(ImagePicker, animated: true, completion: nil)
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any])
    {
        DispatchQueue.main.async
            {
                NSLog("info=%@", info)
                if(picker.sourceType == UIImagePickerControllerSourceType.camera)
                {
                    let objImagePick: UIImage = (info[UIImagePickerControllerOriginalImage] as! UIImage)
                    self.selectedImg = resizeImage(objImagePick)
                }
                else
                {
                    let objImagePick: UIImage = (info[UIImagePickerControllerEditedImage] as! UIImage)
                    self.selectedImg = resizeImage(objImagePick)
                }
        }
        picker.dismiss(animated: true, completion: {
            self.uploadProfilePic()
        })
    }
    
    func uploadProfilePic() {
        if selectedImg != nil {
            ApiManager.sharedObj.uploadImage(APi_UploadUserPhoto, param: nil, image: selectedImg!, completion: { (responseDict, isSuccess, errorStr) in
                if isSuccess {
                    showAlert(title: "B-App", message: "Profile picture uploaded successfully", controller: self)
                }else {
                    showAlert(title: "B-App", message: errorStr!, controller: self)
                }
            })
        }
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController)
    {
        self.dismiss(animated: true, completion: nil)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
