//
//  hahaha.swift
//  testFOrSswisft
//
//  Created by apple on 16/6/22.
//  Copyright © 2016年 orange. All rights reserved.
//

import UIKit


class hahaha: UIView {
    
    let WIDTH  = UIScreen.main.bounds.size.width;
    let HEIGHT = UIScreen.main.bounds.size.height;
    
    var chendaRef : CTFrame?
    var length : NSInteger?
    
    override func draw(_ rect: CGRect) {
        // Drawing code
        
        super.draw(rect)
        
        // 步骤1：得到当前用于绘制画布的上下文，用于后续将内容绘制在画布上
        let  context  = UIGraphicsGetCurrentContext()
        // 步骤2：翻转当前的坐标系
        let transform = CGAffineTransform(a: 1, b: 0, c: 0, d: -1, tx: 0, ty:self.bounds.height)
        context?.concatenate(transform)
        //步骤3：创建需要绘制的文字及属性
        let str = NSMutableAttributedString(string: "系统相机类UIImagePickerController\nsourceType: UIImagePickerControllerSourceType\n相机类型\n1)UIImagePickerControllerSourceType.Camera\n相机\n2)UIImagePickerControllerSourceType.PhotoLibrary\n图片库\n3)UIImagePickerControllerSourceType.PhotoLibrary.SavedPhotosAlbum\n保存相册\nisSourceTypeAvailable(sourceType:)->Bool\n判断设备是否支持相应相机类型\navailableMediaTypesForSourceType(sourceType:)->[String]\n返回相应相机类型支持的媒体类型\n相机          图片库          保存相册\nmediaTypes: [String] 设定媒体类型(默认照相)\n[kUTTypeImage]\n照相\n[kUTTypeMovie]\n摄像\n[kUTTypeImage,kUTTypeMovie]\n照相加摄像\n更多Img属性\n更多Mov属性\n具体使用自行百度- -\nallowsEditing:Bool\n拍照后照片是否可编辑\ntrue                    false\nvideoMaximumDuration:NSTimeInterval\n最大摄像时间\n10                    5\nvideoQuality:UIImagePickerControllerQualityType\n摄像画面质量\nTypeHigh     高等质量\n\nTypeMedium     中等质量(适合wifi传输)\n\nTypeLow     低等质量(适合蜂窝网络传输\n\nType640x480     640×480 VGA\n\nTypeIFrame1280x720     1280×720 iFrame\n\nTypeIFrame960x540     960×540 iFrame\ntakePicture()\n照相\nstartVideoCapture()-> Bool\n摄像开始(返回是否成功)\nstopVideoCapture()\n摄像停止\nUIImagePickerControllerDelegate\n像头协议\nfunc imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject])\n结束(照相,摄像)事件\nfunc imagePickerControllerDidCancel(picker: UIImagePickerController)\n取消(照相,摄像)事件\nNotes:\n需要引入MobileCoreServices.framework\nimport MobileCoreServices\nPHPhotoLibrary操作媒体存储\nPHPhotoLibrary.sharedPhotoLibrary().performChanges(PHAssetChangeRequest.creationRequestForAssetFromImage)\n存储图片(import Photos)\nUIImagePickerController.delegate协议指针包含两个协议\nUINavigationControllerDelegate\nUIImagePickerControllerDelegate\n自定义相机\n#import <AVFoundation/AVFoundation.h>\nAVCaptureFileOutputRecordingDelegate\n使用AVCaptureVideoPreviewLayer(CALayer)中添加\nAVCaptureSession中设置(addInput)AVCaptureDeviceInput\n(绑定AVCaptureDevice)\n和(addOutput)AVCaptureMovieFileOutput\ncaptureOutput...didStartRecordingToOutputFileAtURL协议方法开始录制\ncaptureOutput...didFinishRecordingToOutputFileAtURL\n协议方法停止录制\n以上为基本使用,高端请自行查阅相关API")
        length = str.length
        // 设置文字包括字体大小和字体
        // 总体
        str.addAttribute(kCTFontAttributeName as String, value: UIFont.systemFont(ofSize: 16), range: NSMakeRange(0, str.length))
        // 标题
        str.addAttribute(kCTFontAttributeName as String, value: UIFont.boldSystemFont(ofSize: 20), range:NSMakeRange(0, 29))
        str.addAttribute(NSForegroundColorAttributeName, value: UIColor.red, range: NSMakeRange(0, 29))
        // sourceType
        str.addAttribute(NSForegroundColorAttributeName, value: UIColor.blue, range: NSMakeRange(29, 249-29))
        str.addAttribute(NSForegroundColorAttributeName, value: UIColor.white, range: NSMakeRange(123, 2))
        str.addAttribute(NSUnderlineStyleAttributeName, value: NSUnderlineStyle.styleSingle.rawValue, range: NSMakeRange(123, 2))
        str.addAttribute(kCTFontAttributeName as String, value: UIFont.boldSystemFont(ofSize: 24), range: NSMakeRange(123, 2))
        str.addAttribute(NSForegroundColorAttributeName, value: UIColor.white, range: NSMakeRange(175, 3))
        str.addAttribute(kCTFontAttributeName as String, value: UIFont.boldSystemFont(ofSize: 24), range: NSMakeRange(175, 3))
        str.addAttribute(NSUnderlineStyleAttributeName, value: NSUnderlineStyle.styleSingle.rawValue, range: NSMakeRange(175, 3))
        str.addAttribute(NSForegroundColorAttributeName, value: UIColor.white, range: NSMakeRange(245, 4))
        str.addAttribute(kCTFontAttributeName as String, value: UIFont.boldSystemFont(ofSize: 24), range: NSMakeRange(245, 4))
        str.addAttribute(NSUnderlineStyleAttributeName, value: NSUnderlineStyle.styleSingle.rawValue, range: NSMakeRange(245, 4))
        //
        str.addAttribute(NSForegroundColorAttributeName, value: UIColor.purple, range: NSMakeRange(250, 305-250))
        //
        str.addAttribute(NSForegroundColorAttributeName, value: UIColor.blue, range: NSMakeRange(306, 377-306))
        str.addAttribute(NSForegroundColorAttributeName, value: UIColor.white, range: NSMakeRange(378, 2))
        str.addAttribute(NSUnderlineStyleAttributeName, value: NSUnderlineStyle.styleSingle.rawValue, range: NSMakeRange(378, 2))
        str.addAttribute(kCTFontAttributeName as String, value: UIFont.boldSystemFont(ofSize: 24), range: NSMakeRange(378, 2))
        str.addAttribute(NSForegroundColorAttributeName, value: UIColor.white, range: NSMakeRange(390, 3))
        str.addAttribute(NSUnderlineStyleAttributeName, value: NSUnderlineStyle.styleSingle.rawValue, range: NSMakeRange(390, 3))
        str.addAttribute(kCTFontAttributeName as String, value: UIFont.boldSystemFont(ofSize: 24), range: NSMakeRange(390, 3))
        str.addAttribute(NSForegroundColorAttributeName, value: UIColor.white, range: NSMakeRange(403, 4))
        str.addAttribute(NSUnderlineStyleAttributeName, value: NSUnderlineStyle.styleSingle.rawValue, range: NSMakeRange(403, 4))
        str.addAttribute(kCTFontAttributeName as String, value: UIFont.boldSystemFont(ofSize: 24), range: NSMakeRange(403, 4))
        //
        str.addAttribute(NSForegroundColorAttributeName, value: UIColor.purple, range: NSMakeRange(408, 539-408))
        str.addAttribute(NSForegroundColorAttributeName, value: UIColor.white, range: NSMakeRange(457, 2))
        str.addAttribute(NSUnderlineStyleAttributeName, value: NSUnderlineStyle.styleSingle.rawValue, range: NSMakeRange(457, 2))
        str.addAttribute(kCTFontAttributeName as String, value: UIFont.boldSystemFont(ofSize: 24), range: NSMakeRange(457, 2))
        str.addAttribute(NSForegroundColorAttributeName, value: UIColor.white, range: NSMakeRange(475, 2))
        str.addAttribute(NSUnderlineStyleAttributeName, value: NSUnderlineStyle.styleSingle.rawValue, range: NSMakeRange(475, 2))
        str.addAttribute(kCTFontAttributeName as String, value: UIFont.boldSystemFont(ofSize: 24), range: NSMakeRange(475, 2))
        str.addAttribute(NSForegroundColorAttributeName, value: UIColor.white, range: NSMakeRange(506, 5))
        str.addAttribute(NSUnderlineStyleAttributeName, value: NSUnderlineStyle.styleSingle.rawValue, range: NSMakeRange(506, 5))
        str.addAttribute(kCTFontAttributeName as String, value: UIFont.boldSystemFont(ofSize: 24), range: NSMakeRange(506, 5))
        //
        str.addAttribute(NSForegroundColorAttributeName, value: UIColor.blue, range: NSMakeRange(540, 599-540))
        str.addAttribute(NSForegroundColorAttributeName, value: UIColor.white, range: NSMakeRange(570, 4))
        str.addAttribute(NSUnderlineStyleAttributeName, value: NSUnderlineStyle.styleSingle.rawValue, range: NSMakeRange(570, 4))
        str.addAttribute(kCTFontAttributeName as String, value: UIFont.boldSystemFont(ofSize: 24), range: NSMakeRange(570, 4))
        str.addAttribute(NSForegroundColorAttributeName, value: UIColor.white, range: NSMakeRange(594, 5))
        str.addAttribute(NSUnderlineStyleAttributeName, value: NSUnderlineStyle.styleSingle.rawValue, range: NSMakeRange(594, 5))
        str.addAttribute(kCTFontAttributeName as String, value: UIFont.boldSystemFont(ofSize: 24), range: NSMakeRange(594, 5))
        //
        str.addAttribute(NSForegroundColorAttributeName, value: UIColor.purple, range: NSMakeRange(600, 666-600))
        str.addAttribute(NSForegroundColorAttributeName, value: UIColor.white, range: NSMakeRange(643, 2))
        str.addAttribute(NSUnderlineStyleAttributeName, value: NSUnderlineStyle.styleSingle.rawValue, range: NSMakeRange(643, 2))
        str.addAttribute(kCTFontAttributeName as String, value: UIFont.boldSystemFont(ofSize: 24), range: NSMakeRange(643, 2))
        str.addAttribute(NSForegroundColorAttributeName, value: UIColor.white, range: NSMakeRange(665, 1))
        str.addAttribute(NSUnderlineStyleAttributeName, value: NSUnderlineStyle.styleSingle.rawValue, range: NSMakeRange(665, 1))
        str.addAttribute(kCTFontAttributeName as String, value: UIFont.boldSystemFont(ofSize: 24), range: NSMakeRange(665, 1))
        //
        str.addAttribute(NSForegroundColorAttributeName, value: UIColor.blue, range: NSMakeRange(667, 904-667))
        str.addAttribute(NSForegroundColorAttributeName, value: UIColor.white, range: NSMakeRange(722, 8))
        str.addAttribute(NSUnderlineStyleAttributeName, value: NSUnderlineStyle.styleSingle.rawValue, range: NSMakeRange(722, 8))
        str.addAttribute(kCTFontAttributeName as String, value: UIFont.boldSystemFont(ofSize: 24), range: NSMakeRange(722, 8))
        str.addAttribute(NSForegroundColorAttributeName, value: UIColor.white, range: NSMakeRange(741, 10))
        str.addAttribute(NSUnderlineStyleAttributeName, value: NSUnderlineStyle.styleSingle.rawValue, range: NSMakeRange(741, 10))
        str.addAttribute(kCTFontAttributeName as String, value: UIFont.boldSystemFont(ofSize: 24), range: NSMakeRange(741, 10))
        str.addAttribute(NSForegroundColorAttributeName, value: UIColor.white, range: NSMakeRange(772, 8))
        str.addAttribute(NSUnderlineStyleAttributeName, value: NSUnderlineStyle.styleSingle.rawValue, range: NSMakeRange(772, 8))
        str.addAttribute(kCTFontAttributeName as String, value: UIFont.boldSystemFont(ofSize: 24), range: NSMakeRange(772, 8))
        str.addAttribute(NSForegroundColorAttributeName, value: UIColor.white, range: NSMakeRange(799, 11))
        str.addAttribute(NSUnderlineStyleAttributeName, value: NSUnderlineStyle.styleSingle.rawValue, range: NSMakeRange(799, 11))
        str.addAttribute(kCTFontAttributeName as String, value: UIFont.boldSystemFont(ofSize: 24), range: NSMakeRange(799, 11))
        str.addAttribute(NSForegroundColorAttributeName, value: UIColor.white, range: NSMakeRange(828, 18))
        str.addAttribute(NSUnderlineStyleAttributeName, value: NSUnderlineStyle.styleSingle.rawValue, range: NSMakeRange(828, 18))
        str.addAttribute(kCTFontAttributeName as String, value: UIFont.boldSystemFont(ofSize: 24), range: NSMakeRange(828, 18))
        str.addAttribute(NSForegroundColorAttributeName, value: UIColor.white, range: NSMakeRange(868, 17))
        str.addAttribute(NSUnderlineStyleAttributeName, value: NSUnderlineStyle.styleSingle.rawValue, range: NSMakeRange(868, 17))
        str.addAttribute(kCTFontAttributeName as String, value: UIFont.boldSystemFont(ofSize: 24), range: NSMakeRange(868, 17))
        //
        str.addAttribute(NSForegroundColorAttributeName, value: UIColor.purple, range: NSMakeRange(905, 921-905))
        //
        str.addAttribute(NSForegroundColorAttributeName, value: UIColor.blue, range: NSMakeRange(922, 962-922))
        //
        str.addAttribute(NSForegroundColorAttributeName, value: UIColor.purple, range: NSMakeRange(962, 985-962))
        //
        str.addAttribute(NSForegroundColorAttributeName, value: UIColor.blue, range: NSMakeRange(986, 1022-986))
        //
        str.addAttribute(NSForegroundColorAttributeName, value: UIColor.purple, range: NSMakeRange(1023, 1152-1023))
        //
        str.addAttribute(NSForegroundColorAttributeName, value: UIColor.blue, range: NSMakeRange(1153, 1233-1153))
        //
        str.addAttribute(NSForegroundColorAttributeName, value: UIColor.purple, range: NSMakeRange(1234, 1300-1234))
        //
        str.addAttribute(NSForegroundColorAttributeName, value: UIColor.blue, range: NSMakeRange(1300, 1552-1300))
        //
        str.addAttribute(NSForegroundColorAttributeName, value: UIColor.purple, range: NSMakeRange(1553, 1922-1553))
        
        let imageName = "CD.jpg"

        //步骤4：创建绘制区域 ，就是在self.bounds中以何种方式展示，
        let path = CGMutablePath()
        //不同的绘制方法
        let dummyTransform = CGAffineTransform.identity
        path.addRect(self.bounds, transform: dummyTransform)
//                CGPathAddRect(path, nil, self.bounds)
//        CGPathAddEllipseInRect(path, nil, self.bounds);
//        
//        var imageCallback : CTRunDelegateCallbacks = CTRunDelegateCallbacks(version: kCTRunDelegateVersion1 ,dealloc: { (refCon) -> Void in
//            NSLog("RunDelegate dealloc")
//            }, getAscent: { ( refCon) -> CGFloat in
//                let imageName = "CD.jpg"
//                refCon.initialize()
//                let image = UIImage(named: imageName)
//                return image!.size.height
//            }, getDescent: { (refCon) -> CGFloat in
//                return 0
//        }) { (refCon) -> CGFloat in
//            
//            let imageName = String("CD.jpg")
//            let image = UIImage(named: imageName)
//            return image!.size.width
//        }
        
        // 7.2设置CTRun的代理(图片处理)
//        let runDelegate = CTRunDelegateCreate(&imageCallback,&imageName)
//        let imageAttributedString = NSMutableAttributedString(string: " ");//空格用于给图片留位置
//        imageAttributedString.addAttribute(kCTRunDelegateAttributeName as String, value: runDelegate!, range: NSMakeRange(0, 1))
//        imageAttributedString.addAttribute("imageName", value: imageName, range: NSMakeRange(0, 1))//添加属性，在CTRun中可以识别出这个字符是图片
//        str.insertAttributedString(imageAttributedString, atIndex: 12)
        
        //步骤5：根据AttributedString生成CTFramesetterRef
        let frameSetter = CTFramesetterCreateWithAttributedString(str)
        let ctFrame = CTFramesetterCreateFrame(frameSetter, CFRangeMake(0,0), path, nil)
        chendaRef = ctFrame
        
        //步骤6：绘制除图片以外的部分
        CTFrameDraw(ctFrame, context!)
        //7.3处理绘制图片逻辑
        let lines = CTFrameGetLines(ctFrame) as NSArray //存取frame中的ctlines
        
        NotificationCenter.default.post(name: Notification.Name(rawValue: "CAMERA"), object: lines.count)
        
        let nsLinesArray: NSArray = CTFrameGetLines(ctFrame) // Use NSArray to bridge to Array
        let ctLinesArray = nsLinesArray as Array
        var originsArray = [CGPoint](repeating: CGPoint.zero, count: ctLinesArray.count)
        
        let range: CFRange = CFRangeMake(0, 0)
        CTFrameGetLineOrigins(ctFrame, range,&originsArray)
        
        //7.2把ctFrame里每一行的初始坐标写到数组里
        //        CTFrameGetLineOrigins(ctFrame, CFRangeMake(0, 0), &origunsArray);
        
        // 7.3遍历CTRun找出图片所在的CTRun并进行绘制,每一行可能有多个
        for i in 0..<lines.count{
            //遍历每一行CTLine
            let line = lines[i]
            var lineAscent = CGFloat()
            var lineDescent = CGFloat()
            var lineLeading = CGFloat()
            CTLineGetTypographicBounds(line as! CTLine, &lineAscent, &lineDescent, &lineLeading)
            
            
            let runs = CTLineGetGlyphRuns(line as! CTLine) as NSArray
            for j in 0..<runs.count{
                // 遍历每一个CTRun
                var  runAscent = CGFloat()
                var  runDescent = CGFloat()
                let  lineOrigin = originsArray[i]// 获取该行的初始坐标
                
                let run = runs[j] // 获取当前的CTRun
                let attributes = CTRunGetAttributes(run as! CTRun) as NSDictionary
                let width =  CGFloat( CTRunGetTypographicBounds(run as! CTRun, CFRangeMake(0,0), &runAscent, &runDescent, nil))

                // 这一段可参考Nimbus的NIAttributedLabel
                let  runRect = CGRect(x: lineOrigin.x + CTLineGetOffsetForStringIndex(line as! CTLine, CTRunGetStringRange(run as! CTRun).location, nil), y: lineOrigin.y - runDescent, width: width, height: runAscent + runDescent)
                let  imageNames = attributes.object(forKey: "imageName")
                if imageNames is NSString {
                    let image = UIImage(named: imageName as String)
                    let  imageDrawRect = CGRect(x: runRect.origin.x, y: lineOrigin.y, width: (image?.size.width)!, height: (image?.size.height)!)
                    
                    context?.draw(image!.cgImage!, in: imageDrawRect)
                    
                }
            }
        }
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch : UITouch = (touches as NSSet).anyObject() as! UITouch
        let p : CGPoint = touch.location(in: self)
        print("(\(p.x)   \(p.y))");
        let pp = CGPoint(x: p.x, y: self.bounds.size.height - p.y)
        self.clickOnPoint(pp)
    }
    
    
    func clickOnPoint(_ location : CGPoint){
        let lines : NSArray? = CTFrameGetLines(chendaRef!) as NSArray
        
        var ranges = Array<CFRange>(repeating: CFRange(location: 0 , length: 0),count: lines!.count)
        var origins = Array<CGPoint>(repeating: CGPoint(x: 0, y: 0),count: lines!.count)
        CTFrameGetLineOrigins(chendaRef!, CFRangeMake(0, 0), &origins)
        for i in 0..<lines!.count {
            let line : CTLine = lines![i] as! CTLine
            let range : CFRange = CTLineGetStringRange(line)
            ranges[i] = range
        }

        for i in 0..<length! {
            
            var lineNum : Int?
            
            for j in 0..<lines!.count {
                let range = ranges[j]
                let maxLoc = range.location + range.length-1
                if i <= maxLoc {
                    lineNum = j
                    break
                }
            }
            
            if (lineNum == nil) {
                print("小屏幕 没有点击到文字");
                return
            }
            let line : CTLine = lines![lineNum!] as! CTLine
            let origin : CGPoint = origins[lineNum!]
            let CTRunFrame = self.frameForCTRunWithIndex(i, line: line, origin: origin)
            if CTRunFrame.contains(location) {
                print("点击到了第\(i+1)个字符,位于第\(lineNum!+1)行")
                if (i>=123) && (i<=124) {
                    NotificationCenter.default.post(name: Notification.Name(rawValue: "CAMERA"), object: "openCamera")
                }
                if (i>=175)&&(i<=178) {
                    NotificationCenter.default.post(name: Notification.Name(rawValue: "CAMERA"), object: "openPhotoLibrary")
                }
                if (i>=245)&&(i<=249) {
                    NotificationCenter.default.post(name: Notification.Name(rawValue: "CAMERA"), object: "openSavedPhotosAlbum")
                }
                if (i>=378)&&(i<=379) {
                    NotificationCenter.default.post(name: Notification.Name(rawValue: "CAMERA"), object: "returnCameraMediaTypes")
                }
                if (i>=390)&&(i<=393) {
                    NotificationCenter.default.post(name: Notification.Name(rawValue: "CAMERA"), object: "returnPhotoLibraryMediaTypes")
                }
                if (i>=403)&&(i<=407) {
                    NotificationCenter.default.post(name: Notification.Name(rawValue: "CAMERA"), object: "returnSavedPhotosAlbumMediaTypes")
                }
                if (i>=457)&&(i<=459) {
                    NotificationCenter.default.post(name: Notification.Name(rawValue: "CAMERA"), object: "returnopenCamera")
                }
                if (i>=475)&&(i<=477){
                    NotificationCenter.default.post(name: Notification.Name(rawValue: "CAMERA"), object: "returnopenVideo")
                }
                if (i>=506)&&(i<=511) {
                    NotificationCenter.default.post(name: Notification.Name(rawValue: "CAMERA"), object: "returnopenCameraAndVideo")
                }
                if (i>=570)&&(i<=574) {
                    NotificationCenter.default.post(name: Notification.Name(rawValue: "CAMERA"), object: "allowsEditing")
                }
                if (i>=594)&&(i<=599) {
                    NotificationCenter.default.post(name: Notification.Name(rawValue: "CAMERA"), object: "NotallowsEditing")
                }
                if (i>=643)&&(i<=644) {
                    NotificationCenter.default.post(name: Notification.Name(rawValue: "CAMERA"), object: "videoMaximumDuration10")
                }
                if i==665 {
                    NotificationCenter.default.post(name: Notification.Name(rawValue: "CAMERA"), object: "videoMaximumDuration5")
                }
                if (i>=722)&&(i<=730) {
                    NotificationCenter.default.post(name: Notification.Name(rawValue: "CAMERA"), object: "TypeHigh")
                }
                if (i>=741)&&(i<=751) {
                    NotificationCenter.default.post(name: Notification.Name(rawValue: "CAMERA"), object: "TypeMedium")
                }
                if (i>=772)&&(i<=780) {
                    NotificationCenter.default.post(name: Notification.Name(rawValue: "CAMERA"), object: "TypeLow")
                }
                if (i>=799)&&(i<=810) {
                    NotificationCenter.default.post(name: Notification.Name(rawValue: "CAMERA"), object: "Type640")
                }
                if (i>=828)&&(i<=846) {
                    NotificationCenter.default.post(name: Notification.Name(rawValue: "CAMERA"), object: "TypeIFrame1280")
                }
                if (i>=868)&&(i<=885) {
                    NotificationCenter.default.post(name: Notification.Name(rawValue: "CAMERA"), object: "TypeIFrame960")
                }
                
                return
            }
        }
        print("没有点击到文字")
    }
    
