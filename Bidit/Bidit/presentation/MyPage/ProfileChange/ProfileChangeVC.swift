//
//  ProfileChangeVC.swift
//  Bidit
//
//  Created by JeongMin Ko on 2022/07/11.
//

import Foundation
import UIKit
import ReactorKit
import Kingfisher
//프로필 수정.
class ProfileChangeVC : UIViewController, View{
    
    let profileImg = UIImageView()
    let imgButton  = UIButton()
    let nameField = UITextField()
    let noticeText = UILabel() // 닉네임은 8자 이하로 적어주세요./ 닉네임을 작성해주세요.
    
    let checkBtn = UIButton()
    
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    var disposeBag: DisposeBag  = DisposeBag()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemBackground
        
        setNavigationBar()
        
        layout()
    }
    
    private func layout(){
        self.view.addSubview(profileImg)
        profileImg.snp.makeConstraints{
            $0.top.equalToSuperview().offset(104)
            $0.centerX.equalToSuperview()
            $0.width.height.equalTo(128)
            
        }
        
        profileImg.image = UIImage(named: "profile_basic_img")
        profileImg.image = self.loadProfileImg(url: self.reactor?.initialState.user?.kakaoAccount?.profile_image_url ?? "")
        self.view.addSubview(imgButton)
        imgButton.snp.makeConstraints{
            $0.bottom.equalTo(self.profileImg.snp.bottom).inset(6)
            $0.trailing.equalTo(self.profileImg.snp.trailing).inset(6)
        }
        imgButton.setImage(UIImage(named: "profile_camera_btn_img"), for: .normal)
        
        self.view.addSubview(nameField)
        nameField.snp.makeConstraints{
            $0.leading.trailing.equalToSuperview().inset(18)
            $0.height.equalTo(44)
            $0.top.equalTo(profileImg.snp.bottom).offset(32)
            
        }
        nameField.placeholder = "닉네임을 작성해주세요 (8자 이하)"
        nameField.layer.borderWidth = 1
        nameField.layer.borderColor = UIColor(red: 0.741, green: 0.741, blue: 0.741, alpha: 1).cgColor
        nameField.textAlignment = .center
        nameField.font = .systemFont(ofSize: 14, weight: .regular)
        //닉네임 조건 요청
        self.view.addSubview(noticeText)
        noticeText.snp.makeConstraints{
            $0.top.equalTo(nameField.snp.bottom).offset(8)
            $0.centerX.equalToSuperview()
        }
        noticeText.isHidden = true
        noticeText.font = .systemFont(ofSize: 10, weight: .medium)
        noticeText.textColor = UIColor(red: 0.957, green: 0.263, blue: 0.212, alpha: 1)
        

        
        self.view.addSubview(checkBtn)
        checkBtn.snp.makeConstraints{
            $0.bottom.equalToSuperview().inset(24)
            $0.leading.trailing.equalToSuperview().inset(18)
            
        }
        checkBtn.setImage(UIImage(named: "check_btn_profile_img"), for: .normal)
    }
    
    
    func bind(reactor: ProfileChangeReactor) {
        
        
        var inputStr = ""
        self.nameField.rx.text.subscribe(onNext : {result in
            inputStr = result!
        })
        //닉네임 조건 요청
        self.nameField.rx.text.subscribe(onNext : {text in
            
            if text?.description.count ?? 0 == 0{
                self.noticeText.text = "닉네임을 작성해주세요."
                self.noticeText.isHidden = false
                self.checkBtn.isEnabled = false
                self.nameField.layer.borderColor = UIColor(red: 0.957, green: 0.263, blue: 0.212, alpha: 1).cgColor
                
            }else if text?.description.count ?? 0 < 8{
                self.noticeText.text = "닉네임은 8자 이하로 적어주세요."
                self.noticeText.isHidden = false
                self.checkBtn.isEnabled = false
                self.nameField.layer.borderColor = UIColor(red: 0.957, green: 0.263, blue: 0.212, alpha: 1).cgColor
            }else {
                self.noticeText.isHidden = true
                self.checkBtn.isEnabled = true
                self.nameField.layer.borderColor = UIColor(red: 0.741, green: 0.741, blue: 0.741, alpha: 1).cgColor
            
            }
            
            
        }).disposed(by: disposeBag)
        
//
        //프로필 버튼 이벤트
        self.imgButton.rx.tap
            .subscribe(onNext : {
                print("액션시트 열기")
                self.setActionSheet()
            }).disposed(by: disposeBag)
//
    
        self.checkBtn.rx.tap
            .map{Reactor.Action.updateProfile(inputStr)}
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
        
        //업로드 결과
        self.reactor?.state
            .map{$0.successUpdate}
            .subscribe(onNext : { successUpdate in
                
                if successUpdate {
                    
                    
                    
                    //상품이 정상적으로 등록되었습니다. 메시지
                    self.navigationController?.presentingViewController?.showToast(message: "닉네임이 변경되었습니다.")
                    self.navigationController?.popViewController(animated: true)
                    self.navigationController?.topViewController?.showToast(message: "닉네임이 변경되었습니다.")
                    
                }
                
            }).disposed(by: disposeBag)
        
    }
    
    /*
      네비게이션 바
     */
    private func setNavigationBar(){
        //self.navigationItem.leftBarButtonItem = backButton
        self.navigationController?.navigationBar.topItem?.title = ""
        self.navigationController?.navigationBar.tintColor = . gray
        self.navigationController?.navigationBar.isHidden = false
        self.title = "프로필 수정"

        self.tabBarController?.tabBar.isHidden = true
    }
    /*
     액션시트
     사진삭제, 사진촬영, 앨범에서 사진 불러오기.
     */
    private func setActionSheet(){
        //action sheet title 지정
        
        let optionMenu = UIAlertController(title: nil, message: "", preferredStyle: .actionSheet)
        
        //옵션 초기화
        
        //사진삭제,
        let deleteAction = UIAlertAction(title: "사진삭제", style: .default, handler: {
            (alert: UIAlertAction!) -> Void in
            
            let vc = NotOpenDialogVC()
            vc.modalPresentationStyle = .fullScreen
           
            // 보여주기
            self.present(vc, animated: false, completion: nil)
            //수정하기 뷰컨트롤러 호출
            //                   let vc = ModifyProductVC()
            //                   vc.currItem = self.reactor?.initialState.item
            //                   let modifyReactor = ModifyProductReactor(currItem: self.reactor!.initialState.item) //임시로 입력
            //                   vc.reactor = modifyReactor
            // vc.bind(reactor: listReactor)
            // self.navigationController?.pushViewController(vc, animated: true)
        })
//        사진촬영
        let takeAction = UIAlertAction(title: "사진촬영", style: .default, handler: {
            (alert: UIAlertAction!) -> Void in
            
            let vc = NotOpenDialogVC()
            vc.modalPresentationStyle = .fullScreen
           
            // 보여주기
            self.present(vc, animated: false, completion: nil)
            // self.setDeletePopup()
        })
        // 앨범에서 사진 불러오기.
        let loadAction = UIAlertAction(title: "앨범에서 사진 불러오기.", style: .default, handler: {
            (alert: UIAlertAction!) -> Void in
            // self.setDeletePopup()
            let vc = NotOpenDialogVC()
            vc.modalPresentationStyle = .fullScreen
           
            // 보여주기
            self.present(vc, animated: false, completion: nil)
        })
        let cancelAction = UIAlertAction(title: "닫기", style: .cancel, handler: {
            (alert: UIAlertAction!) -> Void in
            
        })
        
        //action sheet에 옵션 추가.
        
        optionMenu.addAction(deleteAction)
        optionMenu.addAction(takeAction)
        optionMenu.addAction(loadAction)
        optionMenu.addAction(cancelAction)
        
        
        
        //show
        
        self.present(optionMenu, animated: true, completion: nil)
        
        
    }
    
    
    func loadProfileImg(url : String) -> UIImage{
        var resultImage : UIImage?
        if let thumbnailUrl = URL(string: url) {
            KingfisherManager.shared.retrieveImage(with: thumbnailUrl, completionHandler: { result in
            switch(result) {
                case .success(let imageResult):
//                    let resized = imageResult.image.resizedImageWithContentMode(.scaleAspectFit, bounds: CGSize(width: 84, height: 84), interpolationQuality: .medium)
                    //imageView.isHidden = false
                resultImage = imageResult.image
                case .failure(let error):
                    
                break
                }
            })
        }
        return resultImage ?? UIImage(named: "basic_profile_img")!
    
    
    }
}

