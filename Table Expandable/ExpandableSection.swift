//
//  ExpandableSection.swift
//  Table Expandable
//
//  Created by C Ramkumar on 04/08/17.
//  Copyright © 2017 Ram. All rights reserved.
//

import UIKit

protocol ExpandedHeaderViewDelegate {
    func toggleSection(header: ExpandableSection, section: Int)
}

class ExpandableSection: UITableViewHeaderFooterView {

    var delegate: ExpandedHeaderViewDelegate?
    var section: Int!
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        self.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(selectHeaderAction)))
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func selectHeaderAction(gestureRecognizer: UITapGestureRecognizer) {
        let cell = gestureRecognizer.view as! ExpandableSection
        delegate?.toggleSection(header: self, section: cell.section)
    }
        func customInit(title: String, section:Int, delegate: ExpandedHeaderViewDelegate) {
            self.textLabel?.text = title
            self.section = section
            self.delegate = delegate
        }
        
        override func layoutSubviews() {
            super.layoutSubviews()
            self.textLabel?.textColor = UIColor.white
            self.contentView.backgroundColor = UIColor.gray
            
        }
    
    
}
