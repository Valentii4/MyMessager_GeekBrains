//
//  PersoneCollectionViewController.swift
//  MyMessager_GB
//
//  Created by Valentin Mironov on 04.05.2021.
//

import UIKit

class PersoneCollectionViewController: UICollectionViewController {

    var personeVM: PersoneCollectionViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = personeVM?.title
    }
    

    // MARK: UICollectionViewDataSource

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return personeVM?.numberOfItemsInSection ?? 0
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PersoneCollectionViewCell.reuseIdentifier, for: indexPath) as? PersoneCollectionViewCell, let vm = personeVM else{
            return UICollectionViewCell()
        }
        let picture =  vm.getPhotoWithIndexPath(row: indexPath.row)
        cell.configure(picture: picture)
    
        return cell
    }
}

extension PersoneCollectionViewController: UICollectionViewDelegateFlowLayout{
    private var spacing: CGFloat { return 10 }
    private var itemsInRow: Int { return 1 }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let widthSpasings: CGFloat = spacing * CGFloat((itemsInRow + 1))
        let widthItemsInRow = collectionView.frame.width - widthSpasings
        let widthItem = widthItemsInRow/CGFloat(itemsInRow)
        let height = PersonePhoto.getHight(with: widthItem)
        return CGSize(width: widthItem, height: height)
    }
}
