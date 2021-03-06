//
//  SearchViewController.swift
//  TAT
//
//  Created by Chunbi Feng on 2016/10/8.
//  Copyright © 2016年 Chunbi Feng. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController, UISearchControllerDelegate, UISearchResultsUpdating, UISearchBarDelegate {

    var searchController : UISearchController!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.7921568627, green: 0.1960784314, blue: 0.4980392157, alpha: 1)
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
        
        self.searchController = UISearchController(searchResultsController:  nil)
        self.searchController.searchResultsUpdater = self
        self.searchController.delegate = self
        self.searchController.searchBar.delegate = self
        
        self.searchController.hidesNavigationBarDuringPresentation = false
        self.searchController.dimsBackgroundDuringPresentation = true
        
        self.navigationItem.titleView = searchController.searchBar
        self.definesPresentationContext = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        // do something
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
