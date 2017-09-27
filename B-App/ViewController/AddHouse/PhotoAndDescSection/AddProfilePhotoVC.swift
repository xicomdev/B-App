//
//  AddProfilePhotoVC.swift
//  B-App
//
//  Created by Ankit Chhabra on 9/8/17.
//  Copyright © 2017 Ankit Chhabra. All rights reserved.
//

import UIKit

class AddProfilePhotoVC: UIViewController , UIImagePickerControllerDelegate, UINavigationControllerDelegate{

    @IBOutlet weak var lblSubTitle: UILabel!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var imgvwPhoto: SetCornerImageView!
    @IBOutlet weak var btnEditPhoto: UIButton!
    @IBOutlet weak var btnAddPhoto: UIButton!
    var ImagePicker = UIImagePickerController()
    var imgSelected = Bool()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imgvwPhoto.cornerRadius = imgvwPhoto.frame.width/2
        if House.newHouse.profilePhoto != nil {
            lblTitle.text = "What should it be?"
            btnEditPhoto.isHidden = false
            imgvwPhoto.image = House.newHouse.profilePhoto
            btnAddPhoto.setTitle("Continue", for: .normal)
            imgSelected = true
        }else
        {
            lblTitle.text = "Add your profile photo"
            btnEditPhoto.isHidden = true
            imgvwPhoto.image = #imageLiteral(resourceName: "foto")
            btnAddPhoto.setTitle("Add photo", for: .normal)
        }
    }

    //MARK: - Buttons actions
    @IBAction func actionBackBtn(_ sender: AnyObject) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func actionSaveExitBtn(_ sender: AnyObject) {
        if imgSelected {
            House.newHouse.profilePhoto = imgvwPhoto.image!
        }
        self.navigationController?.popToRootViewController(animated: true)
    }
    @IBAction func actionContinueBtn(_ sender: AnyObject) {
        if btnAddPhoto.title(for: .normal) == "Add photo"{
            customActionSheet()
        }else
        {
            if imgSelected {
                House.newHouse.profilePhoto = imgvwPhoto.image!
                self.pushViewController(controllerName: "PhoneNumberVC", storyboardName: AddHouseStoryboard)
            }else {
                showAlert(title: "B-App", message: "Please select profile photo", controller: self)
            }
        }
        
    }
    @IBAction func actionEditPhoto(_ sender: Any) {
        customActionSheet()
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
                    self.imgvwPhoto.image = resizeImage(objImagePick)
                }
                else
                {
                    let objImagePick: UIImage = (info[UIImagePickerControllerEditedImage] as! UIImage)
                    self.imgvwPhoto.image = resizeImage(objImagePick)
                }
                self.lblTitle.text = "What should it be?"
                self.btnEditPhoto.isHidden = false
                self.btnAddPhoto.setTitle("Continue", for: .normal)
                self.imgSelected = true

        }
        picker.dismiss(animated: true, completion: {
        })
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
