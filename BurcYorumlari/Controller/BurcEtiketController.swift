//
//  BilinmeyenController.swift
//  BurcYorumlari
//
//  Created by Furkan Erdoğan on 16.04.2021.
//

import UIKit


private let reuseIdentifer = "EtiketCell"


class BurcEtiketController: UICollectionViewController {
    
    
    
    //MARK: - Properties
    
    var selectedBurcUrl: String?
    var selectedBurName: String?
    
    var burcEtiketler = [EtiketData(etiketName: "Aşk", etiketUrl: "ask", etiketImage: "ask"),
                        EtiketData(etiketName: "Kariyer\n", etiketUrl: "kariyer", etiketImage: "kariyer"),
                        EtiketData(etiketName: "Kadını", etiketUrl: "kadini", etiketImage: "kadini"),
                        EtiketData(etiketName: "Erkeği\n", etiketUrl: "erkegi", etiketImage: "erkegi"),
                        EtiketData(etiketName: "Olumlu Yönler", etiketUrl: "olumlu-yonler", etiketImage: "olumluyonler"),
                        EtiketData(etiketName: "Stil", etiketUrl: "stil", etiketImage: "stil"),
                        EtiketData(etiketName: "Diyet\n", etiketUrl: "diyet", etiketImage: "diyet"),
                        EtiketData(etiketName: "Zıt Burçlar", etiketUrl: "zit-burclari", etiketImage: "zitburclari"),
                        EtiketData(etiketName: "Makyaj\n", etiketUrl: "makyaj", etiketImage: "makyaj"),
                        EtiketData(etiketName: "Film Önerileri", etiketUrl: "film-onerileri", etiketImage: "filmonerileri"),
                        EtiketData(etiketName: "Çocukluğu", etiketUrl: "cocuklugu", etiketImage: "cocuklugu"),
                        EtiketData(etiketName: "Eğlence Hayatı\n", etiketUrl: "eglence-hayati", etiketImage: "eglencehayati"),]
    
   // let burclar = ["Koç","Boğa","İkizler","Yengeç","Aslan", "Başak", "Terazi", "Akrep", "Yay", "Oğlak", "Kova", "Balık"]
    
    let burclar = [BurcPicker(burcNameName: "Koç", burcUrl: "koc"),
                    BurcPicker(burcNameName: "Boğa", burcUrl: "boga"),
                    BurcPicker(burcNameName: "İkizler", burcUrl: "ikizler"),
                    BurcPicker(burcNameName: "Yengeç", burcUrl: "yengec"),
                    BurcPicker(burcNameName: "Aslan", burcUrl: "aslan"),
                    BurcPicker(burcNameName: "Başak", burcUrl: "basak"),
                    BurcPicker(burcNameName: "Terazi", burcUrl: "terazi"),
                    BurcPicker(burcNameName: "Akrep", burcUrl: "akrep"),
                    BurcPicker(burcNameName: "Yay", burcUrl: "yay"),
                    BurcPicker(burcNameName: "Oğlak", burcUrl: "oglak"),
                    BurcPicker(burcNameName: "Kova", burcUrl: "kova"),
                    BurcPicker(burcNameName: "Balık", burcUrl: "balik"),]
    
    private lazy var grayView: UIView = {
        let view = UIView()
        view.setDimensions(width: view.frame.size.width  , height: 60)
        view.backgroundColor = UIColor(red: 0.00, green: 0.00, blue: 1.00, alpha: 1.00)
        

        
        return view
    }()
    
    
    private lazy var pickerTextField: UITextField = {
        
        let textField = UITextField()
        textField.setDimensions(width: 200 , height: 60)
        textField.textAlignment = .center
        textField.backgroundColor = .white
        textField.textColor = .black
        textField.layer.borderWidth = 1
        textField.layer.cornerRadius = 8
        textField.attributedPlaceholder = NSAttributedString(string: "Lütfen bir burç seçin", attributes: [.foregroundColor : UIColor.lightGray])
        textField.font = UIFont(name: "HelveticaNeue-Medium", size: 24)
        
        
        return textField
    }()
    
    private lazy var burcPicker: UIPickerView = {
        let picker = UIPickerView()
        picker.backgroundColor = .clear
        picker.tintColor = .blue
        picker.largeContentImage = UIImage(named: "kariyer")
        picker.setDimensions(width: view.frame.size.width, height: 330)
        
        pickerTextField.inputView = picker
        
        
        return picker
    }()
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.black]
        tabBarController?.tabBar.barTintColor = .white
        
        view.addSubview(grayView)
        grayView.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, right: view.rightAnchor)
        
        grayView.addSubview(pickerTextField)
        pickerTextField.anchor(top: grayView.topAnchor, left: grayView.leftAnchor, bottom: grayView.bottomAnchor, right: grayView.rightAnchor, paddingTop: 5, paddingLeft: 10, paddingBottom: 5, paddingRight: 10)
        
        view.addSubview(collectionView)
        collectionView.anchor(top: grayView.bottomAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor)
        
        configureUI()
        
        burcPicker.delegate = self
        burcPicker.dataSource = self
        
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
        
        navigationItem.title = "Etiketler"
        collectionView.register(EtiketCell.self, forCellWithReuseIdentifier: reuseIdentifer)
        addBackgroundGradient()
        
        
        
    }
    
    private func addBackgroundGradient() {
      let collectionViewBackgroundView = UIView()
      let gradientLayer = CAGradientLayer()
      gradientLayer.frame.size = view.frame.size
      // Start and end for left to right gradient
      gradientLayer.startPoint = CGPoint(x: 0.5, y: 1.0)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 0.0)
      gradientLayer.colors = [UIColor.twitterBlue.cgColor,
                              UIColor.blue.cgColor]
      collectionView.backgroundView = collectionViewBackgroundView
      collectionView.backgroundView?.layer.addSublayer(gradientLayer)
    
    }
}

// MARK: - UICollectionViewDelegate/Datasource

extension BurcEtiketController {
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return burcEtiketler.count
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifer, for: indexPath) as! EtiketCell
        
        cell.etiket = burcEtiketler[indexPath.item]
        
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if pickerTextField.text != "" {
            let vc = EtiketDetailController()
            navigationController?.pushViewController(vc, animated: true)
            vc.navigationItem.title = burcEtiketler[indexPath.row].etiketName
            vc.burcImageView.image = UIImage(named: burcEtiketler[indexPath.row].etiketImage)
            vc.selectedEtiketUrl = burcEtiketler[indexPath.row].etiketUrl
            vc.selectedEtiketName = burcEtiketler[indexPath.row].etiketName
            vc.selectedBurcUrl = selectedBurcUrl
            vc.selectedBurcName = selectedBurName
        }else {
            let alert = UIAlertController(title: "Burç seçmelisin!", message: "Yorumları görmek için önce bir burç seç.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Tamam", style: .cancel, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
}

// MARK: - UICollectionViewDelegateFlow

extension BurcEtiketController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: (view.frame.size.width / 4) + 10, height: 180)
    }
    
    
    
}

extension BurcEtiketController: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return burclar.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return burclar[row].burcNameName
    }
    
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        return NSAttributedString(string: burclar[row].burcNameName, attributes: [.foregroundColor : UIColor.black])
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        pickerTextField.text = burclar[row].burcNameName
        pickerTextField.resignFirstResponder()
        
        selectedBurcUrl = burclar[row].burcUrl
        selectedBurName = burclar[row].burcNameName
        
    }
    
    
}


