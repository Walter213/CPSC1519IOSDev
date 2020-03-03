//
//  TeamViewController.swift
//  StreamNScore
//
//  Created by Walter Teljega on 3/3/20.
//  Copyright © 2020 Walter Teljega. All rights reserved.
//

import UIKit

class TeamViewController: UITableViewController
{
    private var leagueNames: [String]!
    private var cellPointSize: CGFloat!
    private var favoritesList: FavoriteTeamList!
    private static let teamCell = "TeamName"
    private static let favoritesCell = "Favorites"
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        // missed first three lines
        favoritesList = FavoriteTeamList.sharedFavoritesList
        tableView.estimatedRowHeight = cellPointSize
    }
    
    override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(animated)
        //tableView.reloadData()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int
    {
        return favoritesList.favorites.isEmpty ? 1 : 2
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return section == 0 ? leagueNames.count : 1
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String?
    {
        return section == 0 ? "All Teams" : "My Favorite Teams"
    }
}
