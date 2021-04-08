import Foundation
import Alamofire

class FileServices {
    
    func getImage(uri: String) -> UIImage? {
        var imageBytes: UIImage? = nil
        AF.request(uri, method: .get).response { response in
            
            imageBytes = UIImage(data: response.data!)
        }
        return imageBytes
    }
}
//
//extension UIImageView {
//    public func imageFromUrl(urlString: String) {
//        if let url = NSURL(string: urlString){
//            let request = NSURLRequest(URL: url)
//            
//        }
//    }
//}
