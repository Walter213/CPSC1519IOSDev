//
//  RootTableViewController.swift
//  StreamNScore
//
//  Created by Pajo Teljega on 2020-03-24.
//  Copyright © 2020 Walter Teljega. All rights reserved.
//

import UIKit

class RootTableViewController: UITableViewController
{
    private var names: [String: [String]]!
    private var keys: [String]!
    private var favoritesList: FavoriteTeamList!
    private static let teamCell = "TeamName"
    private static let favoritesCell = "Favorites"
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        let path = Bundle.main.path(forResource:
            "SoccerTeamList", ofType: "plist")
        let namesDict = NSDictionary(contentsOfFile: path!)
        names = (namesDict as! [String: [String]])
        keys = (namesDict!.allKeys as! [String]).sorted()
        
        // favoritesList = FavoriteTeamList.sharedFavoritesList
    }
    
    override var supportedInterfaceOrientations : UIInterfaceOrientationMask
    {
        return UIInterfaceOrientationMask(rawValue:
            (UIInterfaceOrientationMask.portrait.rawValue))
    }
    
    override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int
    {
        // return favoritesList.favorites.isEmpty ? 1 : 2
        // need to count keys as well
        return keys.count
    }
    
    // switched
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        let key = keys[section]
        let nameSection = names[key]!
        return nameSection.count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String?
    {
        return keys[section]
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: RootTableViewController.teamCell, for: indexPath)
        let key = keys[indexPath.section]
        let nameSection = names[key]!
        cell.textLabel?.text = nameSection[indexPath.row]
        return cell
    }
}
