//
//  TableViewController.swift
//  MemeMe
//
//  Created by fadel sultan on 10/8/19.
//  Copyright © 2019 fadel sultan. All rights reserved.
//

import UIKit

class VillainTableView: UIViewController {

//    outlet
    @IBOutlet weak var tableView: UITableView!
    
//    arraies
    var memes: [Meme]! {
        let object = UIApplication.shared.delegate
        let appDelegate = object as! AppDelegate
        return appDelegate.memes
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        tableView.reloadData()
    }
    
//    Actions
    @IBAction func btnAddNewMeme(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "MemeMeEditor") as! MemeMeEditor
        vc.delegate = self
        present(vc, animated: true, completion: nil)
    }
    
}

//MARK:- UITableViewDataSource
extension VillainTableView : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return memes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "VillainTableViewCell", for: indexPath) as! VillainTableViewCell
        cell.set(meme: memes[indexPath.row])
        return cell
    }
}

//MARK:- UITableViewDelegate
extension VillainTableView : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "VillainDetailVC") as! VillainDetailVC
        vc.meme = memes[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }
}

extension VillainTableView : MemeMeEditorDelegate {
    func refreshMeme() {
        tableView.reloadData()
    }
}
