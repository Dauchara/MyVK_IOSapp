import Foundation
import Alamofire

class Groups {
    func Get() -> [GroupModel]? {
        let session = CustomSession.instance
        let path = "groups.get"
        
        let parameters: Parameters = [
            "access_token": session.token,
            "v": "5.130",
            "count": "50",
            "extended":1,
            "fields": "photo_50",
            "user_id": session.userId
        ]
        
        let url = session.baseUrl + path
        
        AF.request(url, method: .get, parameters: parameters).responseJSON { repsonse in
            print(repsonse.value)
        }
        
        return nil
    }
}
