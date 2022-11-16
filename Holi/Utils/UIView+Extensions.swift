import Foundation
import UIKit

extension UIView {
  @IBInspectable var cornerRaduis: CGFloat {
      get { layer.cornerRadius }
      set {
          layer.cornerRadius = newValue
          layer.masksToBounds = newValue > 0
      }
    }
}
