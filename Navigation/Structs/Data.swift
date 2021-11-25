import UIKit

struct ProfilePost {
    let author: String
    let description: String
    let image: String
    var likes: Int
    var views: Int
}


struct DataStorage {
   static let profileTableViewPosts = [
        ProfilePost(author: "Жизненные коты", description: "Жизненно", image: "educationcat", likes: 4213, views: 63201),
        ProfilePost(author: "Юморески", description: "warning: анекдоты про евреев", image: "anekdot", likes: 1852, views: 13215),
        ProfilePost(author: "ИТ для всех", description: "узнали согласны?", image: "distant", likes: 438, views: 2361),
        ProfilePost(author: "Mood for today", description: "которыб", image: "catfish", likes: 16, views: 78)
    ]
}
