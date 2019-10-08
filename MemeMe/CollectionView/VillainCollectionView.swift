//
//  VillainCollectionView.swift
//  MemeMe
//
//  Created by fadel sultan on 10/8/19.
//  Copyright © 2019 fadel sultan. All rights reserved.
//

import UIKit

class VillainCollectionView: UIViewController {
    
    //    outlet
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    //    arraies
    var memes: [Meme]! {
        let object = UIApplication.shared.delegate
        let appDelegate = object as! AppDelegate
        return appDelegate.memes
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let flowLayout = UICollectionViewFlowLayout()
        let space:CGFloat = 3.0
        let dimension = (view.frame.size.width - (2 * space)) / 3.0
        flowLayout.minimumInteritemSpacing = space
        flowLayout.minimumLineSpacing = space
        flowLayout.itemSize = CGSize(width: dimension, height: dimension)
        collectionView.collectionViewLayout = flowLayout
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        collectionView.reloadData()
    }
    
//    Actions
    @IBAction func btnAddNewMeme(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "MemeMeEditor") as! MemeMeEditor
        vc.delegate = self
        present(vc, animated: true, completion: nil)
    }
    
}

//MARK:- UICollectionViewDataSource
extension VillainCollectionView : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return memes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "VillainCollectionViewCell", for: indexPath) as! VillainCollectionViewCell
        cell.set(meme: memes[indexPath.row])
        return cell
    }
}

extension VillainCollectionView : UICollectionViewDelegate , UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "VillainDetailVC") as! VillainDetailVC
        vc.meme = memes[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension VillainCollectionView : MemeMeEditorDelegate {
    func refreshMeme() {
        collectionView.reloadData()
    }
}
