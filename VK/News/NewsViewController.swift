//
//  NewsViewController.swift
//  VK
//
//  Created by Сергей Дмитриев on 01.03.2021.
//

import UIKit

class NewsViewController: UIViewController {
    
    let newsArray = [New(photoCollection: "Alex-collection", text: "Вот такие выходные были...А как у вас?", buttonLiked: true, buttonShared: true, buttonCommented: true, buttonViewed: true),
                     New(photoCollection: "Alex-collection", text: "Вот такие выходные были...А как у вас?", buttonLiked: true, buttonShared: true, buttonCommented: true, buttonViewed: true),
                     New(photoCollection: "Alex-collection", text: "Вот такие выходные были...А как у вас?", buttonLiked: true, buttonShared: true, buttonCommented: true, buttonViewed: true),
                     New(photoCollection: "Alex-collection", text: "Вот такие выходные были...А как у вас?", buttonLiked: true, buttonShared: true, buttonCommented: true, buttonViewed: true),
                     New(photoCollection: "Alex-collection", text: "Вот такие выходные были...А как у вас?", buttonLiked: true, buttonShared: true, buttonCommented: true, buttonViewed: true),
                     New(photoCollection: "Alex-collection", text: "Вот такие выходные были...А как у вас?", buttonLiked: true, buttonShared: true, buttonCommented: true, buttonViewed: true)
    ]

    @IBOutlet weak var newsTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        newsTableView.register(UINib(nibName: CustomNewCell.nibName, bundle: nil), forCellReuseIdentifier: CustomNewCell.reuseIdentifier)
        

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
extension NewsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CustomNewCell.reuseIdentifier, for: indexPath) as? CustomNewCell else {return UITableViewCell()}
        let new = newsArray[indexPath.row]
    
        
        cell.avatarImage.imageView.image = UIImage(named: "unknown")
        cell.nameLabel.text = "Какой то текст"
        cell.configureLowBar()
        cell.textView.text = new.text
        
        return cell
    }
}
