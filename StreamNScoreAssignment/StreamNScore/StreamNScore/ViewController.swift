//
//  ViewController.swift
//  StreamNScore
//
//  Created by Walter Teljega on 1/16/20.
//  Copyright © 2020 Walter Teljega. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var fullNameText: UITextField!
    @IBOutlet weak var championsSwitch: UISwitch!
    @IBOutlet weak var europaSwitch: UISwitch!
    @IBOutlet weak var championsSelect: UIButton!
    @IBOutlet weak var europaSelect: UIButton!
    
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func textFieldDoneEditing(sender: UITextField)
    {
        sender.resignFirstResponder()
    }
    
    @IBAction func onTapGestureRecognized(_ sender: Any)
    {
        // Need to Fix The Text
        fullNameText.resignFirstResponder()
    }
    
    @IBAction func onSwitchChanged(_ sender: UISwitch)
    {
        let setting = sender.isOn
        championsSwitch.setOn(setting, animated: true)
        europaSwitch.setOn(setting, animated: true)
    }
    
//    @IBAction func switchOnePressed(_ sender: UISwitch) {
 //       label.text = sender.isOn ? "UISwitch is ON" : "UISwitch is OFF"
  //      switchTwo.setOn(!sender.isOn, animated: true)
   // }
    
    //@IBAction func switchTwoPressed(_ sender: UISwitch) {
      //  label.text = sender.isOn ? "UISwitch is ON" : "UISwitch is OFF"
        //switchOne.setOn(!sender.isOn, animated: true)
    //}
    
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
        let controller = UIAlertController(title: "Are you sure you want to select Champions League or Europa League?",
                                           message:nil, preferredStyle: .actionSheet)
        
        let yesAction = UIAlertAction(title: "Yes", style: .destructive, handler: { action in
                                        let msg = self.fullNameText.text!.isEmpty
                                            ? "You will be notified"
                                        : "You will be notified, \(self.fullNameText.text),"
                                        + "everything went OK."
            
                                        let controller2 = UIAlertController(
                                            title:"Done",
                                            message: msg, preferredStyle: .alert)
            
                                        let cancelAction = UIAlertAction(title: "Cancel",
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
