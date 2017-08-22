//
//  CollectionModel.swift
//  PictureBrowse_Leon
//
//  Created by lai leon on 2017/8/22.
//  Copyright © 2017 clem. All rights reserved.
//

import UIKit

class CollectionModel: NSObject {
    var title: String?
    var descriptions: String?
    var featuredImage: UIImage?

/*一个类需要什么样的init，需要视情况而定，可根据一下情形进行判定：

1.类中如果有任何没有初始值的属性，则必须要编写init，如果所有属性均已初始化，则在实例化类的时候会自动调用init()或super.init()

2.如果该类为某类的子类，则编写init时需要添加required或override

3.添加ruquired还是override的选择：override用于重载其父类的init，特别的，override init()；required用于本类特殊参数形式的init构造。因此一个类往往可有多种init方法。

4.init可选的用法：若init进行过程中可能出现获取失败或调用失败返回nil的情况，需要加可选。*/

    init(title: String, descriptions: String, featuredImage: UIImage) {
        self.title = title
        self.descriptions = descriptions
        self.featuredImage = featuredImage
    }

    static func createInterests() -> [CollectionModel]{
        return [
            CollectionModel(title: "Hello there, i miss u.", descriptions: "We love backpack and adventures! We walked to Antartica yesterday, and camped with some cute pinguines, and talked about this wonderful app idea. 🐧⛺️✨", featuredImage: UIImage(named: "hello")!),
            CollectionModel(title: "🐳🐳🐳🐳🐳", descriptions: "We love romantic stories. We walked to Antartica yesterday, and camped with some cute pinguines, and talked about this wonderful app idea. 🐧⛺️✨", featuredImage: UIImage(named: "dudu")!),
            CollectionModel(title: "Training like this, #bodyline", descriptions: "Create beautiful apps. We walked to Antartica yesterday, and camped with some cute pinguines, and talked about this wonderful app idea. 🐧⛺️✨", featuredImage: UIImage(named: "bodyline")!),
            CollectionModel(title: "I'm hungry, indeed.", descriptions: "Cars and aircrafts and boats and sky. We walked to Antartica yesterday, and camped with some cute pinguines, and talked about this wonderful app idea. 🐧⛺️✨", featuredImage: UIImage(named: "wave")!),
            CollectionModel(title: "Dark Varder, #emoji", descriptions: "Meet life with full presence. We walked to Antartica yesterday, and camped with some cute pinguines, and talked about this wonderful app idea. 🐧⛺️✨", featuredImage: UIImage(named: "darkvarder")!),
            CollectionModel(title: "I have no idea, bitch", descriptions: "Get up to date with breaking-news. We walked to Antartica yesterday, and camped with some cute pinguines, and talked about this wonderful app idea. 🐧⛺️✨", featuredImage: UIImage(named: "hhhhh")!),
        ]
    }
}
