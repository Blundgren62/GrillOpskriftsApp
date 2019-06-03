//
//  ThoughtCell.swift
//  GrillOpskriftsApp
//
//  Created by Bent Lundgren on 02/06/2019.
//  Copyright © 2019 Bent Lundgren. All rights reserved.
//

import UIKit

class ThoughtCell: UITableViewCell {
    
    // Outlets
    
    @IBOutlet weak var usernameLbl: UILabel!
    @IBOutlet weak var timestampLbl: UILabel!
    @IBOutlet weak var thoughtTxtLbl: UILabel!
    @IBOutlet weak var likesImg: UIImageView!
    @IBOutlet weak var likesNumLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configureCell(thought: Thought) {
        
    }

}
