//
//  ShowTeamTableController.swift
//  StreamNScore
//
//  Created by Walter Teljega on 3/5/20.
//  Copyright © 2020 Walter Teljega. All rights reserved.
//

import UIKit

class ShowTeamTableController: UIViewController, UITableViewDataSource
{
    let sectionsTableIdentifier = "SectionsTableIndentifier"
    var names: [String: [String]]!
    var keys: [String]! 
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self,
                           forCellReuseIdentifier: sectionsTableIdentifier)
        
        let path = Bundle.main.path(forResource:
            "SoccerTeamList", ofType: "plist")
        let namesDict = NSDictionary(contentsOfFile: path!)
        names = (namesDict as! [String: [String]])
        keys = (namesDict!.allKeys as! [String]).sorted()
    }
    
    override var supportedInterfaceOrientations : UIInterfaceOrientationMask
    {
        return UIInterfaceOrientationMask(rawValue:
            (UIInterfaceOrientationMask.portrait.rawValue))
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int
    {
        return keys.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        let key = keys[section]
        let nameSection = names[key]!
        return nameSection.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String?
    {
        return keys[section]
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: sectionsTableIdentifier, for: indexPath)
            as UITableViewCell
        
        let key = keys[indexPath.section]
        let nameSection = names[key]!
        cell.textLabel?.text = nameSection[indexPath.row]
        
        return cell
    }
    
    // Display Titles on the right side of the screen (The Keys)
//    func sectionIndexTitles(for tableView: UITableView) -> [String]?
//    {
//        return keys
//    }
}
