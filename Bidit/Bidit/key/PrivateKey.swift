//
//  PrivateKey.swift
//  Bidit
//
//  Created by JeongMin Ko on 2022/07/06.
//

import Foundation

struct PrivateKey{
    //AWS S3 재발급 필요
    let BUCKET_NAME = "bidit-itemimage"
    let ACCESS_KEY = "AKIASMWZ7V2VKLN7ZUX4" //accessKey
    let SECRET_KEY = "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" //secretKey
    let UTILITY_KEY = "https://bidit-itemimage.s3.ap-northeast-2.amazonaws.com/mvp_model/" //utility-key
    var FILE_KEY = "bidit-itemimage/mvp_model/"
    
    
    //endpoint
    let GRAPHQL_URL = "https://wypcpelqdbhlxgrexisgez7vba.appsync-api.ap-northeast-2.amazonaws.com/graphql"
    
    init(){
        
    }

    //KAKAO API KakaoSDK.initSDK(appKey: "ba32f8f8a45cc8603a4c6dd09d74849c")
    let KAKAO_APP_KEY = "f44987ac5264adb7a6fad10775c65cb3"
    
    // let APP_ID = "2E629AFA-9DA6-47D2-94D5-A064A594EA63"  // Specify your Sendbird application ID.
    //sendbird
    let SENDBIRD_APP_ID = "2E629AFA-9DA6-47D2-94D5-A064A594EA63"
    
}

