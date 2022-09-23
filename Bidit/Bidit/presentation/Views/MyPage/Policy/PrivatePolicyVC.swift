//
//  PrivatePolicyVC.swift
//  Bidit
//
//  Created by JeongMin Ko on 2022/07/10.
//

import Foundation
import UIKit
import WebKit

class PrivatePolicyVC : UIViewController,WKNavigationDelegate, WKUIDelegate{
    
    let webView = WKWebView()
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("viewDidApeear")
        checkNetworkConnect()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBar()
        self.view.backgroundColor = .white
        loadUrl()
        // 구독
        //webView.addObserver(self, forKeyPath: #keyPath(WKWebView.estimatedProgress), options: .new, context: nil)
    }
    
    
    /*
      네비게이션 바
     */
    private func setNavigationBar(){
        //self.navigationItem.leftBarButtonItem = backButton
        self.navigationController?.navigationBar.topItem?.title = ""
        self.navigationController?.navigationBar.tintColor = . gray
        self.navigationController?.navigationBar.isHidden = false
        self.title = "개인정보 수집 및 이용 방침"

        self.tabBarController?.tabBar.isHidden = true
    }
    
    
    func loadUrl(){
        view.addSubview(webView)
    
        webView.snp.makeConstraints{
            $0.leading.trailing.equalToSuperview()
            $0.top.bottom.equalToSuperview()
        }
        let url = URL(string: "https://biditkr.com/%EC%9D%B4%EC%9A%A9-%EC%95%BD%EA%B4%80-%EB%B0%8F-%EA%B0%9C%EC%9D%B8%EC%A0%95%EB%B3%B4-%EC%B2%98%EB%A6%AC-%EB%B0%A9%EC%B9%A8")
        let request = URLRequest(url: url!)
        webView.load(request)
        
        webView.uiDelegate = self
        webView.navigationDelegate = self
    }
    func checkNetworkConnect(){
        if Reachability.isConnectedToNetwork(){
            print("Network Connect")
        }else{
            print("Network Not Connect")
            
            let networkCheckAlert = UIAlertController(title: "Network Error", message: "앱 종료", preferredStyle: UIAlertController.Style.alert)
            networkCheckAlert.addAction(UIAlertAction(title: "OK", style: .default, handler: {(_: UIAlertAction!) in
                print("App exit")
                
                exit(0)
                
            }))
            self.present(networkCheckAlert, animated: true , completion: nil)
        }
    }
}
extension PrivatePolicyVC {
    //리로드 중복 방지
    func webViewWebContentProcessDidTerminate(_ webView: WKWebView) {
        webView.reload()
    }
    
    
    
//    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
//        if let host = navigationAction.request.url?.host {
//            if host == "https://biditkr.com/%EC%9D%B4%EC%9A%A9-%EC%95%BD%EA%B4%80-%EB%B0%8F-%EA%B0%9C%EC%9D%B8%EC%A0%95%EB%B3%B4-%EC%B2%98%EB%A6%AC-%EB%B0%A9%EC%B9%A8" {
//                decisionHandler(.allow)
//                return
//            }
//        }
//
//        decisionHandler(.cancel)
//    }
//
//
//
//    // 이벤트 수신은 observeValue 메소드를 오버라이딩
//    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
//        if keyPath == "estimatedProgress" {
//            print(Float(webView.estimatedProgress))
//        }
//    }
}
