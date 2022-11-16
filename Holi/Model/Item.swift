import Foundation

struct Item: Hashable {
    
    let id = UUID()
    
    let title: String
    let date: String
    let location: String
    
    init(title: String = "", date: String = "", location: String = "") {
        self.title = title
        self.date = date
        self.location = location
    }
    
}
