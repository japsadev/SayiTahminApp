//
//  TahminEkraniVC.swift
//  SayiTahminApp
//
//  Created by Salih Yusuf Göktaş on 13.03.2023.
//

import UIKit

class TahminEkraniVC: UIViewController {

    @IBOutlet weak var labelKalanHak: UILabel!
    @IBOutlet weak var labelYardim: UILabel!
    @IBOutlet weak var textfieldGirdi: UITextField!
    
    var rasgeleSayi:Int?
    var kalanHak = 5
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        rasgeleSayi = Int.random(in: 0...100)//0 - 100
        
        print("Rasgele Sayı : \(rasgeleSayi!)")

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let gelenVeri = sender as? Bool {
            //Veri transferi için kodlama
            let gidilecekVC = segue.destination as! SonucEkraniVC
            
            gidilecekVC.sonuc = gelenVeri
            
        }
        
    }

    @IBAction func tahminet(_ sender: Any) {
        labelYardim.isHidden = false
        kalanHak-=1//Her tahminde bir azalacak
        
        if let veri = textfieldGirdi.text {//Textfield üzerinden veri kontrol edilerek alınır
            
            if let tahmin = Int(veri) {//String ifadeyi kontrol ederek int ifadeye dönüştürürüz.
                
                if tahmin == rasgeleSayi! {//Tahmin rasgele sayıya eşitse kazanılır.
                    let sonuc = true
                    performSegue(withIdentifier: "tahminTosonuc", sender: sonuc)//Kazanılırsa sayfa geçişi ve veri transferi
                    return//Kazandıktan işlem yapmaması için return kullandık.
                    //return buttonun çalışmasını durdurur ve return ifadesinin yer aldığı satırdan sonraki kodlamalar çalışmaz.
                }
                
                if tahmin > rasgeleSayi! {//Tahmin edilen sayı büyük ise
                    labelYardim.text = "Azalt"
                    labelKalanHak.text = "Kalan Hak : \(kalanHak)"
                }
               
                if tahmin < rasgeleSayi! {//Tahmin edilen sayı küçük ise
                    labelYardim.text = "Arttır"
                    labelKalanHak.text = "Kalan Hak : \(kalanHak)"
                }
                
                if(kalanHak == 0){//Tahmin hakkı kalmaz ise
                    let sonuc = false
                    performSegue(withIdentifier: "tahminTosonuc", sender: sonuc)
                    //Haklar bitince sayfa geçişi ve veri transferi
                }
                
                textfieldGirdi.text = ""
            }
        }
    }
}
