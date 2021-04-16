//
//  EtiketlerCell.swift
//  BurcYorumlari
//
//  Created by Furkan Erdoğan on 16.04.2021.
//

import UIKit

class CustomCell: UICollectionViewCell {
    
    var data: CreateBurc? {
        didSet {
            guard let data = data else { return }
            bg.image = UIImage(named: data.burcImage)
            
        }
    }
    
    var selectedBurcName: String!
    
    private let beyazView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.setDimensions(width: 374, height: 500)
        view.layer.cornerRadius = 12
        
        return view
    }()
    
    fileprivate let bg: UIImageView = {
       let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.setDimensions(width: 90, height: 90)
        iv.clipsToBounds = true
        iv.backgroundColor = .white
        iv.layer.cornerRadius = 12
        return iv
    }()
    
    private lazy var tagButton: UIButton = {
        let button = UIButton()
        button.setTitle("Para", for: .normal)
        button.backgroundColor = .blue
        button.addTarget(self, action: #selector(butonaTiklandi), for: .touchUpInside)
        
        
        return button
    }()
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        

        addSubview(beyazView)

        beyazView.anchor(top: topAnchor, left: leftAnchor, bottom: safeAreaLayoutGuide.bottomAnchor, right: rightAnchor, paddingTop: 10, paddingLeft: 20, paddingBottom: 0, paddingRight: 20)
        
        beyazView.addSubview(bg)
        bg.anchor(top: beyazView.topAnchor, left: beyazView.leftAnchor, right: beyazView.rightAnchor, paddingTop: 10)
        beyazView.addSubview(tagButton)
        tagButton.anchor(top: bg.bottomAnchor, left: beyazView.leftAnchor, right: beyazView.rightAnchor)

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func butonaTiklandi(){
        
        
        
    }
}
