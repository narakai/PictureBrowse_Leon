//
//  CollectionHeader.swift
//  PictureBrowse_Leon
//
//  Created by lai leon on 2017/8/22.
//  Copyright © 2017 clem. All rights reserved.
//

import UIKit

class CollectionHeader: UICollectionReusableView {
    var label:UILabel!

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.label = UILabel(frame: CGRect(x: 0.0, y: 10.0, width: YHWidth, height: 30))
        self.label.textAlignment = .center
        self.addSubview(self.label)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
