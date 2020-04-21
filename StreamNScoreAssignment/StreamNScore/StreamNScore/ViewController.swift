//
//  ViewController.swift
//  StreamNScore
//
//  Created by Walter Teljega on 1/16/20.
//  Copyright © 2020 Walter Teljega. All rights reserved.
//

import UIKit
import UserNotifications

class ViewController: UIViewController
{
    // https://www.youtube.com/channel/UC-TSTzj5hADDACFwolGgSxA/videos
    
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
                    ? "leave the app and wait on the home screen, a notification should pop up in a few seconds"
                    : "leave the app and wait on the home screen, a notification should pop up in a few seconds"
                
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
            
            // Notifications Implementation
            // https://www.youtube.com/watch?v=JuqQUP0pnZY and https://www.youtube.com/watch?v=oVjJKvNNbDs
            let center = UNUserNotificationCenter.current()
            
            let content = UNMutableNotificationContent()
            content.title = "Champions League Reminder"
            content.body = "You will recieve notifications 15 minutes before a champions league begins"
            content.sound = .default
            
            let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 20, repeats: false)
            
            let request = UNNotificationRequest(identifier: "champions", content: content, trigger: trigger)
            
            center.add(request) { (error) in
                if error != nil {
                    print("Error = \(error?.localizedDescription ?? "error local notification")")
                }
            }
        }
        else
        {
            let controller = UIAlertController(title: "Are you sure you want to turn off Champions League?",
                                               message:nil, preferredStyle: .actionSheet)
            
            let yesAction = UIAlertAction(title: "Yes", style: .destructive, handler: { action in
                let msg = self.fullNameText.text!.isEmpty
                    ? "Notifications has been turned off (Not In Settings)"
                    : "Notifications has been turned off (Not In Settings)"
                
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
                    ? "leave the app and wait on the home screen, a notification should pop up in a few seconds"
                    : "leave the app and wait on the home screen, a notification should pop up in a few seconds"
                
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
                style: .cancel, handler: { action in
                    self.europaSwitch.setOn(setting, animated: true)
            })
            
            controller.addAction(yesAction)
            controller.addAction(noAction)
            
            if let ppc = controller.popoverPresentationController
            {
                ppc.sourceView = sender
                ppc.sourceRect = sender.bounds
                ppc.permittedArrowDirections = .down
            }
            
            present(controller, animated: true, completion: nil)
            
            // Notifications Implementation
            // https://www.youtube.com/watch?v=JuqQUP0pnZY and https://www.youtube.com/watch?v=oVjJKvNNbDs
            let center = UNUserNotificationCenter.current()
            
            let content = UNMutableNotificationContent()
            content.title = "Europa League Reminder"
            content.body = "You will recieve notifications 15 minutes before a europa league begins"
            content.sound = .default
            
            let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 20, repeats: false)
            
            let request = UNNotificationRequest(identifier: "europa", content: content, trigger: trigger)
            
            center.add(request) { (error) in
                if error != nil {
                    print("Error = \(error?.localizedDescription ?? "error local notification")")
                }
            }
        }
        else
        {
            let controller = UIAlertController(title: "Are you sure you want to turn off Europa League?",
                                               message:nil, preferredStyle: .actionSheet)
            
            let yesAction = UIAlertAction(title: "Yes", style: .destructive, handler: { action in
                let msg = self.fullNameText.text!.isEmpty
                    ? "Notifications has been turned off (Not In Settings)"
                    : "Notifications has been turned off (Not In Settings)"
                
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
                style: .cancel, handler: { action in
                self.europaSwitch.setOn(setting, animated: false)
            })
            
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
                                            ? "leave the app and wait on the home screen, a notification should pop up in a few seconds"
                                            : "leave the app and wait on the home screen, a notification should pop up in a few seconds"
            
                                        let controller2 = UIAlertController(
                                            title:"Done",
                                            message: msg, preferredStyle: .alert)
            
                                        let cancelAction = UIAlertAction(title: "Ok",
                                                                         style: .cancel, handler: nil)
            
                                        controller2.addAction(cancelAction)
            
                                        self.present(controller2, animated: true,
                                                     completion: nil)
            // Notifications Implementation
            // https://www.youtube.com/watch?v=JuqQUP0pnZY and https://www.youtube.com/watch?v=oVjJKvNNbDs
            let center = UNUserNotificationCenter.current()
            
            let content = UNMutableNotificationContent()
            content.title = "Champions League Reminder"
            content.body = "You will recieve notifications 15 minutes before a champions league begins"
            content.sound = .default
            
            let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 20, repeats: false)
            
            let request = UNNotificationRequest(identifier: "champions", content: content, trigger: trigger)
            
            center.add(request) { (error) in
                if error != nil {
                    print("Error = \(error?.localizedDescription ?? "error local notification")")
                }
            }
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
                ? "leave the app and wait on the home screen, a notification should pop up in a few seconds"
                : "leave the app and wait on the home screen, a notification should pop up in a few seconds"
            
            let controller2 = UIAlertController(
                title:"Done",
                message: msg, preferredStyle: .alert)
            
            let cancelAction = UIAlertAction(title: "Ok",
                                             style: .cancel, handler: nil)
            
            controller2.addAction(cancelAction)
            
            self.present(controller2, animated: true,
                         completion: nil)
            // Notifications Implementation
            // https://www.youtube.com/watch?v=JuqQUP0pnZY and https://www.youtube.com/watch?v=oVjJKvNNbDs
            let center = UNUserNotificationCenter.current()
            
            let content = UNMutableNotificationContent()
            content.title = "Europa League Reminder"
            content.body = "You will recieve notifications 15 minutes before a europa league begins"
            content.sound = .default
            
            let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 20, repeats: false)
            
            let request = UNNotificationRequest(identifier: "europa", content: content, trigger: trigger)
            
            center.add(request) { (error) in
                if error != nil {
                    print("Error = \(error?.localizedDescription ?? "error local notification")")
                }
            }
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
