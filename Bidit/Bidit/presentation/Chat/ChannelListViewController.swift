//
//  ChannelListViewController.swift
//  Bidit
//
//  Created by JeongMin Ko on 2022/07/03.
//

import Foundation
import SendBirdUIKit
import UIKit
import Reusable
// 채팅방 리스트
class ChannelListViewController : SBUChannelListViewController {
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let channel = self.channelList[indexPath.row].channelUrl
        let channelVC = MessageList(channelUrl : channel)
        
        
        let naviVC = UINavigationController(rootViewController: channelVC)
        naviVC.modalPresentationStyle = .fullScreen
        self.present(naviVC, animated: true)
    }
    
  
    
    
    
    

//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        tableView.register(CustomChatChannelListCell.self, forCellReuseIdentifier: "CustomChatChannelListCell")
//        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomChatChannelListCell", for: indexPath)
//        return cell
//
//    }
    
    
    
    
    
    
    override init(channelListQuery: SBDGroupChannelListQuery?) {
        super.init(channelListQuery: nil)
        
        let customCell = CustomChatChannelListCell()
        //self.register(customCell: customCell) (x)
        self.register(channelCell: customCell) 
        
        self.leftBarButton = createHighlightedBackButton()// 뒤로가기 버튼 없애기
        self.rightBarButton = UIBarButtonItem.init()//오른쪽 버튼 없애기

        
        let emptyListImg = UIView()
        let inputImg = UIImageView(image: UIImage(named: "Black hole sucking paper out of the folder and spaceship flying past"))
        emptyListImg.frame = CGRect(x: 0, y: 0, width: 120, height: 110)
        emptyListImg.addSubview(inputImg)
        
        
        inputImg.snp.makeConstraints{
            $0.width.height.equalTo(120)
            $0.centerX.equalToSuperview()
            $0.bottom.equalToSuperview().inset(400)
        }
        
        emptyView = emptyListImg
        //타이틀 라벨
        self.titleView = createCustomTitleLabel()
    
        
        
        //채널 셀 설정


    }
        
    func createHighlightedBackButton() -> UIBarButtonItem{
        return UIBarButtonItem(title: "", style: .plain, target: self, action: #selector(clickBack))
    }
    //타이틀 설정
    func createCustomTitleLabel() -> UILabel {
            let titleLabel = UILabel()
            titleLabel.text = "채팅"
            return titleLabel
        }
    
    
    @objc func clickBack() {
        self.navigationController?.popViewController(animated: true)
        self.dismiss(animated: true)
    }
}
