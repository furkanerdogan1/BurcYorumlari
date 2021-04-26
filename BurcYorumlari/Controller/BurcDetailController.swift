//
//  BurcDetailController.swift
//  BurcYorumlari
//
//  Created by Furkan Erdoğan on 13.04.2021.
//

import UIKit

class BurcDetailController: UIViewController {
    
    var burcBilgileri = [Burc]()
    var burcAdi: String!
    var burcMottosu: String!
    
    var selectedBurcUrl: String!
    var selectedBurcName: String!
    var selectedBurcIconName: String!
    var selectedBurcGezegen: String!
    var selectedBurcElement: String!
    
    //MARK: - Properties
    
    private let beyazView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 8
        
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
        image.image = UIImage(named: selectedBurcUrl)
        image.clipsToBounds = true
        image.setDimensions(width: 80, height: 80)
        
        
        return image
        
    }()
    
    
    
    private lazy var burcIconView: UIImageView = {
        let iw = UIImageView()
        iw.image = UIImage(named: selectedBurcIconName)
        iw.alpha = 0.5
        iw.clipsToBounds = true
        iw.setDimensions(width: 50, height: 50)
        
        return iw
        
    }()
    
    private lazy var mottoLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.text = burcMottosu
        label.font = UIFont(name: "HelveticaNeue-Medium", size: 24)
        label.textAlignment = .center
        label.numberOfLines = 3
        return label
        
    }()
    
    private let gezegenLabel: UILabel = {
        let label = UILabel()
        label.text = "gezegeni"
        label.textColor = .lightGray
        label.font = UIFont(name: "HelveticaNeue-Light", size: 15)
        label.textAlignment = .center
        
        
        return label
        
    }()
    
    private lazy var gezegenAdiLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.text = selectedBurcGezegen
        label.font = UIFont(name: "HelveticaNeue-Medium", size: 20)
        label.textAlignment = .center
        label.numberOfLines = 2
        return label
        
    }()
    
    private let elemetLabel: UILabel = {
        let label = UILabel()
        label.text = "elementi"
        label.textColor = .lightGray
        label.font = UIFont(name: "HelveticaNeue-Light", size: 15)
        label.textAlignment = .center
        
        
        return label
        
    }()
    
    private lazy var elementAdiLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.text = selectedBurcElement
        label.font = UIFont(name: "HelveticaNeue-Medium", size: 20)
        label.textAlignment = .center
        return label
        
    }()
    
    private let mottoAdiLabel: UILabel = {
        let label = UILabel()
        label.text = "mottosu"
        label.textColor = .lightGray
        label.font = UIFont(name: "HelveticaNeue-Light", size: 15)
        label.textAlignment = .center
        
        
        return label
        
    }()
    
    lazy var segmentControl: UISegmentedControl = {
        let scItems = ["günlük","haftalık","aylık","yıllık"]
        let sc = UISegmentedControl(items: scItems)
        
        let font = UIFont(name: "HelveticaNeue-Light", size: 15)!
    
        sc.setTitleTextAttributes([NSAttributedString.Key.font: font, NSAttributedString.Key.foregroundColor: UIColor.black], for: .normal)
        sc.setDimensions(width: beyazView.frame.size.width, height: 30)
        
        
        sc.layer.borderWidth = 1
        sc.layer.borderColor = UIColor.black.cgColor
        sc.selectedSegmentIndex = 0
        sc.selectedSegmentTintColor = .white

        sc.addTarget(self, action: #selector(segmetChanged(_:)), for: .valueChanged)

        return sc
    }()
    
    lazy var yorumlarGunlukTextView: UITextView = {
        let textView = UITextView()
        textView.backgroundColor = .clear
        textView.textColor = .black
        textView.center = self.view.center
        textView.textAlignment = .center
        textView.font = UIFont(name: "HelveticaNeue-Medium", size: 18)
        textView.isEditable = false
        textView.layer.borderWidth = 1
        textView.layer.cornerRadius = 8
        
        
        return textView
        
    }()
    
    lazy var yorumlarHaftalikTextView: UITextView = {
        let textView = UITextView()
        textView.backgroundColor = .clear
        textView.textColor = .black
        textView.center = self.view.center
        textView.textAlignment = .center
        textView.font = UIFont(name: "HelveticaNeue-Medium", size: 18)
        textView.isEditable = false
        textView.layer.borderWidth = 1
        textView.layer.cornerRadius = 8
        
        
        return textView
        
    }()
    
    lazy var yorumlarAylikTextView: UITextView = {
        let textView = UITextView()
        textView.backgroundColor = .clear
        textView.textColor = .black
        textView.center = self.view.center
        textView.textAlignment = .center
        textView.font = UIFont(name: "HelveticaNeue-Medium", size: 18)
        textView.isEditable = false
        textView.layer.borderWidth = 1
        textView.layer.cornerRadius = 8
        
        
        return textView
        
    }()
    
    lazy var yorumlarYillikTextView: UITextView = {
        let textView = UITextView()
        textView.backgroundColor = .clear
        textView.textColor = .black
        textView.center = self.view.center
        textView.textAlignment = .center
        textView.font = UIFont(name: "HelveticaNeue-Medium", size: 18)
        textView.isEditable = false
        textView.layer.borderWidth = 1
        textView.layer.cornerRadius = 8
        
        
        return textView
        
    }()
    
    var years: String! {
        didSet{
            yorumlarHaftalikTextView.text = years
        }
    }
    
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationItem.title = selectedBurcName
        navigationController?.navigationBar.barTintColor = .white
        tabBarController?.tabBar.barTintColor = .white
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "square.and.arrow.up"), style: .done, target: self, action: #selector(shareButtonPressed))
        
        yorumlarGunlukTextView.isHidden = false
        yorumlarHaftalikTextView.isHidden = true
        yorumlarAylikTextView.isHidden = true
        yorumlarYillikTextView.isHidden = true
        
        configureUI()
        fetchApi()
        fetchApiHaftalik()
        fetchApiAylik()
        fetchApiYillik()
    }
    
    
    //MARK: - API
    
    func fetchApi(){
        
        burcBilgileri = []
        
        let url = URL(string: "https://burc-yorumlari.herokuapp.com/get/" + "\(selectedBurcUrl ?? "")")!
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
                                self.burcBilgileri.append(Burc(dictionary: dic))
                                let burcAd = Burc(dictionary: dic)
                                self.mottoLabel.text = burcAd.motto
                                self.yorumlarGunlukTextView.text = burcAd.gunlukYorum
                                
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
    
    func fetchApiHaftalik(){
        
        burcBilgileri = []
        
        
        let url = URL(string: "https://burc-yorumlari.herokuapp.com/get/" + "\(selectedBurcUrl ?? "")/" + "haftalik")!
        print("DEBUG: URLLER \(url)")
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
                                self.burcBilgileri.append(Burc(dictionary: dic))
                                let burcAd = Burc(dictionary: dic)
                                self.yorumlarHaftalikTextView.text = burcAd.haftalikYorum
                                
                                print("DEBUG: DİCTO HAFTA \(dic)")
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
    
    func fetchApiAylik(){
        
        burcBilgileri = []
        
        
        let url = URL(string: "https://burc-yorumlari.herokuapp.com/get/" + "\(selectedBurcUrl ?? "")/" + "aylik")!
        print("DEBUG: URLLER \(url)")
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
                                self.burcBilgileri.append(Burc(dictionary: dic))
                                let burcAd = Burc(dictionary: dic)
                                self.yorumlarAylikTextView.text = burcAd.aylikYorum
                                
                                
                                print("DEBUG: DİCTO AY \(dic)")
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
    
    func fetchApiYillik(){
        
        burcBilgileri = []
        
        
        let url = URL(string: "https://burc-yorumlari.herokuapp.com/get/" + "\(selectedBurcUrl ?? "")/" + "yillik")!
        print("DEBUG: URLLER \(url)")
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
                                self.burcBilgileri.append(Burc(dictionary: dic))
                                let burcAd = Burc(dictionary: dic)
                                self.yorumlarYillikTextView.text = burcAd.yillikYorum
                                print("DEBUG: DİCTO YILLIK \(dic)")
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
    
    
    
    //MARK: -  Helper
    
    @objc func shareButtonPressed(){
        
        let text = "\(selectedBurcName ?? "")" + " burcunun " + "\(selectedBurcGezegen ?? "")" + " hakkındaki yorumuna bir göz at.\n\n" + "\(yorumlarGunlukTextView.text ?? "")"
        

                // set up activity view controller
        let textToShare = [ text ]
        let activityViewController = UIActivityViewController(activityItems: textToShare as [Any], applicationActivities: nil)
                activityViewController.popoverPresentationController?.sourceView = self.view // so that iPads won't crash

                // exclude some activity types from the list (optional)
        activityViewController.excludedActivityTypes = [ .airDrop, .postToTwitter,  UIActivity.ActivityType.postToFacebook ]

                // present the view controller
                self.present(activityViewController, animated: true, completion: nil)
        
    }
    
    @objc func segmetChanged(_ sender: UISegmentedControl){
        
        
        if sender.selectedSegmentIndex == 0 {
            yorumlarGunlukTextView.isHidden = false
            yorumlarHaftalikTextView.isHidden = true
            yorumlarAylikTextView.isHidden = true
            yorumlarYillikTextView.isHidden = true
            
        }else if sender.selectedSegmentIndex == 1 {
            yorumlarGunlukTextView.isHidden = true
            yorumlarHaftalikTextView.isHidden = false
            yorumlarAylikTextView.isHidden = true
            yorumlarYillikTextView.isHidden = true
            
        }else if sender.selectedSegmentIndex == 2 {
            yorumlarGunlukTextView.isHidden = true
            yorumlarHaftalikTextView.isHidden = true
            yorumlarYillikTextView.isHidden = true
            yorumlarAylikTextView.isHidden = false

        }else {
            yorumlarGunlukTextView.isHidden = true
            yorumlarHaftalikTextView.isHidden = true
            yorumlarAylikTextView.isHidden = true
            yorumlarYillikTextView.isHidden = false

        }
            
        
        
        
    }
    
    func configureUI(){
        
        addBackgroundGradient()
        
        view.addSubview(burcIconView)
        burcIconView.centerX(inView: view, topAnchor: view.safeAreaLayoutGuide.topAnchor, paddingTop: 20)
        
        view.addSubview(beyazView)
        beyazView.anchor(top: burcIconView.bottomAnchor, left: view.leftAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, right: view.rightAnchor, paddingTop: 65,paddingLeft: 10, paddingBottom: 20,  paddingRight: 10, width: view.frame.size.width-100)
        
        beyazView.addSubview(burcImageViewBos)
        burcImageViewBos.centerX(inView: beyazView, topAnchor: beyazView.topAnchor, paddingTop: -50)
        
        beyazView.addSubview(burcImageView)
        burcImageView.centerX(inView: beyazView, topAnchor: beyazView.topAnchor, paddingTop: -35)
        
        beyazView.addSubview(gezegenLabel)
        gezegenLabel.anchor(top: beyazView.topAnchor, left: beyazView.leftAnchor, right: burcImageViewBos.leftAnchor, paddingTop: 5, paddingLeft: 0)
        
        beyazView.addSubview(gezegenAdiLabel)
        gezegenAdiLabel.anchor(top: gezegenLabel.bottomAnchor, left: beyazView.leftAnchor, right: burcImageViewBos.leftAnchor, paddingTop: 5)
        
        beyazView.addSubview(elemetLabel)
        elemetLabel.anchor(top: beyazView.topAnchor, left: burcImageViewBos.rightAnchor, right: beyazView.rightAnchor, paddingTop: 5, paddingRight: 0)
        
        beyazView.addSubview(elementAdiLabel)
        elementAdiLabel.anchor(top: elemetLabel.bottomAnchor, left: burcImageViewBos.rightAnchor, right: beyazView.rightAnchor, paddingTop: 5, paddingRight: 0)
        
        beyazView.addSubview(mottoAdiLabel)
        mottoAdiLabel.anchor(top: elementAdiLabel.topAnchor, left: beyazView.leftAnchor, right: beyazView.rightAnchor, paddingTop: 35)
        
        beyazView.addSubview(mottoLabel)
        mottoLabel.anchor(top: mottoAdiLabel.bottomAnchor, left: beyazView.leftAnchor, right: beyazView.rightAnchor, paddingTop: 5)
        
        beyazView.addSubview(segmentControl)
        segmentControl.anchor(top: mottoLabel.bottomAnchor, left: beyazView.leftAnchor, right: beyazView.rightAnchor, paddingTop: 10, paddingLeft: 10, paddingRight: 10)
        
        beyazView.addSubview(yorumlarGunlukTextView)
        yorumlarGunlukTextView.anchor(top: segmentControl.bottomAnchor, left: beyazView.leftAnchor,bottom: beyazView.bottomAnchor,  right: beyazView.rightAnchor, paddingTop: 10, paddingLeft: 10, paddingBottom: 5, paddingRight: 10)
        
        beyazView.addSubview(yorumlarHaftalikTextView)
        yorumlarHaftalikTextView.anchor(top: segmentControl.bottomAnchor, left: beyazView.leftAnchor,bottom: beyazView.bottomAnchor, right: beyazView.rightAnchor, paddingTop: 10, paddingLeft: 10, paddingBottom: 5, paddingRight: 10)
        
        beyazView.addSubview(yorumlarAylikTextView)
        yorumlarAylikTextView.anchor(top: segmentControl.bottomAnchor, left: beyazView.leftAnchor,bottom: beyazView.bottomAnchor,  right: beyazView.rightAnchor, paddingTop: 10, paddingLeft: 10, paddingBottom: 5, paddingRight: 10)
        
        beyazView.addSubview(yorumlarYillikTextView)
        yorumlarYillikTextView.anchor(top: segmentControl.bottomAnchor, left: beyazView.leftAnchor, bottom: beyazView.bottomAnchor, right: beyazView.rightAnchor, paddingTop: 10, paddingLeft: 10, paddingBottom: 5, paddingRight: 10)
        
        
        
        
        
        
        
        
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
