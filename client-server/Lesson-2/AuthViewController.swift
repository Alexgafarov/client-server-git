//
//  AuthViewController.swift
//  client-server
//
//  Created by Александр Гафаров on 06.06.2021.
//

import UIKit
import WebKit


class AuthViewController: UIViewController, WKNavigationDelegate {

    let fromAurhToSession = "fromAurhToSession"
    
    @IBOutlet weak var webView: WKWebView!{
    didSet{
                webView.navigationDelegate = self
            }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        
        var urlComponents = URLComponents()
                urlComponents.scheme = "https"
                urlComponents.host = "oauth.vk.com"
                urlComponents.path = "/authorize"
                urlComponents.queryItems = [
                    URLQueryItem(name: "client_id", value: "7873338"),
                    URLQueryItem(name: "display", value: "mobile"),
                    URLQueryItem(name: "redirect_uri", value: "https://oauth.vk.com/blank.html"),
                    URLQueryItem(name: "scope", value: "262150"),
                    URLQueryItem(name: "response_type", value: "token"),
                    URLQueryItem(name: "v", value: "5.68")
                ]
                
                let request = URLRequest(url: urlComponents.url!)
                
        webView.load(request)
    }
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationResponse: WKNavigationResponse, decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {
        
        guard let url = navigationResponse.response.url, url.path == "/blank.html",
              let fragment = url.fragment
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
        
        let token = params["access_token"]
        let userId = params["user_id"]
        
        print("TOKEN")
        print(token as Any)
        
        print("USER_ID")
        print(userId as Any)
        
        
        
        decisionHandler(.cancel)
        
        AccountService.shared.token = token!
        AccountService.shared.userId = Int(userId!)!
         
        friendsRequest { [weak self] in
            self?.photoRequest { [weak self] in
                self?.groupRequest { [weak self] in
                    self?.groupSearchRequest { [weak self] in
                        
                    }
                }
            }
        }
        
         performSegue(withIdentifier: fromAurhToSession, sender: self)
    }
   
    func friendsRequest(completion: @escaping () -> Void) {

        guard let url = URL(string: "https://api.vk.com/method/friends.get?order=name&access_token=\(AccountService.shared.token)&v=5.131") else { return }

        let session = URLSession.shared

        let task = session.dataTask(with: url) { data, response, error in

            let json = try? JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.allowFragments)
            print("FRIENDS")
            print(json as Any)
            completion()
        }
        task.resume()

    }
    
    func photoRequest(completion: @escaping () -> Void) {

        guard let url = URL(string: "https://api.vk.com/method/photos.get?album_id=profile&access_token=\(AccountService.shared.token)&v=5.131") else { return }

        let session = URLSession.shared

        let task = session.dataTask(with: url) { data, response, error in

            let json = try? JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.allowFragments)
            print("PHOTOS")
            print(json as Any)
            completion()
        }
        task.resume()

    }
    
    func groupRequest(completion: @escaping () -> Void) {

        guard let url = URL(string: "https://api.vk.com/method/groups.get?&access_token=\(AccountService.shared.token)&v=5.131") else { return }

        let session = URLSession.shared

        let task = session.dataTask(with: url) { data, response, error in

            let json = try? JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.allowFragments)
            print("GROUP")
            print(json as Any)
            completion()
        }
        task.resume()

    }
    
    func groupSearchRequest(completion: @escaping () -> Void) {

        guard let url = URL(string: "https://api.vk.com/method/groups.search?q=fitness&access_token=\(AccountService.shared.token)&v=5.131") else { return }

        let session = URLSession.shared

        let task = session.dataTask(with: url) { data, response, error in

            let json = try? JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.allowFragments)
            print("GROUP_SEARCH")
            print(json as Any)
            completion()
        }
        task.resume()

    }
    
}

