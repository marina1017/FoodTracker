//
//  TableViewCell.swift
//  FoodTracker
//
//  Created by 中川万莉奈 on 2018/02/03.
//  Copyright © 2018年 中川万莉奈. All rights reserved.
//

import UIKit

class MealTableViewCell: UITableViewCell {
    
    //MARK: Properties
    var nameLabel: UILabel!
    var photoImageView: UIImageView!
    var ratingControl: RatingControl!
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        nameLabel = UILabel(frame: CGRect.zero)
        nameLabel.textAlignment = .left
        //追加のビューを追加するだけでセルをカスタマイズする場合は、ビューをコンテンツビューに追加して、セルが編集モードに出入りする際に適切に配置されるようにする必要があります。
        self.contentView.addSubview(nameLabel)
        
        photoImageView = UIImageView(frame: CGRect.zero)
        self.contentView.addSubview(photoImageView)
        
        ratingControl = RatingControl(frame: CGRect.zero)
        self.contentView.addSubview(ratingControl)
      
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        nameLabel.frame = CGRect(x: 110, y: 0, width: frame.width - 100, height: frame.height / 10)
        photoImageView.frame = CGRect(x: 0, y: 0, width: 100, height: frame.height)
        ratingControl.frame = CGRect(x: 110, y: 50, width: frame.width - 100, height: frame.height)
    }
   

}
