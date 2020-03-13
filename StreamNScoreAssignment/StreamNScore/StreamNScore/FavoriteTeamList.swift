//
//  FavoriteTeamController.swift
//  StreamNScore
//
//  Created by Walter Teljega on 3/3/20.
//  Copyright © 2020 Walter Teljega. All rights reserved.
//

import Foundation
import UIKit

class FavoriteTeamList
{
    static let sharedFavoritesList = FavoriteTeamList()
    private(set) var favorites:[String]
    
    init()
    {
        let defaults = UserDefaults.standard
        let storedFavorites = defaults.object(forKey: "favorites") as? [String]
        favorites = storedFavorites != nil ? storedFavorites! : []
    }
    
    func addFavorite(teamName: String)
    {
        if !favorites.contains(teamName)
        {
            favorites.append(teamName)
            saveFavorites()
        }
    }
    
    func removeFavorite(teamName: String)
    {
        if let index = favorites.index(of: teamName)
        {
            favorites.remove(at: index)
            saveFavorites()
        }
    }
    
    private func saveFavorites()
    {
        let defaults = UserDefaults.standard
        defaults.set(favorites, forKey: "favorites")
        defaults.synchronize()
    }
}
