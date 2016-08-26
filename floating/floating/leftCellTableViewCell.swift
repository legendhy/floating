//
//  leftCellTableViewCell.swift
//  floating
//
//  Created by huangyu on 16/8/26.
//  Copyright © 2016年 huangyu. All rights reserved.
//

import UIKit

class leftCellTableViewCell: UITableViewCell {

    var leftCellTextField: UITextField!
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
        self.backgroundColor = UIColor.yellowColor()
        
        leftCellTextField = UITextField(frame: CGRectMake(0, 0, 200, 44))
//        self.addSubview(leftCellTextField)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
