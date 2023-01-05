//
//  User.swift
//  Task 1
//
//  Created by Ogabek Matyakubov on 05/01/23.
//

import Foundation

struct User: Codable {
    var login: String
    var id: Int
    var name: String
    var company: String
    var bio: String
    var twitter_username: String
    var public_repos: Int
    var followers: Int
    var following: Int
    var created_at: String
    var updated_at: String
}
