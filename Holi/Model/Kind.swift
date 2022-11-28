import Foundation

struct Kind: RawRepresentable, Hashable {
    typealias RawValue = String
    var rawValue: String
    
    init(rawValue: String) {
        self.rawValue = rawValue
    }
    
    static let feature = Kind(rawValue: Section.App.feature.rawValue)
    static let recommended = Kind(rawValue: Section.App.recommended.rawValue)
    static let latest = Kind(rawValue: Section.App.latest.rawValue)
    static let categories = Kind(rawValue: Section.App.categories.rawValue)
    static let detailImage = Kind(rawValue: Section.App.detailImage.rawValue)
    static let detailInfo = Kind(rawValue: Section.App.detailInfo.rawValue)
    static let recomendations = Kind(rawValue: Section.App.recomendations.rawValue)
    static let location = Kind(rawValue: Section.App.location.rawValue)
    static let aboutGuide = Kind(rawValue: Section.App.aboutGuide.rawValue)
    static let similiarEvents = Kind(rawValue: Section.App.similiarEvents.rawValue)
}
