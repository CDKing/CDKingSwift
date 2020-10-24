//
//  ViewController.swift
//  testFOrSswisft
//
//  Created by apple on 16/6/22.
//  Copyright © 2016年 orange. All rights reserved.
//

import UIKit
import MobileCoreServices
import Photos

class CameraVC: UIViewController ,UINavigationControllerDelegate,UIImagePickerControllerDelegate{

    let WIDTH  = UIScreen.main.bounds.size.width;
    let HEIGHT = UIScreen.main.bounds.size.height;
    var kk : hahaha?
    var scroll : UIScrollView?
    var systemCamera : UIImagePickerController?
    var btnn : UIButton?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        kk = hahaha()
        
        btnn = UIButton.init(frame: CGRect(x: WIDTH-50, y: 20, width: 50, height: 20))
        btnn?.setTitle("返回", for: UIControlState())
        btnn?.layer.cornerRadius = 5
        btnn?.backgroundColor = UIColor.blue
        btnn?.addTarget(self, action: #selector(self.dismissViewC), for: UIControlEvents.touchDown)
        
        
        if HEIGHT<=500 {
            kk!.frame = CGRect(x: 0, y: 0, width: WIDTH, height: HEIGHT+1600)
        }
        if HEIGHT<=600 && HEIGHT>=550 {
            kk!.frame = CGRect(x: 0, y: 0, width: WIDTH, height: HEIGHT+1500)
        }
        if HEIGHT<=700 && HEIGHT>=600 {
            kk!.frame = CGRect(x: 0, y: 0, width: WIDTH, height: HEIGHT+1200)
        }
        if HEIGHT>700 {
            kk!.frame = CGRect(x: 0, y: 0, width: WIDTH, height: HEIGHT+1000)
        }
        
        kk!.backgroundColor = UIColor.lightGray
        
        scroll = UIScrollView(frame: CGRect(x: 0, y: 20, width: WIDTH, height: HEIGHT))
        scroll!.addSubview(kk!)
        scroll!.contentSize = CGSize(width: kk!.frame.width, height: kk!.frame.height+20)
        self.view.addSubview(scroll!)
        self.view.addSubview(btnn!)
        
        systemCamera = UIImagePickerController.init()
        systemCamera!.delegate = self
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.reveiceObserver(_:)), name: NSNotification.Name(rawValue: "CAMERA"), object: nil)
    }
    
    @objc func dismissViewC(){
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func reveiceObserver(_ commond : Notification){
        let any = commond.object
        print("\((any as AnyObject).classForCoder)");
        if (any as AnyObject).classForCoder == NSNumber.classForCoder() {
            
            return
        }
        let str : NSString = commond.object as! NSString
        print("CAMERA     ->   \(str)")
        if str.isEqual(to: "openCamera") {
            systemCamera?.sourceType = UIImagePickerControllerSourceType.camera
            self.present(systemCamera!, animated: true, completion: nil)
        }
        if str.isEqual(to: "openPhotoLibrary") {
            systemCamera?.sourceType = UIImagePickerControllerSourceType.photoLibrary
            self.present(systemCamera!, animated: true, completion: nil)
        }
        if str.isEqual(to: "openSavedPhotosAlbum") {
            systemCamera?.sourceType = UIImagePickerControllerSourceType.savedPhotosAlbum
            self.present(systemCamera!, animated: true, completion: nil)
        }
        if str.isEqual(to: "returnCameraMediaTypes") {
            let xx : NSArray = UIImagePickerController.availableMediaTypes(for: UIImagePickerControllerSourceType.camera)! as NSArray
            let alert : UIAlertController = UIAlertController.init(title: "Camera", message: "\(xx)", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction.init(title: "OK", style: UIAlertActionStyle.cancel, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        if str.isEqual(to: "returnPhotoLibraryMediaTypes") {
            let xx : NSArray = UIImagePickerController.availableMediaTypes(for: UIImagePickerControllerSourceType.photoLibrary)! as NSArray
            let alert : UIAlertController = UIAlertController.init(title: "PhotoLibrary", message: "\(xx)", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction.init(title: "OK", style: UIAlertActionStyle.cancel, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        if str.isEqual(to: "returnSavedPhotosAlbumMediaTypes") {
            let xx : NSArray = UIImagePickerController.availableMediaTypes(for: UIImagePickerControllerSourceType.savedPhotosAlbum)! as NSArray
            let alert : UIAlertController = UIAlertController.init(title: "SavedPhotosAlbum", message: "\(xx)", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction.init(title: "OK", style: UIAlertActionStyle.cancel, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        if str.isEqual(to: "returnopenCamera") {
            systemCamera?.sourceType = UIImagePickerControllerSourceType.camera
            systemCamera?.mediaTypes = [kUTTypeImage as String]
            self.present(systemCamera!, animated: true, completion: nil)
        }
        if str.isEqual(to: "returnopenVideo") {
            systemCamera?.sourceType = UIImagePickerControllerSourceType.camera
            systemCamera?.mediaTypes = [kUTTypeMovie as String]
            self.present(systemCamera!, animated: true, completion: nil)
        }
        if str.isEqual(to: "returnopenCameraAndVideo") {
            systemCamera?.sourceType = UIImagePickerControllerSourceType.camera
            systemCamera?.mediaTypes = [kUTTypeImage as String,kUTTypeMovie as String]
            self.present(systemCamera!, animated: true, completion: nil)
        }
        if str.isEqual(to: "allowsEditing") {
            systemCamera?.sourceType = UIImagePickerControllerSourceType.camera
            systemCamera?.mediaTypes = [kUTTypeImage as String]
            systemCamera?.allowsEditing = true
            self.present(systemCamera!, animated: true, completion: nil)
        }
        if str.isEqual(to: "NotallowsEditing") {
            systemCamera?.sourceType = UIImagePickerControllerSourceType.camera
            systemCamera?.mediaTypes = [kUTTypeImage as String]
            systemCamera?.allowsEditing = false
            self.present(systemCamera!, animated: true, completion: nil)
        }
        if str.isEqual(to: "videoMaximumDuration10") {
            systemCamera?.sourceType = UIImagePickerControllerSourceType.camera
            systemCamera?.mediaTypes = [kUTTypeMovie as String]
            systemCamera?.videoMaximumDuration = 10;
            self.present(systemCamera!, animated: true, completion: nil)
        }
        if str.isEqual(to: "videoMaximumDuration5") {
            systemCamera?.sourceType = UIImagePickerControllerSourceType.camera
            systemCamera?.mediaTypes = [kUTTypeMovie as String]
            systemCamera?.videoMaximumDuration = 5;
            self.present(systemCamera!, animated: true, completion: nil)
        }
        if str.isEqual(to: "TypeHigh") {
            systemCamera?.sourceType = UIImagePickerControllerSourceType.camera
            systemCamera?.mediaTypes = [kUTTypeMovie as String]
            systemCamera?.videoQuality = UIImagePickerControllerQualityType.typeHigh
            self.present(systemCamera!, animated: true, completion: nil)
        }
        if str.isEqual(to: "TypeMedium") {
            systemCamera?.sourceType = UIImagePickerControllerSourceType.camera
            systemCamera?.mediaTypes = [kUTTypeMovie as String]
            systemCamera?.videoQuality = UIImagePickerControllerQualityType.typeMedium
            self.present(systemCamera!, animated: true, completion: nil)
        }
        if str.isEqual(to: "TypeLow") {
            systemCamera?.sourceType = UIImagePickerControllerSourceType.camera
            systemCamera?.mediaTypes = [kUTTypeMovie as String]
            systemCamera?.videoQuality = UIImagePickerControllerQualityType.typeLow
            self.present(systemCamera!, animated: true, completion: nil)
        }
        if str.isEqual(to: "Type640") {
            systemCamera?.sourceType = UIImagePickerControllerSourceType.camera
            systemCamera?.mediaTypes = [kUTTypeMovie as String]
            systemCamera?.videoQuality = UIImagePickerControllerQualityType.type640x480
            self.present(systemCamera!, animated: true, completion: nil)
        }
        if str.isEqual(to: "TypeIFrame1280") {
            systemCamera?.sourceType = UIImagePickerControllerSourceType.camera
            systemCamera?.mediaTypes = [kUTTypeMovie as String]
            systemCamera?.videoQuality = UIImagePickerControllerQualityType.typeIFrame1280x720
            self.present(systemCamera!, animated: true, completion: nil)
        }
        if str.isEqual(to: "TypeIFrame960") {
            systemCamera?.sourceType = UIImagePickerControllerSourceType.camera
            systemCamera?.mediaTypes = [kUTTypeMovie as String]
            systemCamera?.videoQuality = UIImagePickerControllerQualityType.typeIFrame960x540
            self.present(systemCamera!, animated: true, completion: nil)
        }
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let type : NSString = info[UIImagePickerControllerMediaType] as! NSString
        
        let status : PHAuthorizationStatus = PHPhotoLibrary.authorizationStatus()
        if (status == PHAuthorizationStatus.denied) {
//            BSLog(@"用户拒绝当前应用访问相册,我们需要提醒用户打开访问开关");
            let alert : UIAlertController = UIAlertController.init(title: "用户拒绝当前应用访问相册", message: "请手动开取权限", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction.init(title: "OK", style: UIAlertActionStyle.cancel, handler: nil))
            self.present(alert, animated: true, completion: nil)
            return
        }else if (status == PHAuthorizationStatus.restricted){
//            BSLog(@"家长控制,不允许访问");
            let alert : UIAlertController = UIAlertController.init(title: "家长控制", message: "不允许访问", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction.init(title: "OK", style: UIAlertActionStyle.cancel, handler: nil))
            self.present(alert, animated: true, completion: nil)
            return
        }else if (status == PHAuthorizationStatus.notDetermined){
//            BSLog(@"用户还没有做出选择");
        }else if (status == PHAuthorizationStatus.authorized){
//            BSLog(@"用户允许当前应用访问相册");
        }
        
        if type.isEqual(to: "public.image") {
            let img : UIImage = info[UIImagePickerControllerOriginalImage] as! UIImage
            PHPhotoLibrary.shared().performChanges({ 
                PHAssetChangeRequest.creationRequestForAsset(from: img)
                }, completionHandler:  nil)
        }
        if type.isEqual(to: "public.movie") {
            let recordedVideoURL : URL = info[UIImagePickerControllerMediaURL] as! URL
            
            PHPhotoLibrary.shared().performChanges({ 
                PHAssetChangeRequest.creationRequestForAssetFromVideo(atFileURL: recordedVideoURL)
                }, completionHandler: nil)
        }
    }
//    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
//        
//    }
}

