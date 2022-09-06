//
//  S3Manager.swift
//  Bidit
//
//  Created by JeongMin Ko on 2022/07/18.
//

import Foundation
import AWSS3

class S3Manager {
    
    static let shared = S3Manager()
    
     let bucketName = PrivateKey().BUCKET_NAME
     let accessKey = PrivateKey().ACCESS_KEY
     let secretKey = PrivateKey().SECRET_KEY
     let utilityKey = PrivateKey().UTILITY_KEY
     var fileKey = PrivateKey().FILE_KEY
    
   
    
    
    func getURL(image : UIImage) -> String {
        
        
        

        var photoUrl = ""
        guard let transferUtility = AWSS3TransferUtility.s3TransferUtility(forKey: utilityKey)
        else
        {
            return ""
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
                //print(removeQueryUrlString)
                photoUrl =  removeQueryUrlString
            }
        }



        //올릴 사진
        guard let data = image.pngData() //UIImage(named: "testImg")?.pngData()
        else
        {
            return photoUrl
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

            return photoUrl as AnyObject
        }
        
        return photoUrl
    }
    
}
