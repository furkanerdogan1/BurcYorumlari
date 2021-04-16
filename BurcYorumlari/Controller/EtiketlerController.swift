//
//  InfoController.swift
//  BurcYorumlari
//
//  Created by Furkan Erdoğan on 10.04.2021.
//

import UIKit

private let reuseIdentifer = "EtiketCell"


class EtiketlerController: UIViewController {
    
    var data = [CreateBurc(burcName: "Koç", burcImage: "koc", burcGezegeni: "Mars", burcElementi: "Ateş", burcIcon: "kocIcon"),
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
    
    
    
    fileprivate let collectionView:UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.register(CustomCell.self, forCellWithReuseIdentifier: "cell")
        return cv
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        addBackgroundGradient()
        
        
        view.addSubview(collectionView)
        collectionView.backgroundColor = .clear
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, right: view.rightAnchor, paddingTop: 20, paddingLeft: 10, paddingBottom: 20, paddingRight: 10)
        
        
    }
    
    private func addBackgroundGradient() {
      let collectionViewBackgroundView = UIView()
      let gradientLayer = CAGradientLayer()
      gradientLayer.frame.size = view.frame.size
      // Start and end for left to right gradient
      gradientLayer.startPoint = CGPoint(x: 0.5, y: 0.0)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 1.0)
      gradientLayer.colors = [UIColor.blue.cgColor,
                              UIColor.twitterBlue.cgColor]
      view = collectionViewBackgroundView
      view.layer.addSublayer(gradientLayer)
    }

}



extension EtiketlerController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 374, height: 500)
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CustomCell
        cell.data = self.data[indexPath.row]
        cell.selectedBurcName = data[indexPath.row].burcName
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = BilinmeyenController()
        navigationController?.pushViewController(vc, animated: true)
    }
}



