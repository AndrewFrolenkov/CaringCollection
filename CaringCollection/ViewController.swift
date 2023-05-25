//
//  ViewController.swift
//  CaringCollection
//
//  Created by Андрей Фроленков on 25.05.23.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

  lazy var collectionView: UICollectionView = {
    
    let cv = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout())
    let layout = UICollectionViewFlowLayout()
    layout.scrollDirection = .horizontal
    layout.sectionInset.left = cv.layoutMargins.left
    layout.minimumLineSpacing = 30
    layout.itemSize = CGSize(width: view.frame.width / 2, height: view.frame.height / 2)
    cv.collectionViewLayout = layout
    cv.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
    cv.showsHorizontalScrollIndicator = false
    return cv
  }()
 
  override func viewDidLoad() {
    super.viewDidLoad()
    
    title = "Collection"
    navigationController?.navigationBar.prefersLargeTitles = true
    
    view.addSubview(collectionView)
    collectionView.backgroundColor = #colorLiteral(red: 0.968627451, green: 0.9725490196, blue: 0.9921568627, alpha: 1)
    
    
    
    collectionView.snp.makeConstraints { maker in
                maker.edges.equalToSuperview()
            }
    
    collectionView.delegate = self
    collectionView.dataSource = self
  }

}

extension ViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 15
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
    cell.backgroundColor = .gray
    cell.layer.cornerRadius = 10
    
    return cell
  }
  
  func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
          guard let _ = scrollView as? UICollectionView else { return }
          let x = targetContentOffset.pointee.x
          let calculate = round(x / (view.frame.width / 2 + 30))
          let newX = calculate * (view.frame.width / 2 + 30)
          targetContentOffset.pointee.x = newX
      }
  
}


