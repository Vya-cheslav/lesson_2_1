//
//  VKLoginViewController.swift
//  lesson_2_1
//
//  Created by Вячеслав Рожнов on 23.05.18.
//  Copyright © 2018 LLC soft-upgrade. All rights reserved.
//

import UIKit
import WebKit

class VKLoginViewController: UIViewController {
    
    var token: String = ""

    @IBOutlet weak var webView: WKWebView!
    override func viewDidLoad() {
        super.viewDidLoad()

        let tokenUD = UserDefaults.standard.string(forKey: "token")
        
        if  tokenUD != nil  {
            token = tokenUD!
            performSegue(withIdentifier: "segueLaterLogin", sender: nil)
            return
        }
        
        webView.navigationDelegate = self
        if let request = vkAuthRequest()  {
            webView.load(request)
        }
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        print(#function)
        if segue.identifier == "segueLaterLogin" {
//            if let userVC: UserTableViewController = (segue.destination.childViewControllers[0].childViewControllers[0] as? UserTableViewController) {
//                userVC.token = token
//            }
            if let tabBarVC = segue.destination as? UITabBarController, let naviVC = tabBarVC.childViewControllers[0] as? UINavigationController, let userVC = naviVC.childViewControllers[0] as? UserTableViewController {
                userVC.token = token
            }
        }
    }

    func vkAuthRequest() -> URLRequest? {
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "oauth.vk.com"
        urlComponents.path = "/authorize"
        urlComponents.queryItems = [
            URLQueryItem(name: "client_id", value: "6487590"),
            URLQueryItem(name: "display", value: "mobile"),
            URLQueryItem(name: "redirect_uri", value: "https://oauth.vk.com/blank.html"),
            URLQueryItem(name: "scope", value: "262150"),
            URLQueryItem(name: "response_type", value: "token"),
            URLQueryItem(name: "v", value: "5.74")
        ]
        guard let url = urlComponents.url else {return nil}
        
        return URLRequest(url: url)
    }
 

}


extension VKLoginViewController: WKNavigationDelegate {
    func webView(_ webView: WKWebView, decidePolicyFor navigationResponse: WKNavigationResponse, decisionHandler: @escaping (WKNavigationResponsePolicy) -> Swift.Void){
        guard let url = navigationResponse.response.url, url.path == "/blank.html", let fragment = url.fragment
            else {
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
        if let token = params["access_token"]{
            print(token)
            self.token = token
            let service = VKService()
//            service.getUsers(token: token)
//            service.getFrends(token: token)
//            service.getGroups(token: token)
//            service.getPhotosAll(token: token)
//            service.search(token: token)
            UserDefaults.standard.set(token, forKey: "token")
            performSegue(withIdentifier: "segueLaterLogin", sender: nil)// segueView 
        }
        decisionHandler(.cancel)
        
    }
//    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!){
//        print("11")
//    }
//
//    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!){
//            print("12")
//    }
//
//    func webView(_ webView: WKWebView, didReceive challenge: URLAuthenticationChallenge, completionHandler: @escaping (URLSession.AuthChallengeDisposition, URLCredential?) -> Swift.Void) {
//        print("13")
//        //completionHandler(URLSession.AuthChallengeDisposition.cancelAuthenticationChallenge, URLCredential.)
//    }
    
}
