//
//  Extension+UITableViewController.swift
//  CountryInfo
//
//  Created by Paulo Henrique Oliveira Souza on 24/06/2018.
//  Copyright © 2018 Paulo. All rights reserved.
//

import UIKit

extension UITableViewController {
    
    //MARK - Atributs
    @IBInspectable
    var addSearchController: Bool{
        get {
            return self.navigationItem.searchController == nil ? false : true
        }
        set (newValue) {
            if newValue {
                if #available(iOS 11.0, *){
                    let searchController = UISearchController(searchResultsController: nil)
                    self.navigationItem.searchController = searchController
                    //searchController.searchResultsUpdater = self as? UISearchResultsUpdating
                    definesPresentationContext = true
                    
                }
            }
        }
        
    }
    
}
