//
//  ThoughtVC.swift
//  GrillOpskriftsApp
//
//  Created by Bent Lundgren on 22/05/2019.
//  Copyright © 2019 Bent Lundgren. All rights reserved.
//

import UIKit
import Firebase

class ThoughtVC: UIViewController, UITextViewDelegate {
    
    //Outlets
    
    @IBOutlet weak var categorySelected: UISegmentedControl!
    @IBOutlet weak var usernameTxt: UITextField!
    @IBOutlet weak var thoughtTxt: UITextView!
    @IBOutlet weak var pushBtn: UIButton!
    
    //Variables
    private var selectedCategory = "funny"

    override func viewDidLoad() {
        super.viewDidLoad()
        usernameTxt.layer.cornerRadius = 4
        thoughtTxt.layer.cornerRadius = 4
        thoughtTxt.textColor = .lightGray
        thoughtTxt.delegate = self

        // Do any additional setup after loading the view.
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        thoughtTxt.text = ""
        thoughtTxt.textColor = .darkGray
    }
    
    @IBAction func categoryCanged(_ sender: Any) {
    }
    
    @IBAction func pushBtnTapped(_ sender: Any) {
        Firestore.firestore().collection("thought").addDocument(data: [
            "category" : selectedCategory,
            "numComments" : 0,
            "numLikes" : 0,
            "thoughtTxt" : thoughtTxt.text!,
            "dateStamps" : FieldValue.serverTimestamp(),
            "userNameTxt" : usernameTxt.text!
        ]) { (err) in
            if let err = err {
                debugPrint("Der er fejl på denne: \(err)")
            } else {
                self.navigationController?.popViewController(animated: true)
            }
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
