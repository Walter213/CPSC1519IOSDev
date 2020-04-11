//
//  CameraViewController.swift
//  StreamNScore
//
//  Created by Pajo Teljega on 2020-04-10.
//  Copyright © 2020 Walter Teljega. All rights reserved.
//

import UIKit
import AVFoundation

class CameraViewController: UIViewController
{
    // Followed this tutorial https://www.youtube.com/watch?v=hRRammUA6I8&t=2s
    
    @IBOutlet weak var cameraView: UIView!
    
    var captureSession: AVCaptureSession?
    var videoPreviewLayer: AVCaptureVideoPreviewLayer?
    var frontCamera = AVCaptureDevice.default(.builtInWideAngleCamera, for: .video, position: .front)
    var backCamera = AVCaptureDevice.default(.builtInWideAngleCamera, for: .video, position: .back)
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        if #available(iOS 10.2, *)
        {
            let captureDevice = AVCaptureDevice.default(.builtInWideAngleCamera, for: .video, position: .back)
            do
            {
                let input = try AVCaptureDeviceInput(device: captureDevice!)
                captureSession = AVCaptureSession()
                captureSession?.addInput(input);
                videoPreviewLayer = AVCaptureVideoPreviewLayer(session: captureSession!)
                videoPreviewLayer?.frame = view.layer.bounds
                cameraView.layer.addSublayer(videoPreviewLayer!)
                captureSession?.startRunning()
            }
            catch
            {
                print("error")
            }
        }
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func imageCapture(_ sender: Any)
    {
        
    }
    
    func switchToFrontCamera()
    {
        if (frontCamera?.isConnected == true)
        {
            captureSession?.stopRunning()
            let captureDevice = AVCaptureDevice.default(.builtInWideAngleCamera, for: .video, position: .front)
            do
            {
                let input = try AVCaptureDeviceInput(device: captureDevice!)
                captureSession = AVCaptureSession()
                captureSession?.addInput(input);
                videoPreviewLayer = AVCaptureVideoPreviewLayer(session: captureSession!)
                videoPreviewLayer?.frame = view.layer.bounds
                cameraView.layer.addSublayer(videoPreviewLayer!)
                captureSession?.startRunning()
            }
            catch
            {
                print("error")
            }
        }
    }
    
    func switchToBackCamera()
    {
        if (backCamera?.isConnected == true)
        {
            captureSession?.stopRunning()
            let captureDevice = AVCaptureDevice.default(.builtInWideAngleCamera, for: .video, position: .back)
            do
            {
                let input = try AVCaptureDeviceInput(device: captureDevice!)
                captureSession = AVCaptureSession()
                captureSession?.addInput(input);
                videoPreviewLayer = AVCaptureVideoPreviewLayer(session: captureSession!)
                videoPreviewLayer?.frame = view.layer.bounds
                cameraView.layer.addSublayer(videoPreviewLayer!)
                captureSession?.startRunning()
            }
            catch
            {
                print("error")
            }
        }
    }
    
    @IBAction func rotateCamera(_ sender: Any)
    {
        guard let currentCameraInput: AVCaptureInput = captureSession?.inputs.first else
        {
            return
        }
        
        if let input = currentCameraInput as? AVCaptureDeviceInput
        {
            if input.device.position == .back
            {
                switchToBackCamera()
            }
            if input.device.position == .front
            {
                switchToFrontCamera()
            }
        }
    }
    
    @IBAction func flashButton(_ sender: Any)
    {
        
    }
}
