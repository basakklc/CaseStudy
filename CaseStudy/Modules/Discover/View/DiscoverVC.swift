//
//  DiscoverVC.swift
//  CaseStudy
//
//  Created by Başak on 1/21/23.
//

import UIKit
import RxSwift
import RxCocoa

class DiscoverVC: BaseVC<DiscoverVM> {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var firstCV: UICollectionView!
    @IBOutlet weak var secondCV: UICollectionView!
    @IBOutlet weak var thirdCV: UICollectionView!
    @IBOutlet weak var thirdCVHeightConst: NSLayoutConstraint!
    
    private let refreshControl = UIRefreshControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        bindViewModel()
        viewModel?.getDiscoverFirst()
        viewModel?.getDiscoverSecond()
        viewModel?.getDiscoverThird()
        
        refreshControl.addTarget(self, action: #selector(refreshHomePage(_:)), for: .valueChanged)
        scrollView.refreshControl = refreshControl
        refreshControl.attributedTitle = NSAttributedString(string: "Yenilemek için çekin")
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        let height = thirdCV.collectionViewLayout.collectionViewContentSize.height
        thirdCVHeightConst.constant = height
        self.view.layoutIfNeeded()
    }
    
    @objc
    func refreshHomePage(_ control: UIRefreshControl) {
        control.beginRefreshing()
        control.attributedTitle = NSAttributedString(string: "Yükleniyor")
        viewModel?.getDiscoverFirst()
        viewModel?.getDiscoverSecond()
        viewModel?.getDiscoverThird()
    }

    func configure() {
        firstCV.rx.setDelegate(self).disposed(by: disposeBag)
        secondCV.rx.setDelegate(self).disposed(by: disposeBag)
        thirdCV.rx.setDelegate(self).disposed(by: disposeBag)
        firstCV.registerCell(cell: WithDiscountCell.self)
        secondCV.registerCell(cell: OnlyPricedCell.self)
        thirdCV.registerCell(cell: WithRateCell.self)
        thirdCV.registerCell(cell: WithDiscountCell.self)
        thirdCV.registerCell(cell: BothDiscountRateCell.self)
    }
    
    func bindViewModel() {
        if let viewModel {
            Observable.zip( viewModel.isFirstLoaded,viewModel.isSecondLoaded, viewModel.isThirdLoaded).subscribe(onNext: { isFirst, isSecond, isThird in
                if isFirst && isSecond && isThird { self.refreshControl.endRefreshing()}
            }).disposed(by: disposeBag)
        }
        
        viewModel?.discoverFirstResponse.bind(to: firstCV.rx.items(cellIdentifier: "WithDiscountCell", cellType: WithDiscountCell.self)) {collectionView, model, cell  in
            cell.setModel(model: model)
        }.disposed(by: disposeBag)
        
        viewModel?.discoverSecondResponse.bind(to: secondCV.rx.items(cellIdentifier: "OnlyPricedCell", cellType: OnlyPricedCell.self)) {collectionView, model, cell  in
            cell.setModel(model: model)
        }.disposed(by: disposeBag)
        
        viewModel?.discoverThirdResponse.bind(to: thirdCV.rx.items){(collectionView, row, model) -> UICollectionViewCell in
            if model.cellType == .bothDiscountRateCell {
                let cell = self.thirdCV.dequeueReusableCell(withReuseIdentifier: BothDiscountRateCell.className, for:  IndexPath(row: row, section: 0)) as! BothDiscountRateCell
                cell.setModel(model: model)
                return cell
            }else if  model.cellType == .withDiscountCell {
                let cell = self.thirdCV.dequeueReusableCell(withReuseIdentifier: WithDiscountCell.className, for:  IndexPath(row: row, section: 0)) as! WithDiscountCell
                cell.setModel(model: model)
                return cell
            }else  {
                let cell = self.thirdCV.dequeueReusableCell(withReuseIdentifier: WithRateCell.className, for: IndexPath(row: row, section: 0)) as! WithRateCell
                cell.setModel(model: model)
                return cell
            }
        }.disposed(by: disposeBag)

    }
}

extension DiscoverVC: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 4.0
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0.0, left: 0.0, bottom: 0.0, right: 0.0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
     
        var itemCount: CGFloat = 1.0
        var widthPerItem: CGFloat = 0.0
        var heightPerItem: CGFloat = 0.0
    
        if collectionView == firstCV || collectionView == secondCV{
            if collectionView == firstCV { itemCount = 2.0 }
            else if collectionView == secondCV { itemCount = 3.0 }
            widthPerItem = (collectionView.bounds.width - (4.0 * itemCount)) / itemCount
            return  CGSize(width: widthPerItem, height: collectionView.frame.height)
        }else {
            let item = viewModel?.discoverThirdResponse.value[indexPath.row]
            itemCount = 2.0
            if item?.cellType == .withRateCell { heightPerItem = UIScreen.main.bounds.height * 0.38}
            else{ heightPerItem = UIScreen.main.bounds.height * 0.29}
            return  CGSize(width: UIScreen.main.bounds.width / itemCount - (4.0 * itemCount) - 10.0, height: heightPerItem)
        }
    }
}
