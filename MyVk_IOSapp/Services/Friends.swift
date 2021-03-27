import Foundation
import Alamofire

class Friends {
    
    func Get() -> User? {
        let session = CustomSession.instance
        let path = "friends.get"
        
        let parameters: Parameters = [
            "access_token": session.token,
            "v": "5.130",
            "order": "name",
            "count": "50",
            "offset": "5",
            "fields": "city,domain,photo_50",
            "name_case": "nom",
            "user_id": session.userId
        ]
        
        let url = session.baseUrl + path
        
        var usersAnswer: User? = nil
        AF.request(url, method: .get, parameters: parameters).validate().responseDecodable(of: User.self) { (response) in
            
            guard let users = response.value else { return }
            usersAnswer = users
            print("GETTING !!!!")
            print(usersAnswer)
        }
        
        print("RETURNS !!!!")
        print(usersAnswer)
        return usersAnswer
    }
    
}
