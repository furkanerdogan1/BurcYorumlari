//
//  MainTabBarController.swift
//  BurcYorumlari
//
//  Created by Furkan Erdoğan on 10.04.2021.
//

import UIKit

class MainTabBarController: UITabBarController {
    
    //MARK: - Properties
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        view.backgroundColor = .yesil
        configureViewControllers()
    }
    
    
    
    // MARK: - Helpers
    
    func configureUI() {
        
        
    }
    
    func configureViewControllers(){
        
        let feed = BurclarController(collectionViewLayout: UICollectionViewFlowLayout())
        let nav1 = templateNavigationController(image: UIImage(systemName: "moon.stars.fill")!, rootViewController: feed)
        nav1.title = "Burçlar"
        
        
        let explore = BurcEtiketController(collectionViewLayout: UICollectionViewFlowLayout())
        
        let nav2 = templateNavigationController(image: UIImage(systemName: "tag.fill")!, rootViewController: explore)
        nav2.title = "Etiketler"
        viewControllers = [nav1, nav2]
        
    }
    
    func templateNavigationController(image: UIImage, rootViewController: UIViewController) -> UINavigationController {
        let nav = UINavigationController(rootViewController: rootViewController)
        nav.tabBarItem.image = image
        nav.navigationBar.barTintColor = .white
        
        return nav
    }
    
    
}
    
