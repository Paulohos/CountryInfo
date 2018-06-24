//
//  HomeTableViewController.swift
//  CountryInfo
//
//  Created by Paulo Henrique Oliveira Souza on 24/06/2018.
//  Copyright © 2018 Paulo. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class HomeTableViewController: UITableViewController {
    
    var presenter: HomePresenterProtocol?
    
    var arrayCountries: [CountryEntity]?
    var filteredCountries = [CountryEntity]()
    
    let cellID = "countryCell"
    
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setup()
        self.setupRefreshControl()
        
    }
    
    private func setup(){
        self.navigationItem.title = "Countries"
        self.addSearchController = true
        self.navigationItem.largeTitleDisplayMode = .always
        self.navigationItem.searchController?.obscuresBackgroundDuringPresentation = false
        self.navigationItem.hidesSearchBarWhenScrolling = false
        self.tableView.tableFooterView = UIView()
        self.tableView.register(R.nib.countryTableViewCell(), forCellReuseIdentifier: self.cellID)
        
        self.navigationItem.searchController!.searchBar.rx.text.changed.asObservable().subscribe(onNext: { (str) in
             self.filterContentForSearchText(str!)
        }).disposed(by: self.disposeBag)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.presenter?.didLoad()
        
    }
    
    //MARK: - Refresh
    private func setupRefreshControl(){
        //self.addSearchController = true
        self.refreshControl = UIRefreshControl()
        self.refreshControl?.addTarget(self, action: #selector(handleRefresh(refreshControl:)), for: .valueChanged)
    }
    
    @objc
    func handleRefresh(refreshControl: UIRefreshControl) {
        self.presenter?.didLoad()
    }
    
    func pullDownToRefresh(){
        //self.tableView.setContentOffset(CGPoint(x: 0, y: -CGFloat(250)), animated: true)
        self.refreshControl!.beginRefreshing()
    }
    
    //MARK: - Search
    
    func searchBarIsEmpty() -> Bool {
        // Returns true if the text is empty or nil
        return self.navigationItem.searchController?.searchBar.text?.isEmpty ?? true
        
    }
    
    //MARK: - Filter
    
    func isFiltering() -> Bool {
        return self.navigationItem.searchController!.isActive && !searchBarIsEmpty()
    }
    
    private func filterCountryByArray(row: Int) -> CountryEntity {
        let country: CountryEntity
        if self.isFiltering() {
            country = filteredCountries[row]
        } else {
            country = self.arrayCountries![row]
        }
        
        return country
    }
    
    func filterContentForSearchText(_ searchText: String) {
        filteredCountries = self.arrayCountries!.filter({( country : CountryEntity) -> Bool in
            return country.name!.lowercased().contains(searchText.lowercased())
        })
        
        tableView.reloadData()
    }
    
}

// MARK: - Datasource
extension HomeTableViewController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isFiltering() {
            return filteredCountries.count
        }
        
        return self.arrayCountries?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: self.cellID, for: indexPath) as! CountryTableViewCell
        let country = filterCountryByArray(row: indexPath.row)
        cell.textLabel?.text = country.name ?? ""
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        self.presenter?.didSelectedCountry(country: filterCountryByArray(row: indexPath.row))
        
    }
}

extension HomeTableViewController : HomeViewProtocol {
    
    func showCountries(countries: [CountryEntity]) {
        self.arrayCountries = countries
        self.tableView.reloadData()
        self.showLoading(show: false)
    }
    
    func showErrorAlert() {
        self.showAlert(withMessage: "Whoops... something went wrong")
    }
    
    func showLoading(show: Bool) {
        if show {
            self.pullDownToRefresh()
            return
        }
        
        self.refreshControl?.endRefreshing()
    }
    
    
}
