//
//  WebServicesViewController.swift
//  SegundoParcialWebServices
//
//  Created by Christian Calderón on 26/03/20.
//  Copyright © 2020 Christian Calderón. All rights reserved.
//

import UIKit
import Alamofire

class WebServicesViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    var studentElementsArray: [Student]? = []
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return studentElementsArray?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "StudentCollection", for: indexPath) as? StudentCollectionViewCell
        cell!.studentElement = studentElementsArray![indexPath.row]
        return cell!
    }
    


  
    @IBOutlet weak var studentCollection: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "The Greatest Team"

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        (AF.request("http://www.mocky.io/v2/5e7d02bb3500007f8806a298")
            .validate()
            .responseDecodable(of: [Student].self) { (response) in
                guard let studentElements = response.value else {
                    return
                }
                print(studentElements)
                
                DispatchQueue.main.async {
                                self.studentElementsArray = studentElements
                                self.studentCollection.reloadData()
                            }

        })
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
