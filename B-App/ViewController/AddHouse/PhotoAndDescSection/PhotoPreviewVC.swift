//
//  AddPhoto2VC.swift
//  B-App
//
//  Created by Ankit Chhabra on 9/8/17.
//  Copyright © 2017 Ankit Chhabra. All rights reserved.
//

import UIKit
import DKImagePickerController

class PhotoPreviewVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource , UIImagePickerControllerDelegate, UINavigationControllerDelegate, UICollectionViewDelegateFlowLayout{
    
    @IBOutlet weak var collctnvwImages: UICollectionView!
    @IBOutlet weak var imgVwPreview: UIImageView!
    
    var ImagePicker = UIImagePickerController()
    var pickerController =  DKImagePickerController()
    var assets = [DKAsset]()
    var aryImages = [UIImage]()

    override func viewDidLoad() {
        super.viewDidLoad()

        let nib = UINib(nibName: "AddPhotoCVCell", bundle: nil)
        collctnvwImages.register(nib, forCellWithReuseIdentifier: "AddPhotoCVCell")
        
        aryImages = House.newHouse.aryphotos
        assets = House.newHouse.assets
        imgVwPreview.image = aryImages[0]
        
        collctnvwImages.delegate = self
        collctnvwImages.dataSource = self
    }

    //MARK: - Buttons actions
    @IBAction func actionBackBtn(_ sender: AnyObject) {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    @IBAction func actionAddBtn(_ sender: Any) {
        customActionSheet()
    }
    
    @IBAction func actionOptonsBtn(_ sender: Any) {
    }
    @IBAction func actionPreviewBtn(_ sender: Any) {
    }
    @IBAction func actionContinueBtn(_ sender: AnyObject) {
        House.newHouse.aryphotos = aryImages
        House.newHouse.assets = assets
        self.pushViewController(controllerName: "AddDescVC", storyboardName: AddHouseStoryboard)
    }
    
    //MARK: - Images picker methods
    
    func customActionSheet()
    {
        let myActionSheet = UIAlertController()
        
        let galleryAction = UIAlertAction(title: "Gallery", style: .default, handler: {
            (alert: UIAlertAction!) -> Void in
            self.showImagePicker()
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
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any])
    {
        DispatchQueue.main.async
            {
                NSLog("info=%@", info)
                if(picker.sourceType == UIImagePickerControllerSourceType.camera)
                {
                    let objImagePick: UIImage = (info[UIImagePickerControllerOriginalImage] as! UIImage)
                    self.aryImages.append(resizeImage(objImagePick))
                    
                }
                
        }
        picker.dismiss(animated: true, completion: {
            self.collctnvwImages.reloadData()
        })
    }
    
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController)
    {
        self.dismiss(animated: true, completion: nil)
    }
    
    func showImagePicker() {
        pickerController.defaultSelectedAssets = self.assets
        
        pickerController.didCancel = { ()
            print("didCancel")
        }
        pickerController.didSelectAssets = { [unowned self] (assets: [DKAsset]) in
            self.updateAssets(assets: assets)
        }
        if UI_USER_INTERFACE_IDIOM() == .pad {
            pickerController.modalPresentationStyle = .formSheet
        }
        self.present(pickerController, animated: true) {}
    }
    
    func updateAssets(assets: [DKAsset]) {
        self.assets = assets
        aryImages = []
        for i in 0 ..< assets.count {
            assets[i].fetchOriginalImageWithCompleteBlock({ (image, info) in
                self.aryImages.append(resizeImage(image!))
                
                if i == assets.count - 1 {
                    self.collctnvwImages.reloadData()
                }
            })
        }
    }
    
    //MARK: - Collectionview Methods
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return aryImages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collctnvwImages.dequeueReusableCell(withReuseIdentifier: "AddPhotoCVCell", for: indexPath) as! AddPhotoCVCell
        
        cell.imgVw.image = aryImages[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        imgVwPreview.image = aryImages[indexPath.item]
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collctnvwImages.frame.height, height: collctnvwImages.frame.height)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
