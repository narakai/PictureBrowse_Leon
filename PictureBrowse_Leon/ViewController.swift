//
//  ViewController.swift
//  PictureBrowse_Leon
//
//  Created by lai leon on 2017/8/21.
//  Copyright © 2017 clem. All rights reserved.
//

import UIKit

let YHRect = UIScreen.main.bounds
let YHHeight = YHRect.size.height
let YHWidth = YHRect.size.width

let ItemWidth = YHWidth - 40.0
let ItemHeight = YHHeight / 3.0

class ViewController: UIViewController {
    let backgroundImageView = UIImageView(frame: YHRect)
    var collectionView: UICollectionView!
    let data = CollectionModel.createInterests()
    let reuseIdentifier = "CollectionCell"
    let reuseIdentifierForHeader = "Header"
    let visualEffectView = UIVisualEffectView(effect: UIBlurEffect(style: .light))

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setupView()
    }

//    override var preferredStatusBarStyle: UIStatusBarStyle {
//        return .lightContent
//    }

    override var prefersStatusBarHidden: Bool {
        return true
    }

    private func setupView() {
        backgroundImageView.image = UIImage(named: "blue")
        //容器collectionLayout
        let collectionLayout = UICollectionViewFlowLayout()
        collectionLayout.scrollDirection = .vertical
        collectionLayout.itemSize = CGSize(width: ItemWidth, height: ItemHeight)
        collectionLayout.headerReferenceSize = CGSize(width: YHWidth, height: 40)
        collectionLayout.minimumLineSpacing = 20
        collectionLayout.minimumInteritemSpacing = 20
        collectionLayout.sectionInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)//section边界
        //https://segmentfault.com/q/1010000003749152 - - UICollectionView 下面一行只显示了一半
//        collectionView = UICollectionView(frame: CGRect(x: 0.0, y: YHHeight / 2, width: YHWidth, height: YHHeight / 2),
//                collectionViewLayout: collectionLayout)
        collectionView = UICollectionView(frame: CGRect(x: 0.0, y: 0, width: YHWidth, height: YHHeight),
                collectionViewLayout: collectionLayout)
        collectionView.backgroundColor = .clear
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(CollectionCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        collectionView.register(CollectionHeader.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: reuseIdentifierForHeader)

        visualEffectView.frame = YHRect

        view.addSubview(backgroundImageView)
        view.addSubview(visualEffectView)
        view.addSubview(collectionView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

/*扩展ViewController支持协议*/
extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! CollectionCell
        cell.data = self.data[indexPath.row]
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        var reusableView: UICollectionReusableView!
        if kind == UICollectionElementKindSectionHeader {
            reusableView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: reuseIdentifierForHeader, for: indexPath) as! CollectionHeader
            (reusableView as! CollectionHeader).label.text = String(format: "第 %d 个页眉", arguments: [indexPath.section])
            reusableView.backgroundColor = .orange
        }
        return reusableView
    }
}
