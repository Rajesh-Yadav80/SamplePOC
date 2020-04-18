//
//  HomeViewController.swift
//  SamplePOC
//
//  Created by Rajesh Yadav on 18/04/20.
//  Copyright © 2020 Rajesh Yadav. All rights reserved.
//

import Foundation
import UIKit

class HomeViewController: BaseController {
    
    var tblViewHomeListing = UITableView()
    
    var presenter = HomePresenter()
    
    // api response holder
    var resHomeListing : ResponseHomeListing?
    
    //MARK:- Making Refersh control
    lazy var refreshControl: UIRefreshControl = {
        let rfControl = UIRefreshControl()
         rfControl.attributedTitle = NSAttributedString(string: AppConstant.PullToReferesh)
        rfControl.addTarget(self, action: #selector(self.refresh(sender:)), for: UIControl.Event.valueChanged)
        tblViewHomeListing.addSubview(rfControl)
        return rfControl
    }()
    
    
    /**
     *  UIView Life Cycle
     *
     *  @Developed By: Rajesh Yadav
     */
    override func loadView() {
        view = UIView()
        view.backgroundColor = .white

       self.view.addSubview(tblViewHomeListing)
       
       self.tblViewHomeListing.translatesAutoresizingMaskIntoConstraints = false
       
       tblViewHomeListing.mas_remakeConstraints { (make) in
           make?.left.setOffset(0)
           make?.top.setOffset(0)
           make?.bottom.setOffset(0)
           make?.right.setOffset(0)
       }
       
       self.tblViewHomeListing.delegate = self
       self.tblViewHomeListing.dataSource = self
       self.tblViewHomeListing.keyboardDismissMode = .onDrag
       self.tblViewHomeListing.tableFooterView = UIView()
       self.tblViewHomeListing.allowsSelection = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.presenter.attachView(view: self)
        
        // Do any additional setup after loading the view.
        self.title = NavigationConstant.titleHome
        self.title = "Test Navigation"

        self.getListing()
    }
}

//MARK:- callback method implementation
//MARK:-
extension HomeViewController{
    /**
     * Referesh control, To refersh listing by calling api
     *
     * Param : Anyobject
     *
     * Return : nothing
     *
     * @Developed By: Rajesh Yadav
     */
    @objc func refresh(sender:AnyObject) {
        // Code to refresh table view
        
    }
}

//MARK:- Fileprivate method implementation
//MARK:-
extension HomeViewController{
    func configTableViewCell(){
        self.tblViewHomeListing.register(HomeListingTblViewCell.self, forCellReuseIdentifier: HomeListingTblViewCell.nameOfClass)
    }
}

//MARK:- UITableViewDataSource method implementation.
//MARK:-
extension HomeViewController : UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (self.resHomeListing != nil && self.resHomeListing?.rows != nil && (self.resHomeListing?.rows?.count)! > 0) ? (self.resHomeListing?.rows?.count)! : 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = HomeListingTblViewCell()
        
        let row = self.resHomeListing?.rows![indexPath.row]
        cell.rowsData = row
        return cell
    }
}

//MARK:- UITableViewDelegate method implementation.
//MARK:-
extension HomeViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}

/**
 *  API Calling.
 *
 *  @Developed By: Rajesh Yadav
 */
extension HomeViewController  {
    
    /**
     * Get home lsiting from API Response
     *
     * Param : nothing
     *
     * Return : nothing
     *
     * @Developed By: Rajesh Yadav
     */
    func getListing(){
        self.presenter.getListingData(callBack: {
            status in
            if(status){
                if(self.resHomeListing != nil){
                    self.title = self.resHomeListing?.title ?? ""
                    
                    if(self.resHomeListing?.rows != nil && (self.resHomeListing?.rows?.count)! > 0){
                        self.tblViewHomeListing.reloadData()
                    }
                }
            }
        })
    }
}
