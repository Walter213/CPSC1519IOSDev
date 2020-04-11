//
//  SettingsController.swift
//  StreamNScore
//
//  Created by Walter Teljega on 2/28/20.
//  Copyright © 2020 Walter Teljega. All rights reserved.
//

import UIKit

class SettingsController: UIViewController
{
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var passwordLabel: UILabel!
    @IBOutlet weak var roleLabel: UILabel!
    @IBOutlet weak var notificationsLabel: UILabel!
    
    @IBOutlet weak var premierLabel: UILabel!
    @IBOutlet weak var laLigaLabel: UILabel!
    @IBOutlet weak var seriaALabel: UILabel!
    @IBOutlet weak var bundesligaLabel: UILabel!
    @IBOutlet weak var ligue1Label: UILabel!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
    
    override var supportedInterfaceOrientations : UIInterfaceOrientationMask
    {
        return UIInterfaceOrientationMask(rawValue:
            (UIInterfaceOrientationMask.portrait.rawValue))
    }
    
    @IBAction func goIntoSettings(_ sender: Any)
    {
        let application = UIApplication.shared
        let url = URL(string: UIApplication.openSettingsURLString)! as URL
        if application.canOpenURL(url) {
            application.open(url, options:[UIApplication.OpenExternalURLOptionsKey(rawValue: ""):""] , completionHandler: nil)
        }
    }
    
    @objc func applicationWillEnterForeground(notification:NSNotification)
    {
        let defaults = UserDefaults.standard
        defaults.synchronize()
        refreshFields()
    }
    
    func refreshFields()
    {
        let defaults = UserDefaults.standard
        usernameLabel.text = defaults.string(forKey: usernameKey)
        passwordLabel.text = defaults.string(forKey: passwordKey)
        roleLabel.text = defaults.string(forKey: roleKey)
        notificationsLabel.text = defaults.bool(forKey: notificationKey)
            ? "Enabled" : "Disabled"
        
        premierLabel.text = defaults.string(forKey: premierKey)
        laLigaLabel.text = defaults.string(forKey: laligaKey)
        seriaALabel.text = defaults.string(forKey: seriaAKey)
        bundesligaLabel.text = defaults.string(forKey: bundesligaKey)
        ligue1Label.text = defaults.string(forKey: ligue1Key)
    }
    
    override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(animated)
        refreshFields()
        let app = UIApplication.shared
        NotificationCenter.default.addObserver(self, selector: #selector(self.applicationWillEnterForeground(notification:)), name: UIApplication.willEnterForegroundNotification, object: app)
    }
    
    override func viewDidDisappear(_ animated: Bool)
    {
        super.viewDidDisappear(animated)
        NotificationCenter.default.removeObserver(self)
    }
}
