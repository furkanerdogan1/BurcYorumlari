//
//  BurcCell.swift
//  BurcYorumlari
//
//  Created by Furkan Erdoğan on 10.04.2021.
//

import UIKit

class BurcCell: UICollectionViewCell {
    //MARK: - Properties
    
    
    var burc: CreateBurc? {
        didSet{
            guard let burcName = burc?.burcName else {return}
            guard let burcImage = burc?.burcImage else {return}
            
            burcLabel.text = burcName
            burcImageView.image = UIImage(named: burcImage)
            
        }
    }
    
    
    var selectedBurcName: String!
    
    
    lazy var burcImageView: UIImageView = {
        let image = UIImageView()
        
        image.contentMode = .scaleToFill
        image.clipsToBounds = true
        image.backgroundColor = .clear
        image.setDimensions(width: 90, height: 90)
        
        
        return image
        
    }()
    
    private let burcLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "SignPainter", size: 32)
        label.numberOfLines = 3
        label.textColor = .white
        label.textAlignment = .center
        
        
        return label
        
    }()
    
    
    
    //MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = UIColor.clear
        
        addSubview(burcImageView)
        burcImageView.layer.cornerRadius = 5
        burcImageView.anchor(top: topAnchor, left: leftAnchor,  paddingTop: 10, paddingLeft: 20)
        addSubview(burcLabel)
        burcLabel.anchor(top: burcImageView.bottomAnchor, left: leftAnchor, right: rightAnchor, paddingTop: 15)
        
        let underLineView = UIView()
        underLineView.backgroundColor = .systemGroupedBackground
        addSubview(underLineView)
        underLineView.anchor(left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, height: 1)
        
        let underLineView2 = UIView()
        underLineView.backgroundColor = .systemGroupedBackground
        addSubview(underLineView2)
        underLineView.anchor(left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingLeft: 10, height: 2)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
