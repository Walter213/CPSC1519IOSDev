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
    // I will try this stuff when i get more time to play around with this code
    // For Next Assignment i would like to look and try to implement something for if you click no on any
    // alerts like the UIbuttons, when you hit no it should stay off and if you wish not to turn it off
    // then it should keep it on if you click no
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        championsSwitch.setOn(false, animated: false)
        europaSwitch.setOn(false, animated: false)
        
        fullNameText.placeholder = "Enter Full Name Here"
        
        fullNameLabel.text = ""
    }
    
    @IBOutlet weak var fullNameText: UITextField!
    @IBOutlet weak var championsSwitch: UISwitch!
    @IBOutlet weak var europaSwitch: UISwitch!
    @IBOutlet weak var championsSelect: UIButton!
    @IBOutlet weak var europaSelect: UIButton!
    @IBOutlet weak var fullNameLabel: UILabel!
    
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
        
        if fullNameText.text?.isEmpty ?? true
        {
            fullNameLabel.text = ""
        }
        else
        {
            fullNameLabel.text = "Welcome " + fullNameText.text!
            fullNameLabel.textAlignment = .center
        }
    }
    
    @IBAction func onTapGestureRecognized(_ sender: Any)
    {
        fullNameText.resignFirstResponder()
    }
    
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
        }
        else
        {
            championsSwitch.isHidden = true
            europaSwitch.isHidden = true
            championsSelect.isHidden = false
            europaSelect.isHidden = false
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
