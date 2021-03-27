//
//  VKLoginViewController.swift
//  MyVK_IOSapp
//
//  Created by Ниязов Ринат Раимжанович on 3/19/21.
//

import UIKit
import WebKit

class VKLoginViewController: UIViewController {


    @IBOutlet weak var webview: WKWebView! {
        didSet{
            webview.navigationDelegate = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "oauth.vk.com"
        urlComponents.path = "/authorize"
        urlComponents.queryItems = [
            URLQueryItem(name: "client_id", value: "7796050"),
            URLQueryItem(name: "display", value: "mobile"),
            URLQueryItem(name: "redirect_uri", value: "https://oauth.vk.com/blank.html"),
            URLQueryItem(name: "scope", value: "262150"),
            URLQueryItem(name: "response_type", value: "token"),
            URLQueryItem(name: "v", value: "5.68")
        ]
        
        let request = URLRequest(url: urlComponents.url!)
        
        webview.load(request)
        
    }
    

}

extension VKLoginViewController: WKNavigationDelegate{
    func webView(_ webView: WKWebView, decidePolicyFor navigationResponse: WKNavigationResponse, decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {
        
        guard let url = navigationResponse.response.url, url.path == "/blank.html", let fragment = url.fragment  else {
            decisionHandler(.allow)
            return
        }
        
        let params = fragment
            .components(separatedBy: "&")
            .map { $0.components(separatedBy: "=") }
            .reduce([String: String]()) { result, param in
                var dict = result
                let key = param[0]
                let value = param[1]
                dict[key] = value
                return dict
        }
        
        guard let token = params["access_token"],
              let userId = params["user_id"],
              let _ = Int(userId) else {
            decisionHandler(.allow)
            return
        }
        
        let session = CustomSession.instance
        session.token = token
        session.userId = Int(userId) ?? 0
        
        decisionHandler(.cancel)
     
        let fs = FileServices()
        fs.getImage(uri:"https://sun1.tele2-kz-almaty.userapi.com/s/v1/if1/nnzEtSGCaDv4vpPbnxYq_l1j7SVD1k6395ntqr3VKwwMMJs5RYgn0Nznb94x07oyMBQj3Jq8.jpg?size=50x0&quality=96&crop=104,198,519,519&ava=1")
        
//        let friends = Friends()
//        friends.Get()
//
//        let groups = Groups()
//        groups.Get()
//        groups.Search("GeekBrains")
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "mainMenu") as! MainMenuController
        self.present(vc, animated: true, completion: nil)
    }
}
