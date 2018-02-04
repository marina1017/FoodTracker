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
    var mystackView: UIStackView!
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.commonInit()
        
        self.mystackView = self.createMyStackView()
        //追加のビューを追加するだけでセルをカスタマイズする場合は、ビューをコンテンツビューに追加して、セルが編集モードに出入りする際に適切に配置されるようにする必要があります。
        self.contentView.addSubview(self.photoImageView)
        self.contentView.addSubview(self.mystackView)
      
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        photoImageView.frame = CGRect(x: 0, y: 0, width: 100, height: frame.height)
        ratingControl.frame.size = CGSize(width: self.mystackView.frame.size.width, height: self.mystackView.frame.size.height*2/3)
        nameLabel.frame = CGRect(x: 0, y: 0,width: self.mystackView.frame.size.width, height: self.mystackView.frame.size.height*1/3)
        self.layoutStackView()
    }
    
    //MARK : method
    private func commonInit() {
        
        self.createPhotoImageView()
        self.createNameLabel()
        self.createRatingControl()
    }
    private func createNameLabel() {
        nameLabel = UILabel(frame: CGRect.zero)
        nameLabel.textAlignment = .left
        nameLabel.font = UIFont.systemFont(ofSize: 20)
    }
    
    private func createPhotoImageView() {
        photoImageView = UIImageView(frame: CGRect.zero)
    }
    
    private func createRatingControl() {
        ratingControl = RatingControl(frame: CGRect.zero)
    }
    
    private func createMyStackView() -> UIStackView {
        let stackView = UIStackView(frame: CGRect.zero)
        stackView.addArrangedSubview(self.nameLabel)
        stackView.addArrangedSubview(self.ratingControl)
        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.alignment = .center
        stackView.distribution = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }
    
    private func layoutStackView() {
        mystackView.topAnchor.constraint(equalTo: self.topAnchor, constant:self.frame.height*1/10).isActive = true
        mystackView.leadingAnchor.constraint(equalTo: self.photoImageView.trailingAnchor, constant: 10).isActive = true
        mystackView.heightAnchor.constraint(equalToConstant: self.frame.height*8/10).isActive = true
    }
    
    
    
   

}