    func frameForCTRunWithIndex(_ index : NSInteger,line : CTLine,origin : CGPoint)->CGRect{
        
        var offsetX  = CTLineGetOffsetForStringIndex(line, index, nil)
        var offsexX2 = CTLineGetOffsetForStringIndex(line, index+1, nil)
        offsetX  += origin.x
        offsexX2 += origin.x
        let offsetY = origin.y
        var lineAscent : CGFloat = 0
        var lineDescent : CGFloat = 0
        let runs : NSArray = CTLineGetGlyphRuns(line)
        var runCurrent : CTRun?
        for k in 0..<runs.count {
            let run : CTRun = runs[k] as! CTRun
            let range  : CFRange = CTRunGetStringRange(run)
            let rangeOC : NSRange = NSMakeRange(range.location, range.length)
  
            if self.isIndex(index, range: rangeOC) {
                runCurrent = run
                break
            }
            
        }
        CTRunGetTypographicBounds(runCurrent!, CFRangeMake(0, 0), &lineAscent, &lineDescent, nil);
        let height : CGFloat = lineAscent + lineDescent;
        return CGRect(x: offsetX, y: offsetY, width: offsexX2 - offsetX, height: height);
        
    }
    
    func isIndex(_ index : NSInteger,range : NSRange)->Bool{
        if (index <= range.location + range.length-1)&&(index >= range.location) {
            return true
        }
        return false
    }
    
    
    

}
