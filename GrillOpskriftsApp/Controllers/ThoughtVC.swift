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
    
    @IBOutlet private weak var categorySelected: UISegmentedControl!
    @IBOutlet private weak var usernameTxt: UITextField!
    @IBOutlet private weak var thoughtTxt: UITextView!
    @IBOutlet private weak var pushBtn: UIButton!
    
    //Variables
    private var selectedCategory = ThoughtCategory.funny.rawValue

    override func viewDidLoad() {
        super.viewDidLoad()
        usernameTxt.layer.cornerRadius = 4
        thoughtTxt.layer.cornerRadius = 4
        thoughtTxt.text = "Skriv noget her"
        thoughtTxt.textColor = UIColor.lightGray
        thoughtTxt.delegate = self

        // Do any additional setup after loading the view.
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        textView.text = ""
        textView.textColor = UIColor.darkGray
    }
    
    @IBAction func categoryCanged(_ sender: Any) {
        switch categorySelected.selectedSegmentIndex {
        case 0: selectedCategory = ThoughtCategory.funny.rawValue
        case 1: selectedCategory = ThoughtCategory.serious.rawValue
        default:
            selectedCategory = ThoughtCategory.crazy.rawValue
        }
    }
    
    @IBAction func pushBtnTapped(_ sender: Any) {
        guard let username = usernameTxt.text else { return }
        Firestore.firestore().collection(THOUGHTS_REF).addDocument(data: [
            CATEGORY : selectedCategory,
            NUM_COMMENTS : 0,
            NUM_LIKES : 0,
            THOUGHT_TXT : thoughtTxt.text!,
            TIMESTAMP : FieldValue.serverTimestamp(),
            USERNAME : username
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
