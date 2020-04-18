//
//  HomeListingTblViewCell.swift
//  SamplePOC
//
//  Created by Rajesh Yadav on 18/04/20.
//  Copyright © 2020 Rajesh Yadav. All rights reserved.
//

import Foundation
import UIKit

class HomeListingTblViewCell: UITableViewCell {
    /**
     *  HomeListingTbViewCell Properties Declared
     *
     *  @Developed By: Rajesh Yadav
     */
    
    // imgPicture : Image holder on cell
    let imgPicture:ImageLayerSetup = {
        let img = ImageLayerSetup()
        img.contentMode = .scaleToFill
        img.translatesAutoresizingMaskIntoConstraints = false // enable autolayout
        img.cornerRadius = 20
        img.image = #imageLiteral(resourceName: "ic_profile_dummy_x70")
        return img
    }()
    
    // lblTitle : Title holder on cell
    let lblTitle:UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 17)
        label.textColor = .black
        label.text = "Sample text"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // lblDesc : Description holder on cell
    let lblDesc:UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15)
        label.textColor =  .black
        label.numberOfLines = 0
        label.text = "Sample Desc"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }
    
    /**
     *  init method to initialize controls
     *
     *  @Developed By: Rajesh Yadav
     */
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.contentView.addSubview(imgPicture)
        self.contentView.addSubview(lblTitle)
        self.contentView.addSubview(lblDesc)
        
        imgPicture.mas_remakeConstraints { (make) in
            make?.left.setOffset(10)
            make?.top.setOffset(10)
            make?.bottom.lessThanOrEqualTo()(-10)
            make?.width.setOffset(100)
            make?.height.setOffset(100)
        }
        
        
        lblTitle.mas_remakeConstraints { (make) in
            make?.left.equalTo()(imgPicture.mas_right)?.with().offset()(10)
            make?.right.setOffset(-10)
            make?.top.setOffset(10)
            make?.height.equalTo()(20)
        }
        
        lblDesc.mas_remakeConstraints { (make) in
            make?.left.equalTo()(imgPicture.mas_right)?.with().offset()(10)
            make?.right.setOffset(-10)
            make?.top.equalTo()(lblTitle.mas_bottom)?.with().offset()(10)
            make?.bottom.setOffset(-10)
            
        }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
    }
}
