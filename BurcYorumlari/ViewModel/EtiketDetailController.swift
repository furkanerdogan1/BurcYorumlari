//
//  EtiketDetailController.swift
//  BurcYorumlari
//
//  Created by Furkan Erdoğan on 18.04.2021.
//

import UIKit

class EtiketDetailController: UIViewController {
    //MARK: - Properties
    
    var etiketBilgileri = [Etiket]()
    
    var selectedEtiketUrl: String!
    var selectedBurcUrl: String!
    
    var etiket: EtiketData? {
        didSet{
            guard let etiketUrl = etiket?.etiketUrl else {return}
            
            
        }
    }
    
    private let beyazView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 8
        view.setDimensions(width: 200, height: 500)
        
        return view
    }()
    
    lazy var burcImageViewBos: UIImageView = {
        let image = UIImageView()
        
        
        image.contentMode = .scaleAspectFit
        image.clipsToBounds = true
        image.backgroundColor = UIColor(red: 0.16, green: 0.16, blue: 1.00, alpha: 1.00)
        image.setDimensions(width: 110, height: 110)
        image.layer.cornerRadius = 110 / 2
        image.layer.borderWidth = 1
        image.layer.borderColor = UIColor.white.cgColor
        
        
        return image
        
    }()
    
    lazy var burcImageView: UIImageView = {
        let image = UIImageView()
        
        
        image.contentMode = .scaleAspectFit
        image.clipsToBounds = true
        image.setDimensions(width: 80, height: 80)
        
        
        return image
        
    }()
    
     lazy var etiketYorumTextView: UITextView = {
        let textView = UITextView()
        textView.backgroundColor = .white
        textView.textColor = .black
        textView.center = self.view.center
        textView.textAlignment = .center
        textView.font = UIFont(name: "HelveticaNeue-Medium", size: 18)
        textView.isEditable = false
        textView.layer.borderWidth = 1
        textView.layer.cornerRadius = 8
        
        
        
        return textView
    }()
    
    private let baslikAdiLabel: UILabel = {
        let label = UILabel()
        label.text = "başlık"
        label.textColor = .lightGray
        label.font = UIFont(name: "HelveticaNeue-Light", size: 15)
        label.textAlignment = .center
        
        
        return label
        
    }()
    
    private lazy var baslikLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont(name: "HelveticaNeue-Medium", size: 18)
        label.textAlignment = .center
        label.numberOfLines = 10
        return label
        
    }()
    
    private let yorumAdiLabel: UILabel = {
        let label = UILabel()
        label.text = "yorum"
        label.textColor = .lightGray
        label.font = UIFont(name: "HelveticaNeue-Light", size: 15)
        label.textAlignment = .center
        
        
        return label
        
    }()
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        fetchApi()
        
        print("DEBUG: SELECTED BURC \(selectedBurcUrl ?? "olmadı")")
        
    }
    
    //MARK: - API
    
    func fetchApi(){
        
        etiketBilgileri = []
        
        let url = URL(string: "https://burc-yorumlari.herokuapp.com/gets/" + "\(selectedBurcUrl ?? "")" + "/" + "\(selectedEtiketUrl ?? "")")!
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            if let error = error {
                print("DEBUG: \(error)")
            }else{
                if let response = response as? HTTPURLResponse {
                    print("DEBUG: Status Code \(response.statusCode)")
                }
                
                do {
                    if let json = try JSONSerialization.jsonObject(with: data!, options: []) as?  [[String: Any]] {
                        print("DEBUG: Json verileri \(json)")
                        
                        
                        
                        DispatchQueue.main.async {
                            for dic in json {
                                self.etiketBilgileri.append(Etiket(dictionary: dic))
                                let burcAd = Etiket(dictionary: dic)
                                self.etiketYorumTextView.text = burcAd.etiket
                                self.baslikLabel.text = burcAd.baslık
                                
                            }
                        }
                    }
                }
                catch let error as NSError {
                    print("DEBUG: Error \(error.localizedDescription)")
                }
            }
        }
        task.resume()
        
        }
    
    //MARK: - Helpers
    
    func configureUI() {
        addBackgroundGradient()
        
        view.addSubview(beyazView)
        beyazView.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, right: view.rightAnchor, paddingTop: 60, paddingLeft: 20, paddingBottom: 20, paddingRight: 20)
        
        beyazView.addSubview(burcImageViewBos)
        burcImageViewBos.centerX(inView: beyazView, topAnchor: beyazView.topAnchor, paddingTop: -50)
        
        beyazView.addSubview(burcImageView)
        burcImageView.centerX(inView: beyazView, topAnchor: beyazView.topAnchor, paddingTop: -35)
        
        beyazView.addSubview(baslikAdiLabel)
        baslikAdiLabel.anchor(top: burcImageViewBos.bottomAnchor, left: beyazView.leftAnchor, right: beyazView.rightAnchor, paddingTop: 5)
        
        beyazView.addSubview(baslikLabel)
        baslikLabel.anchor(top: baslikAdiLabel.bottomAnchor, left: beyazView.leftAnchor, right: beyazView.rightAnchor, paddingTop: 5, paddingLeft: 10, paddingRight: 10)
        
        beyazView.addSubview(yorumAdiLabel)
        yorumAdiLabel.anchor(top: baslikLabel.bottomAnchor, left: beyazView.leftAnchor, right: beyazView.rightAnchor, paddingTop: 5)
        
        beyazView.addSubview(etiketYorumTextView)
        etiketYorumTextView.anchor(top: yorumAdiLabel.bottomAnchor, left: beyazView.leftAnchor, bottom: beyazView.bottomAnchor, right: beyazView.rightAnchor, paddingTop: 5, paddingLeft: 10, paddingBottom: 5, paddingRight: 10)
        
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
