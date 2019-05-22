//
//  ThoughtVC.swift
//  GrillOpskriftsApp
//
//  Created by Bent Lundgren on 22/05/2019.
//  Copyright © 2019 Bent Lundgren. All rights reserved.
//

import UIKit

class ThoughtVC: UIViewController, UITextViewDelegate {
    
    @IBOutlet weak var categorySelected: UISegmentedControl!
    @IBOutlet weak var usernameTxt: UITextField!
    @IBOutlet weak var thoughtTxt: UITextView!
    @IBOutlet weak var pushBtn: UIButton!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        usernameTxt.layer.cornerRadius = 4
        thoughtTxt.layer.cornerRadius = 4
        thoughtTxt.textColor = .lightGray
        thoughtTxt.delegate = self

        // Do any additional setup after loading the view.
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
