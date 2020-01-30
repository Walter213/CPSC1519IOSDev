//
//  ViewController.swift
//  StreamNScore
//
//  Created by Walter Teljega on 1/16/20.
//  Copyright © 2020 Walter Teljega. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        championsSwitch.setOn(false, animated: false)
        europaSwitch.setOn(false, animated: false)
        
        championsSwitchR.setOn(false, animated: false)
        europaSwitchR.setOn(false, animated: false)
        
        fullNameText.placeholder = "Enter Full Name Here"
        
        fullnameText.placeholder = "Enter Full Name Here"
    }
    
    // None Rotated Stuff
    @IBOutlet weak var fullNameText: UITextField!
    @IBOutlet weak var championsSwitch: UISwitch!
    @IBOutlet weak var europaSwitch: UISwitch!
    @IBOutlet weak var championsSelect: UIButton!
    @IBOutlet weak var europaSelect: UIButton!
    
    // Rotated Device Stuff
    @IBOutlet weak var fullnameText: UITextField!
    @IBOutlet weak var europaSwitchR: UISwitch!
    @IBOutlet weak var championsSwitchR: UISwitch!
    @IBOutlet weak var championsSelectR: UIButton!
    @IBOutlet weak var europaSelectR: UIButton!
    
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
    
    // https://www.tutorialspoint.com/how-do-you-animate-the-change-of-background-color-of-a-view-on-ios
    @IBAction func changeBackgroundClicked(_ sender: Any)
    {
        if self.view.backgroundColor == UIColor.red
        {
            UIView.animate(withDuration: 2)
            {
                self.view.backgroundColor = UIColor.lightGray
            }
        }
        else
        {
            UIView.animate(withDuration: 2)
            {
                self.view.backgroundColor = UIColor.red
            }
        }
    }
    
    @IBAction func textFieldDoneEditing(sender: UITextField)
    {
        sender.resignFirstResponder()
    }
    
    @IBAction func onTapGestureRecognized(_ sender: Any)
    {
        fullNameText.resignFirstResponder()
    }
    
    // For Next Assignment i would like to look and try to implement something for if you click no on any
    // alerts like the UIbuttons, when you hit no it should stay off and if you wish not to turn it off
    // then it should keep it on if you click no
    
    // maybe add a playable sound when click the select buttons just for fun
    
    @IBAction func championsSwitchChanged(_ sender: UISwitch)
    {
        let setting = sender.isOn
        championsSwitch.setOn(setting, animated: true)
        
        if championsSwitch.isOn
        {
            let controller = UIAlertController(title: "Are you sure you want to turn on Champions League?",
                                               message:nil, preferredStyle: .actionSheet)
            
            let yesAction = UIAlertAction(title: "Yes", style: .destructive, handler: { action in
                let msg = self.fullNameText.text!.isEmpty
                    ? "You will recieve notification when they are implemented"
                    : "You will recieve notification when they are implemented"
                
                let controller2 = UIAlertController(
                    title:"Done",
                    message: msg, preferredStyle: .alert)
                
                let cancelAction = UIAlertAction(title: "Ok",
                                                 style: .cancel, handler: nil)
                
                controller2.addAction(cancelAction)
                
                self.present(controller2, animated: true,
                             completion: nil)
            })
            
            let noAction = UIAlertAction(title: "No",
                                         style: .cancel, handler: nil)
            
            controller.addAction(yesAction)
            controller.addAction(noAction)
            
            if let ppc = controller.popoverPresentationController
            {
                ppc.sourceView = sender
                ppc.sourceRect = sender.bounds
                ppc.permittedArrowDirections = .down
            }
            
            present(controller, animated: true, completion: nil)
        }
        // (else method), for switching it off, this is to confirm with user if he
        // or she would like to turn it off
        else
        {
            let controller = UIAlertController(title: "Are you sure you want to turn off Champions League?",
                                               message:nil, preferredStyle: .actionSheet)
            
            let yesAction = UIAlertAction(title: "Yes", style: .destructive, handler: { action in
                let msg = self.fullNameText.text!.isEmpty
                    ? "You will now not recieve any notifications when they are implemented"
                    : "You will now not recieve any notifications when they are implemented"
                
                let controller2 = UIAlertController(
                    title:"Done",
                    message: msg, preferredStyle: .alert)
                
                let cancelAction = UIAlertAction(title: "Ok",
                                                 style: .cancel, handler: nil)
                
                controller2.addAction(cancelAction)
                
                self.present(controller2, animated: true,
                             completion: nil)
            })
            
            let noAction = UIAlertAction(title: "No",
                                         style: .cancel, handler: nil)
            
            controller.addAction(yesAction)
            controller.addAction(noAction)
            
            if let ppc = controller.popoverPresentationController
            {
                ppc.sourceView = sender
                ppc.sourceRect = sender.bounds
                ppc.permittedArrowDirections = .down
            }
            
            present(controller, animated: true, completion: nil)
        }
    }
    
    @IBAction func europaSwitchChanged(_ sender: UISwitch)
    {
        let setting = sender.isOn
        europaSwitch.setOn(setting, animated: true)
        
        if europaSwitch.isOn
        {
            let controller = UIAlertController(title: "Are you sure you want to turn on Europa League?",
                                               message:nil, preferredStyle: .actionSheet)
            
            let yesAction = UIAlertAction(title: "Yes", style: .destructive, handler: { action in
                let msg = self.fullNameText.text!.isEmpty
                    ? "You will recieve notification when they are implemented"
                    : " You will recieve notification when they are implemented"
                
                let controller2 = UIAlertController(
                    title:"Done",
                    message: msg, preferredStyle: .alert)
                
                let cancelAction = UIAlertAction(title: "Ok",
                                                 style: .cancel, handler: nil)
                
                controller2.addAction(cancelAction)
                
                self.present(controller2, animated: true,
                             completion: nil)
            })
            
            let noAction = UIAlertAction(title: "No",
                                         style: .cancel, handler: nil)
            
            controller.addAction(yesAction)
            controller.addAction(noAction)
            
            if let ppc = controller.popoverPresentationController
            {
                ppc.sourceView = sender
                ppc.sourceRect = sender.bounds
                ppc.permittedArrowDirections = .down
            }
            
            present(controller, animated: true, completion: nil)
        }
        // (else method), for switching it off, this is to confirm with user if he
        // or she would like to turn it off
        else
        {
            let controller = UIAlertController(title: "Are you sure you want to turn off Europa League?",
                                               message:nil, preferredStyle: .actionSheet)
            
            let yesAction = UIAlertAction(title: "Yes", style: .destructive, handler: { action in
                let msg = self.fullNameText.text!.isEmpty
                    ? "You will now not recieve any notifications when they are implemented"
                    : " You will now not recieve any notifications when they are implemented"
                
                let controller2 = UIAlertController(
                    title:"Done",
                    message: msg, preferredStyle: .alert)
                
                let cancelAction = UIAlertAction(title: "Ok",
                                                 style: .cancel, handler: nil)
                
                controller2.addAction(cancelAction)
                
                self.present(controller2, animated: true,
                             completion: nil)
            })
            
            let noAction = UIAlertAction(title: "No",
                                         style: .cancel, handler: nil)
            
            controller.addAction(yesAction)
            controller.addAction(noAction)
            
            if let ppc = controller.popoverPresentationController
            {
                ppc.sourceView = sender
                ppc.sourceRect = sender.bounds
                ppc.permittedArrowDirections = .down
            }
            
            present(controller, animated: true, completion: nil)
        }
    }
    
    @IBAction func toggleSwitchesNButtons(_ sender: UISegmentedControl)
    {
        if sender.selectedSegmentIndex == 0
        {
            championsSwitch.isHidden = false
            europaSwitch.isHidden = false
            championsSelect.isHidden = true
            europaSelect.isHidden = true
            
            championsSwitchR.isHidden = false
            europaSwitchR.isHidden = false
            championsSelectR.isHidden = true
            europaSelectR.isHidden = true
        }
        else
        {
            championsSwitch.isHidden = true
            europaSwitch.isHidden = true
            championsSelect.isHidden = false
            europaSelect.isHidden = false
            
            championsSwitchR.isHidden = true
            europaSwitchR.isHidden = true
            championsSelectR.isHidden = false
            europaSelectR.isHidden = false
        }
    }
    
    @IBAction func championsPressedButton(_ sender: UIButton)
    {
        let controller = UIAlertController(title: "Are you sure you want to select Champions League?",
                                           message:nil, preferredStyle: .actionSheet)
        
        let yesAction = UIAlertAction(title: "Yes", style: .destructive, handler: { action in
                                        let msg = self.fullNameText.text!.isEmpty
                                            ? "You will recieve notification when they are implemented"
                                            : "You will recieve notification when they are implemented"
            
                                        let controller2 = UIAlertController(
                                            title:"Done",
                                            message: msg, preferredStyle: .alert)
            
                                        let cancelAction = UIAlertAction(title: "Ok",
                                                                         style: .cancel, handler: nil)
            
                                        controller2.addAction(cancelAction)
            
                                        self.present(controller2, animated: true,
                                                     completion: nil)
        })
        
        let noAction = UIAlertAction(title: "No",
                                     style: .cancel, handler: nil)
        
        controller.addAction(yesAction)
        controller.addAction(noAction)
        
        if let ppc = controller.popoverPresentationController
        {
            ppc.sourceView = sender
            ppc.sourceRect = sender.bounds
            ppc.permittedArrowDirections = .down
        }
        
        present(controller, animated: true, completion: nil)
    }
    
    @IBAction func europaButtonPressed(_ sender: UIButton)
    {
        let controller = UIAlertController(title: "Are you sure you want to select Europa League?",
                                           message:nil, preferredStyle: .actionSheet)
        
        let yesAction = UIAlertAction(title: "Yes", style: .destructive, handler: { action in
            let msg = self.fullNameText.text!.isEmpty
                ? "You will recieve notification when they are implemented"
                : " You will recieve notification when they are implemented"
            
            let controller2 = UIAlertController(
                title:"Done",
                message: msg, preferredStyle: .alert)
            
            let cancelAction = UIAlertAction(title: "Ok",
                                             style: .cancel, handler: nil)
            
            controller2.addAction(cancelAction)
            
            self.present(controller2, animated: true,
                         completion: nil)
        })
        
        let noAction = UIAlertAction(title: "No",
                                     style: .cancel, handler: nil)
        
        controller.addAction(yesAction)
        controller.addAction(noAction)
        
        if let ppc = controller.popoverPresentationController
        {
            ppc.sourceView = sender
            ppc.sourceRect = sender.bounds
            ppc.permittedArrowDirections = .down
        }
        
        present(controller, animated: true, completion: nil)
    }
}

// Quiz 2 Example
// This is a button, i put a label for the (Add 10 to the number) for some reason
// var num = Int(numberInput.text!)
// num = num! + 10
// numberOutput.text = string(num!)
