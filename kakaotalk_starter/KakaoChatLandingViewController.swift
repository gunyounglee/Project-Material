//
//  ViewController.swift
//  Twitter_starter
//
//  Created by James Kim on 7/27/20.
//  Copyright © 2020 James Kim. All rights reserved.
//

import UIKit

class KakaoChatLandingViewController: UIViewController{
   
    
    // TODO: TableView를 만들어서 outlet으로 추가해주세요.
    @IBOutlet var tableView: UITableView!

    var chatData : [Message] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.dataSource = self
        tableView.delegate = self
        
        
        //이미지 크기설정
        let customImage = UIImage(named: "p1.jpg")
        let newWidth = 30
        let newHeight = 30
        let newImageRect = CGRect(x: 0, y: 0, width: newWidth, height: newHeight)
        UIGraphicsBeginImageContext(CGSize(width: newWidth, height: newHeight))
        customImage?.draw(in: newImageRect)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()?.withRenderingMode(.alwaysOriginal)
        UIGraphicsEndImageContext()

    }
    
    
    func setupTableView() {
        // TODO: TableView를 datasource을 설정해주세요.

//           // 디폴트 추정 높이
//           tableView.estimatedRowHeight = 20
//           // 셀의 크기에 맞춰 테이블뷰 높이 조정
//           tableView.rowHeight = UITableView.automaticDimension
//
    }

   
    private let list = Message.dummyList
}

extension KakaoChatLandingViewController: UITableViewDataSource, UITableViewDelegate {
    // TODO: UITableViewDataSource를 설정해주세요.
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //TODO: list의 갯수만큼 나오게 해주세요.
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // TODO: KakaoChatTableViewCell을 생성해주세요. 생성하고 configure을 불러주세요.
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? KakaoChatTableViewCell {
            let value = Message.dummyList[indexPath.row]
//            let img = UIImage(named: value.senderImageName)
            cell.senderImageView.image = UIImage(named:"\(value.senderImageName).jpg")
            cell.nameLabel.text = value.senderName
            cell.lastSentDateLabel.text = value.lastSentDate
            cell.lastMessageLabel.text = value.lastMessage
           
          return cell
        }else {
            return UITableViewCell()
            }
        }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
        
    }
 
}
