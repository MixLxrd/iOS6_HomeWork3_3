//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Михаил Ильченко on 06.10.2020.
//  Copyright © 2020 Artem Novichkov. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    
    var profile = ProfileHeaderView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        profile.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .lightGray
        view.addSubview(profile)
        //viewWillLayoutSubviews()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        profile.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
    }
}
