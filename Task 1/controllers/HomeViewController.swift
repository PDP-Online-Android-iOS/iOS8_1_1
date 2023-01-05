//
//  HomeViewController.swift
//  Task 1
//
//  Created by Ogabek Matyakubov on 05/01/23.
//

import UIKit
import Alamofire
import SwiftyJSON

class HomeViewController: UIViewController {

    @IBOutlet weak var tvUsername: UILabel!
    @IBOutlet weak var tvFullname: UILabel!
    @IBOutlet weak var tvComany: UILabel!
    @IBOutlet weak var tvFollowers: UILabel!
    @IBOutlet weak var tvFollowing: UILabel!
    @IBOutlet weak var tvTwitter: UILabel!
    @IBOutlet weak var tvBio: UILabel!
    @IBOutlet weak var tvRepository: UILabel!
    @IBOutlet weak var tvUserID: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        apiGetUser()
        
    }
    
    func apiGetUser() {
        AFHttp.get(url: AFHttp.API_USER_LIST, params: AFHttp.emptyParams(), handler: { response in
            switch response.result {
            case .success(let data) :
                
                let json = JSON(data)
                
                let user = self.parseJsonToObject(json: json)
                
                self.setData(user: user)
                
            case let .failure(error) :
                print(error)
            }
            
        })
    }
    
    func parseJsonToObject(json: JSON) -> User? {
        if json.isEmpty { return nil}
        let login: String = json["login"].string!
        let id: Int = json["id"].int!
        let name: String = json["name"].string!
        let company: String = json["company"].string!
        let bio: String = json["bio"].string!
        let twitter_username: String = json["twitter_username"].string!
        let public_repos: Int = json["public_repos"].int!
        let followers: Int = json["followers"].int!
        let following: Int = json["following"].int!
        let created_at: String = json["created_at"].string!
        let updated_at: String = json["updated_at"].string!
        
        return User(login: login, id: id, name: name, company: company, bio: bio, twitter_username: twitter_username, public_repos: public_repos, followers: followers, following: following, created_at: created_at, updated_at: updated_at)
    }
    
    func setData(user: User?) {
        if user != nil {
            tvUsername.text = user!.login
            tvUserID.text = "UserID: " + String(user!.id)
            tvFullname.text = user!.name
            tvComany.text = user!.company
            tvFollowers.text = String(user!.followers)
            tvFollowing.text = String(user!.following)
            tvTwitter.text = user!.twitter_username
            tvBio.text = user!.bio
            tvRepository.text = String(user!.public_repos)
        }
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
