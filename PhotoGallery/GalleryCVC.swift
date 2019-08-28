//
//  GalleryCVC.swift
//  PhotoGallery
//
//  Created by Artem Esolnyak on 28/08/2019.
//  Copyright © 2019 Artem Esolnyak. All rights reserved.
//

import UIKit
import SDWebImage

private let reuseIdentifier = "Cell"


class GalleryCVC: UICollectionViewController {
    let urlImage = ["https://picsum.photos/id/73/200/300" : "200/300"
        ,"https://picsum.photos/id/249/200/300" : "200/300"
        ,"https://picsum.photos/id/888/200/300" : "200/300"
        ,"https://picsum.photos/id/785/200/300" : "200/300"
        ,"https://picsum.photos/id/874/200/300" : "200/300"
        ,"https://picsum.photos/id/1077/200/300" : "200/300"
        ,"https://picsum.photos/id/778/200/300" : "200/300"
        ,"https://picsum.photos/id/774/200/300" : "200/300"
        ,"https://picsum.photos/id/75/200/300" : "200/300"
        ,"https://picsum.photos/id/558/200/300" : "200/300"
        ,"https://picsum.photos/id/916/200/300" : "200/300"
        ,"https://picsum.photos/id/260/200/300" : "200/300"
        ,"https://picsum.photos/id/996/200/300" : "200/300"
        ,"https://picsum.photos/id/276/200/300": "200/300"
        ,"https://picsum.photos/id/545/200/300": "200/300"
        ,"https://picsum.photos/id/839/200/300": "200/300"
        ,"https://picsum.photos/id/896/200/300": "200/300"
        ,"https://picsum.photos/id/100/200/300": "200/300"
        ,"https://picsum.photos/id/611/200/300": "200/300"
        ,"https://picsum.photos/id/465/200/300" : "200/300"]
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.title = "MyGallery"

    
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return urlImage.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
     
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! MyCell
        let currentImageUrl = urlImage.map{$0.key}
        let currentDescription = urlImage.map{$0.value}
        guard let url = URL(string: currentImageUrl[indexPath.row]) else {
            return cell
        }
        
        cell.contentView.layer.cornerRadius = 5
        cell.contentView.layer.borderWidth = 1
        cell.contentView.layer.borderColor = #colorLiteral(red: 0.2439610064, green: 0.2440083027, blue: 0.2439548075, alpha: 1);
        cell.contentView.layer.masksToBounds = true
        
        cell.textLabel.text = currentDescription[indexPath.row]
        cell.imageView.sd_setImage(with: url, completed: nil)
        
        
    
        // Configure the cell
    
        return cell
    }
    
  
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToPhotos"
        {
            // Даём понять, что sender это ячейка класса MyCell
            let cell: MyCell  = sender as! MyCell
            
            // Получает объект image из текущей ячейки
            let image = cell.imageView.image
            
            
            let previewVC = segue.destination as! ViewController
            
            // Задаём контроллеру изображение с текущей ячейки
            previewVC.currentPhoto = image
        }
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}
