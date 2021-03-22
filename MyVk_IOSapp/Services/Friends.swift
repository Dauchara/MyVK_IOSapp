import Foundation
import Alamofire

class Friends {
    
    func Get() -> [UserModel]? {
        let session = CustomSession.instance
        let path = "friends.get"
        
        let parameters: Parameters = [
            "access_token": session.token,
            "v": "5.130",
            "order": "name",
            "count": "200",
            "offset": "5",
            "fields": "city,domain,photo_50",
            "name_case": "nom",
            "user_id": session.userId
        ]
        
        let url = session.baseUrl + path
        
        AF.request(url, method: .get, parameters: parameters).responseJSON { repsonse in
            print(repsonse.value)
        }
        
        return nil
    }
    
}
