import Foundation

struct Kind: RawRepresentable, Hashable {
    typealias RawValue = String
    var rawValue: String
    
    init(rawValue: String) {
        self.rawValue = rawValue
    }
    
    static let feature = Kind(rawValue: Section.App.feature.rawValue)
    static let recommended = Kind(rawValue: Section.App.recommended.rawValue)
}
