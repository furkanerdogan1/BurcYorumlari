//
//  Burc.swift
//  BurcYorumlari
//
//  Created by Furkan Erdoğan on 11.04.2021.
//

import UIKit

struct Burc {
    let burc: String
    let motto: String
    let gezegen: String
    let element: String
    var gunlukYorum: String
    var haftalikYorum: String
    var aylikYorum: String
    var yillikYorum: String
    var etiketYorum: String
    
    
    init(dictionary: [String: Any]) {
        self.burc = dictionary["Burc"] as? String ?? ""
        self.motto = dictionary["Mottosu"] as? String ?? ""
        self.gezegen = dictionary["Gezegeni"] as? String ?? ""
        self.element = dictionary["Elementi"] as? String ?? ""
        self.gunlukYorum = dictionary["GunlukYorum"] as? String ?? ""
        self.haftalikYorum = dictionary["Yorum"] as? String ?? ""
        self.aylikYorum = dictionary["Yorum"] as? String ?? ""
        self.yillikYorum = dictionary["Yorum"] as? String ?? ""
        self.etiketYorum = dictionary["Yorum"] as? String ?? ""
    }
    
}

struct Etiket {
    let etiket: String
    let baslık: String
    
    
    init(dictionary: [String: Any]) {
        self.etiket = dictionary["Yorum"] as? String ?? ""
        self.baslık = dictionary["Baslik"] as? String ?? ""
        
    }
    
}

struct CreateBurc{
    let burcName: String
    let burcImage: String
    let burcGezegeni: String
    let burcElementi: String
    let burcIcon: String
}

struct EtiketData {
    let etiketName: String
    let etiketUrl: String
    let etiketImage: String
    
}

struct BurcPicker {
    let burcNameName: String
    let burcUrl: String
    
}











