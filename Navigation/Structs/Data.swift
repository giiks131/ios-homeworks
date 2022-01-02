import UIKit

struct ProfilePost {
    let author: String
    let description: String
    let image: String
    var likes: Int
    var views: Int
}

struct Photo {
    let image: String
}

struct DataStorage {
   static let profileTableViewPosts = [
        ProfilePost(author: "Жизненные коты", description: "Жизненно", image: "educationcat", likes: 4213, views: 63201),
        ProfilePost(author: "Юморески", description: "warning: анекдоты про евреев", image: "anekdot", likes: 1852, views: 13215),
        ProfilePost(author: "IT nerds", description: "узнали согласны?", image: "distant", likes: 438, views: 2361),
        ProfilePost(author: "Mood for today", description: "которыб", image: "catfish", likes: 16, views: 78)
    ]
    
    static let photosStorage = [
        Photo(image: "mops1"),
        Photo(image: "mops2"),
        Photo(image: "mops3"),
        Photo(image: "mops4"),
        Photo(image: "mops5"),
        Photo(image: "mops6"),
        Photo(image: "mops7"),
        Photo(image: "mops8"),
        Photo(image: "mops9"),
        Photo(image: "mops10"),
        Photo(image: "mops11"),
        Photo(image: "mops12"),
        Photo(image: "mops13"),
        Photo(image: "mops14"),
        Photo(image: "mops15"),
        Photo(image: "mops16"),
        Photo(image: "mops17"),
        Photo(image: "mops18"),
        Photo(image: "mops19"),
        Photo(image: "mops20")
    ]
}


struct PhotosStorage {
    
}
