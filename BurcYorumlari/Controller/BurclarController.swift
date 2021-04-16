//
//  BurclarController.swift
//  BurcYorumlari
//
//  Created by Furkan Erdoğan on 10.04.2021.
//

import UIKit

private let reuseIdentifer = "BurcCell"


class BurclarController: UICollectionViewController {
    
    //MARK: - Properties
    
    var burclar = [CreateBurc(burcName: "Koç", burcImage: "koc", burcGezegeni: "Mars", burcElementi: "Ateş", burcIcon: "kocIcon"),
                   CreateBurc(burcName: "Boğa", burcImage: "boga", burcGezegeni: "Venüs",burcElementi: "Toprak", burcIcon: "bogaIcon"),
                   CreateBurc(burcName: "İkizler", burcImage: "ikizler", burcGezegeni: "Merkür", burcElementi: "Hava", burcIcon: "ikizlerIcon"),
                   CreateBurc(burcName: "Yengeç", burcImage: "yengec", burcGezegeni: "Ay", burcElementi: "Su", burcIcon: "yengecIcon"),
                   CreateBurc(burcName: "Aslan", burcImage: "aslan", burcGezegeni: "Güneş", burcElementi: "Ateş", burcIcon: "aslanIcon"),
                   CreateBurc(burcName: "Başak", burcImage: "basak", burcGezegeni: "Merkür", burcElementi: "Toprak", burcIcon: "basakIcon"),
                   CreateBurc(burcName: "Terazi", burcImage: "terazi", burcGezegeni: "Venüs", burcElementi: "Hava", burcIcon: "teraziIcon"),
                   CreateBurc(burcName: "Akrep", burcImage: "akrep", burcGezegeni: "Mars/Plüton", burcElementi: "Su", burcIcon: "akrepIcon"),
                   CreateBurc(burcName: "Yay", burcImage: "yay", burcGezegeni: "Jüpiter", burcElementi: "Ateş", burcIcon: "yayIcon"),
                   CreateBurc(burcName: "Oğlak", burcImage: "oglak", burcGezegeni: "Satürn", burcElementi: "Toprak", burcIcon: "oglakIcon"),
                   CreateBurc(burcName: "Kova", burcImage: "kova", burcGezegeni: "Uranüs", burcElementi: "Hava", burcIcon: "kovaIcon"),
                   CreateBurc(burcName: "Balık", burcImage: "balik", burcGezegeni: "Neptün\nJüpiter", burcElementi: "Su", burcIcon: "balikIcon")]
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.black]
        tabBarController?.tabBar.barTintColor = .white
        
        configureUI()
        
        for family: String in UIFont.familyNames
                {
                    print(family)
                    for names: String in UIFont.fontNames(forFamilyName: family)
                    {
                        print("DEBUG: FONT \(names)")
                    }
                }
        
        
    }
    
    
    
    
    // MARK: - API
    
    
    
    
    // MARK: - Helpers
    
    func configureUI(){
        
        navigationItem.title = "Burçlar"
        collectionView.register(BurcCell.self, forCellWithReuseIdentifier: reuseIdentifer)
        addBackgroundGradient()
        
        
        
    }
    
    private func addBackgroundGradient() {
      let collectionViewBackgroundView = UIView()
      let gradientLayer = CAGradientLayer()
      gradientLayer.frame.size = view.frame.size
      // Start and end for left to right gradient
      gradientLayer.startPoint = CGPoint(x: 0.5, y: 1.0)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 0.0)
      gradientLayer.colors = [UIColor.blue.cgColor,
                              UIColor.twitterBlue.cgColor]
      collectionView.backgroundView = collectionViewBackgroundView
      collectionView.backgroundView?.layer.addSublayer(gradientLayer)
    }
}

// MARK: - UICollectionViewDelegate/Datasource

extension BurclarController {
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return burclar.count
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifer, for: indexPath) as! BurcCell
        
        cell.burc = burclar[indexPath.item]
        
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let vc = BurcDetailController()
        vc.selectedBurcUrl = burclar[indexPath.row].burcImage
        vc.selectedBurcIconName = burclar[indexPath.row].burcIcon
        vc.selectedBurcName = burclar[indexPath.row].burcName
        vc.selectedBurcGezegen = burclar[indexPath.row].burcGezegeni
        vc.selectedBurcElement = burclar[indexPath.row].burcElementi
        
        navigationController?.pushViewController(vc, animated: true)
        
        
    }
}

// MARK: - UICollectionViewDelegateFlow

extension BurclarController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: 123, height: 160)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        CGFloat(10)
    }
}


