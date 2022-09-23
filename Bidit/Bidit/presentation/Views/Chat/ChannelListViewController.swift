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
        var array = self.channelList[indexPath.row].name.components(separatedBy: "_")
        channelVC.channelName = self.channelList[indexPath.row].name
        
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
        let inputImg = UIImageView(image: UIImage(named: "empty_chat_img"))
        let inputText = UILabel()
        emptyListImg.frame = CGRect(x: 0, y: 0, width: 120, height: 145)
        emptyListImg.addSubview(inputImg)
        emptyListImg.addSubview(inputText)
        
        
        inputImg.snp.makeConstraints{
            $0.width.equalTo(120)
            $0.height.equalTo(110)
            $0.centerX.equalToSuperview()
            //$0.bottom.equalToSuperview().inset(400)
            //$0.top.equalToSuperview()
            $0.centerY.equalToSuperview()
        }
        
        inputText.text = "대화목록이 없습니다."
        inputText.textColor = UIColor(rgb: 0x9E9E9E)
        
        inputText.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.top.equalTo(inputImg.snp.bottom).offset(20)
        }
        
        emptyView = emptyListImg
        //타이틀 라벨
        self.titleView = createCustomTitleLabel()
    
        
        
        //채널 셀 설정
        self.tableView.rowHeight = 72


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
