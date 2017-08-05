//
//  ViewController.swift
//  Table Expandable
//
//  Created by C Ramkumar on 04/08/17.
//  Copyright © 2017 Ram. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, ExpandedHeaderViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var sections = [Section(genre: "Tamilnadu", movies: ["Singam","Kushi","Tamilzhan"], expanded: false), Section(genre: "Kerala", movies: ["Oman","Penkutti","Kalizhoru"], expanded: false), Section(genre: "Andhra", movies: ["Kumki","Telluthu","Osthi"], expanded: false), Section(genre: "Kerala", movies: ["Oman","Penkutti","Kalizhoru"], expanded: false), Section(genre: "Andhra", movies: ["Kumki","Telluthu","Osthi"], expanded: false)
                    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections[section].movies.count
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 44
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if sections[indexPath.section].expanded {
            return 44
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 2
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = ExpandableSection()
        header.customInit(title: sections[section].genre, section: section, delegate: self)
        return header
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellID")!
        cell.textLabel?.text = sections[indexPath.section].movies[indexPath.row]
        return cell
    }
    
    func toggleSection(header: ExpandableSection, section: Int) {
        sections[section].expanded = !sections[section].expanded
        tableView.beginUpdates()
        for i in 0 ..< sections[section].movies.count {
            tableView.reloadRows(at: [IndexPath(row:i, section: section)], with: .automatic)
        }
        tableView.endUpdates()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

