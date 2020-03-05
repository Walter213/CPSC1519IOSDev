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
    var leagueNames: [String: [String]]!
    var keys: [String]! 
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: sectionsTableIdentifier)
        
        let path = Bundle.main.path(forResource: "SoccerTeamList", ofType: "plist")
        let teamDict = NSDictionary(contentsOfFile: path!)
        leagueNames = (teamDict as! [String: [String]])
        keys = (teamDict!.allKeys as! [String]).sorted()
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
        let nameSection = leagueNames[key]!
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
        let nameSection = leagueNames[key]!
        cell.textLabel?.text = nameSection[indexPath.row]
        
        return cell
    }
}
