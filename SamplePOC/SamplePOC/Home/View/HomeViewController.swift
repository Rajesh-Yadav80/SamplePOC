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
        // Do any additional setup after loading the view.
        self.title = NavigationConstant.titleHome
        self.title = "Test Navigation"
//        self.view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
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
        return 5
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = HomeListingTblViewCell()
        
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

