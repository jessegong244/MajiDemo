//
//  MainNetworking.swift
//  MajiDemo
//
//  Created by 龚伟强 on 2021/2/25.
//

import Foundation
import SVProgressHUD

typealias requestClosure = (_ model:MainModel?,_ error:Error?) -> Void

func mainRequest(closure:@escaping requestClosure){
    SVProgressHUD .setDefaultMaskType(SVProgressHUDMaskType.black)
    SVProgressHUD .setBackgroundLayerColor(UIColor .blue)
    SVProgressHUD .setDefaultStyle(SVProgressHUDStyle.dark)
    SVProgressHUD .setDefaultAnimationType(SVProgressHUDAnimationType.flat)
    SVProgressHUD .show(withStatus: "网路请求中......")
    SVProgressHUD .setMinimumDismissTimeInterval(1000.0)
    
    MjProvider.request(.base) { (result) in
        switch result{
            case .success(let response):
                do{
                    SVProgressHUD.dismiss()
                    let jsonData = try JSONSerialization.jsonObject(with: response.data as Data, options: .mutableContainers) as Any
                    
                    print("json =",jsonData)
                    let model = MainModel.yy_model(with: jsonData as! [AnyHashable : Any]);
                    closure(model,nil)
                }catch(let error){
                    SVProgressHUD.dismiss()
                    closure(nil,error)
                    print(error)
                }
                break;
            case .failure(let error):
                SVProgressHUD.dismiss()
                print(error)
                closure(nil,error)
                break;
        }
    }
}
