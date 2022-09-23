//
//  UploadTestViewController.swift
//  Bidit
//
//  Created by JeongMin Ko on 2022/06/28.
//

import Foundation
import UIKit
import AWSS3
class UploadTestViewController: UIViewController {

    
    let bucketName = PrivateKey().BUCKET_NAME
    let accessKey = PrivateKey().ACCESS_KEY
    let secretKey = PrivateKey().SECRET_KEY
    let utilityKey = PrivateKey().UTILITY_KEY
    var fileKey = PrivateKey().FILE_KEY
    
    var downloadBtn = UIButton()
    var uploadBtn = UIButton()
    var imageView = UIImageView()
    
    func layout(){
        self.view.addSubview(downloadBtn)
        self.view.addSubview(uploadBtn)
        self.view.addSubview(imageView)
        downloadBtn.snp.makeConstraints{
            $0.trailing.top.equalToSuperview().inset(60)
            $0.height.width.equalTo(60)
        }
        downloadBtn.setTitle("다운로드", for: .normal)
        uploadBtn.snp.makeConstraints{
            $0.leading.top.equalToSuperview().inset(60)
            $0.height.width.equalTo(60)
        }
        uploadBtn.setTitle("업로드", for: .normal)
        
        imageView.snp.makeConstraints{
            $0.width.height.equalTo(100)
            $0.top.equalToSuperview().offset(200)
            $0.leading.trailing.equalToSuperview()
        }
        imageView.backgroundColor = .gray
        
    }
    
    func bind(){
        self.downloadBtn.rx.tap.asObservable().subscribe(onNext : {_ in
            self.download()
            print("다운로드")
        })
        self.uploadBtn.rx.tap.subscribe(onNext : {
            self.upload()
            print("업로드")
           // self.uploadFile(withImage: UIImage(named: "testImg")!)
        })
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        layout()
        bind()
        let credentialsProvider = AWSStaticCredentialsProvider(accessKey: accessKey, secretKey: secretKey)

        let configuration = AWSServiceConfiguration(region:.APNortheast2, credentialsProvider:credentialsProvider)
        AWSServiceManager.default().defaultServiceConfiguration = configuration

        let tuConf = AWSS3TransferUtilityConfiguration()
        tuConf.isAccelerateModeEnabled = false

        AWSS3TransferUtility.register(
            with: configuration!,
            transferUtilityConfiguration: tuConf,
            forKey: utilityKey
        )
        
        let dateFormat = DateFormatter()
        dateFormat.dateFormat = "yyyyMMdd/"
        fileKey += dateFormat.string(from: Date())
        fileKey += String(Int64(Date().timeIntervalSince1970)) + "_"
        fileKey += UUID().uuidString + ".png"
        
    }

    func upload() {
        

        guard let transferUtility = AWSS3TransferUtility.s3TransferUtility(forKey: utilityKey)
        else
        {
            return
        }

        let expression = AWSS3TransferUtilityUploadExpression()
        expression.setValue("public-read", forRequestHeader: "x-amz-acl") //URL로 이미지 읽을 수 있도록 권한 설정 (이 헤더 없으면 못읽음)
        expression.progressBlock = {(task, progress) in
            print("progress \(progress.fractionCompleted)")
        }
        
        
        var completionHandler: AWSS3TransferUtilityUploadCompletionHandlerBlock?
        completionHandler = { [weak self] (task, error) -> Void in
            guard let self = self else { return }
            print("task finished")
            //??????
            let url = AWSS3.default().configuration.endpoint.url
            //
            let publicURL = url?.appendingPathComponent(self.bucketName).appendingPathComponent(self.fileKey)
            if let absoluteString = publicURL?.absoluteString {
                print("image url ↓↓")
                print(absoluteString)
            }
            
            if let query = task.request?.url?.query,
               var removeQueryUrlString = task.request?.url?.absoluteString.replacingOccurrences(of: query, with: "") {
                removeQueryUrlString.removeLast() // 맨 뒤 물음표 삭제
                print("업로드 리퀘스트에서 쿼리만 제거한 url ↓↓") //이 주소도 파일 열림
                print(" 업로드 URL : \(removeQueryUrlString)")
            }
        }



        guard let data = UIImage(named: "testImg")?.pngData()
        else
        {
            return
        }
        

        transferUtility.uploadData(data as Data, bucket: bucketName, key: fileKey, contentType: "image/png", expression: expression,
        completionHandler: completionHandler).continueWith
        {
            (task) -> AnyObject? in
            if let error = task.error {
                print("Error: \(error.localizedDescription)")

            }

            if let _ = task.result {
                print ("upload successful.")
            }

            return nil
        }
    }
    
    func download() {
        guard let transferUtility = AWSS3TransferUtility.s3TransferUtility(forKey: utilityKey)
        else
        {
            return
        }

        let expression = AWSS3TransferUtilityDownloadExpression()
        expression.progressBlock = {(task, progress) in
            print("progress \(progress.fractionCompleted)")
        }
        
        var completionHandler: AWSS3TransferUtilityDownloadCompletionHandlerBlock?
        completionHandler = { (task, url, data, err) -> Void in
            print("task finished")
            
            DispatchQueue.main.async { [weak self] in
                
                if let d = data {
                    print("img data 있음")
                    
                    self!.imageView.image = UIImage(data: d)
                    //self?.imageView.image = UIImage(named: "tempBanner")
                }
            }
        }
        
        
        transferUtility.downloadData(fromBucket: bucketName, key: fileKey, expression: expression, completionHandler: completionHandler).continueWith
        {
            (task) -> AnyObject? in
            if let error = task.error {
                print("Error: \(error.localizedDescription)")
            }
            
            if let _ = task.result {
                print ("download successful.")
            }
            return nil
        }
        
    }
    
    func uploadFile(withImage image: UIImage) {

        let access = self.accessKey//my
        let secret = self.secretKey//my
        let credentials = AWSStaticCredentialsProvider(accessKey: access, secretKey: secret)
        let configuration = AWSServiceConfiguration(region: AWSRegionType.USEast1, credentialsProvider: credentials)

        AWSServiceManager.default().defaultServiceConfiguration = configuration

        let s3BucketName = self.bucketName //my
        //let compressedImage = image.resizedImage(newSize: CGSize(width: 80, height: 80))
        let data: Data = image.pngData()!
        let remoteName = "mvp_model/" + "myArbitaryImg.png"
        print("REMOTE NAME : ",remoteName)

        let expression = AWSS3TransferUtilityUploadExpression()
        expression.progressBlock = { (task, progress) in
            DispatchQueue.main.async(execute: {
                // Update a progress bar
            })
        }

       var completionHandler: AWSS3TransferUtilityUploadCompletionHandlerBlock?
        completionHandler = { (task, error) -> Void in
            DispatchQueue.main.async(execute: {
                // Do something e.g. Alert a user for transfer completion.
                // On failed uploads, `error` contains the error object.
            })
        }

        let transferUtility = AWSS3TransferUtility.default()
        transferUtility.uploadData(data, bucket: s3BucketName, key: remoteName, contentType: "image/png", expression: expression, completionHandler: completionHandler).continueWith { (task) -> Any? in
            if let error = task.error {
                print("Error : \(error.localizedDescription)")
            }

            if task.result != nil {
                let url = AWSS3.default().configuration.endpoint.url
                let publicURL = url?.appendingPathComponent(s3BucketName).appendingPathComponent(remoteName)
                if let absoluteString = publicURL?.absoluteString {
                    // Set image with URL
                    print("Image URL : ",absoluteString)
                }
            }

            return nil
        }

    }
    
    
}
