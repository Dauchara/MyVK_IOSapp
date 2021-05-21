import Foundation
import Alamofire

class NewsFeed {
    
    func Get() -> News? {
        let session = CustomSession.instance
        let path = "newsfeed.get"
        
        let parameters: Parameters = [
            "access_token": session.token,
            "v": "5.130",
            "filters":"post,photo,photo_tag,wall_photo",
            "count": "10",
            "user_id": session.userId
        ]
        
        let url = session.baseUrl + path
        
        var newsFeed: News? = nil
        AF.request(url, method: .get, parameters: parameters).validate().responseDecodable(of: News.self) { (response) in
            
            guard let news = response.value else { return }
            newsFeed = news
            print("GETTING !!!!")
            print(news)
        }
        
        print("RETURNS !!!!")
        print(newsFeed)
        return newsFeed
    }
    
}
