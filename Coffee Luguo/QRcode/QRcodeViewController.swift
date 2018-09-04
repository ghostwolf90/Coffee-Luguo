//
//  QRcodeViewController.swift
//  Coffee Luguo
//
//  Created by Laibit on 2015/9/20.
//  Copyright © 2015年 陳冠宇. All rights reserved.
//

import UIKit
import AVFoundation

class QRcodeViewController: UIViewController, AVCaptureMetadataOutputObjectsDelegate {
    // 初始化
    var userDefult = UserDefaults.standard
    var device : AVCaptureDevice = AVCaptureDevice.default(for: AVMediaType.video)!
    var tempQrcode: String!
    var i:Int = 0
    /*
    //lazy 使用才會產生; input用鏡頭去做接收資料
    lazy var deviceInput : AVCaptureDeviceInput = {
        return AVCaptureDeviceInput(device: self.device, error: nil)
        }()
    */
    
    //輸出，掃瞄到的文字
    var metadataOutput : AVCaptureMetadataOutput = AVCaptureMetadataOutput()
    //當做input & Output 橋樑，開關
    var session : AVCaptureSession = AVCaptureSession()
    
    lazy var previewLayer : AVCaptureVideoPreviewLayer = {
        return AVCaptureVideoPreviewLayer(session: self.session)
        }()
    
    var targetLayer = CALayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        session.addOutput(metadataOutput)
        //session.addInput(deviceInput)
        
        var error:NSError?
        do {
            let captureDevice = AVCaptureDevice.default(for: AVMediaType.video)
            let input = try AVCaptureDeviceInput(device: captureDevice!)
            // Do the rest of your work...
            session.addInput(input as AVCaptureInput)
        } catch let error as NSError {
            // Handle any errors
            print(error)
        }
        
        metadataOutput.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
        metadataOutput.metadataObjectTypes = [AVMetadataObject.ObjectType.face]
        previewLayer.frame = view.bounds
        view.layer.insertSublayer(previewLayer, at: 0)
        targetLayer.frame = view.bounds
        view.layer.addSublayer(targetLayer)
        
        //開始做掃描
        session.startRunning()
    }

    func clearTargetLayer(){
        if targetLayer.sublayers != nil{
            for sublayer in targetLayer.sublayers!{
                sublayer.removeFromSuperlayer()
            }
        }
    }
    
    func captureOutput(captureOutput: AVCaptureOutput!, didOutputMetadataObjects metadataObjects: [AnyObject]!, fromConnection connection: AVCaptureConnection!) {
        
        clearTargetLayer()
        
        for current in metadataObjects{
            if var readableCodeObject = current as? AVMetadataMachineReadableCodeObject{
                readableCodeObject = previewLayer.transformedMetadataObject(for: readableCodeObject)as! AVMetadataMachineReadableCodeObject
                showDetectedObjects(codeObject: readableCodeObject)
                
                let scanCodeOutput = readableCodeObject.stringValue
                tempQrcode = readableCodeObject.stringValue
                
                //if scanCodeOutput != nil {
                let alert = UIAlertController(title: "GO!", message: scanCodeOutput, preferredStyle: UIAlertControllerStyle.actionSheet)
                alert.addAction(UIAlertAction(title:"Enter",style:UIAlertActionStyle.default, handler:{(UIAlertAction) -> Void in
                        print("你點擊了確定!")
                        self.showQrcodeToWeb()
                    }))
                self.present(alert, animated: true, completion: nil)
                //}
            }
        }
    }
    
    //to make interface-based adjustments
    //每次你旋转屏幕时都会调用这个方法
//    override func willRotate(to toInterfaceOrientation: UIInterfaceOrientation, duration: TimeInterval) {
//        previewLayer.removeFromSuperlayer()
//        if (toInterfaceOrientation == UIInterfaceOrientation.portrait){
//            previewLayer.connection?.videoOrientation = AVCaptureVideoOrientation.Portrait
//        }else if(toInterfaceOrientation == UIInterfaceOrientation.LandscapeLeft){
//            previewLayer.connection.videoOrientation = AVCaptureVideoOrientation.LandscapeLeft
//        }else if (toInterfaceOrientation == UIInterfaceOrientation.LandscapeRight){
//            previewLayer.connection.videoOrientation = AVCaptureVideoOrientation.LandscapeRight
//        }
//        previewLayer.frame = CGRectMake(0, 0, view.frame.height, view.frame.width)
//        view.layer.insertSublayer(previewLayer, atIndex: 0)
//    }
    
    func showQrcodeToWeb(){
        session.stopRunning()
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "showQrcode") as! ShowQroceViewController
        let nc = self.storyboard?.instantiateViewController(withIdentifier: "nc") as! UINavigationController
        nc.pushViewController(vc, animated: false)
        vc.htmlUrl = tempQrcode
        self.showDetailViewController(nc, sender: self)
    }
    
    func showDetectedObjects(codeObject:AVMetadataMachineReadableCodeObject){
        let shapeLayer = CAShapeLayer()
        shapeLayer.strokeColor = UIColor.green.cgColor
        shapeLayer.lineWidth = 2
        shapeLayer.fillColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.3).cgColor
        let path = createPathForPoints(points: codeObject.corners as NSArray)
        shapeLayer.path = path
        targetLayer.addSublayer(shapeLayer)
    }
    
    func createPathForPoints(points: NSArray) -> CGMutablePath{
        let path = CGMutablePath()
        var point = CGPoint()
        
        if points.count > 0 {
//            CGPointMakeWithDictionaryRepresentation((points.object(at: 0) as! CFDictionary), &point)
//            CGPathMoveToPoint(path, nil, point.x, point.y)
//
//            var i = 1
//            while i < points.count {
//                CGPointMakeWithDictionaryRepresentation((points.objectAtIndex(i) as! CFDictionaryRef), &point)
//                CGPathAddLineToPoint(path, nil, point.x, point.y)
//                i++
//            }
//            path.closeSubpath()            
        }
        return path
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
