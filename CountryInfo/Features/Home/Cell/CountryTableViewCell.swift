//
//  CountryTableViewCell.swift
//  CountryInfo
//
//  Created by Paulo Henrique Oliveira Souza on 24/06/2018.
//  Copyright © 2018 Paulo. All rights reserved.
//

import UIKit
import WebKit

class CountryTableViewCell: UITableViewCell {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setup(country: CountryEntity){
        self.textLabel?.text = country.name
        self.detailTextLabel?.text = country.name
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
     //   self.downloadImage()
    }
    

    
}
