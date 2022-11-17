import Foundation

struct Section: Hashable {
    let id = UUID()
    
    let title: String
    let subtitle: String
    let kind: Kind
    let items: [Item]
    
    init(title: String = "", subtitle: String = "", kind: Kind, items: [Item]) {
        self.title = title
        self.subtitle = subtitle
        self.kind = kind
        self.items = items
    }
    
    enum App: String {
        case feature
        case recommended
        case latest
        case categories
    }
    
}
