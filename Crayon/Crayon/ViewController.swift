//
//  ViewController.swift
//  Crayon
//
//  Created by Edward O'Neill on 11/5/19.
//  Copyright © 2019 Edward O'Neill. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var colorList: [Crayon] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func loadData() {
        self.colorList = Crayon.allTheCrayons
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return colorList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let color = colorList[indexPath.row]
        var cell: CrayonTableViewCell
        
        cell = tableView.dequeueReusableCell(withIdentifier: "ColorX") as! CrayonTableViewCell
        cell.setColor(color: color)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(130)
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        // Get the new view controller using segue.destination
//        switch segue.identifier! {
//        case "GOTDetailSegue1":
//            if let destination = segue.destination as? GOTDetailViewController {
//                destination.episode = gotEpisodes[tableView.indexPathForSelectedRow!.row]
//            }
//        case "GOTDetailSegue2":
//            if let destination = segue.destination as? GOTDetailViewController {
//                destination.episode = gotEpisodes[tableView.indexPathForSelectedRow!.row]
//            }
//        default:
//            fatalError()
//        }
//        // Pass the selected object to the new view controller.
//    }
    
}

