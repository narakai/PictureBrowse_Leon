//
//  CollectionCell.swift
//  PictureBrowse_Leon
//
//  Created by lai leon on 2017/8/22.
//  Copyright © 2017 clem. All rights reserved.
//

import UIKit

class CollectionCell: UICollectionViewCell {
    let featureImageView = UIImageView(frame: CGRect(x: 0.0, y: 0.0, width: ItemWidth, height: ItemHeight))
    let interestTitleLabel = UILabel(frame: CGRect(x: 0.0, y: ItemHeight-50, width: ItemWidth, height: 20))
    let interestDetailLabel = UILabel(frame: CGRect(x: 0.0, y: ItemHeight-30, width: ItemWidth, height: 30))

    var data: CollectionModel?{
        /*属性观察器
         willSet 在新的值被设置之前调用
         didSet 在新的值被设置之后立即调用
         */
        didSet {
            updateUI()
        }

    }

    private func updateUI() {
        featureImageView.image = data?.featuredImage
        interestTitleLabel.text = data?.title
        interestDetailLabel.text = data?.descriptions
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        self.layer.cornerRadius = 5.0
        featureImageView.clipsToBounds = true
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        interestTitleLabel.backgroundColor = .gray
        interestTitleLabel.textColor = .white
        interestTitleLabel.textAlignment = .center
        interestTitleLabel.font = UIFont.systemFont(ofSize: 16, weight: 4)
        interestDetailLabel.backgroundColor = .gray
        interestDetailLabel.textColor = .white
        interestDetailLabel.textAlignment = .center
        interestDetailLabel.numberOfLines = 0
        interestDetailLabel.font = UIFont.systemFont(ofSize: 10)
        contentView.addSubview(featureImageView)
        contentView.addSubview(interestTitleLabel)
        contentView.addSubview(interestDetailLabel)
    }

}
