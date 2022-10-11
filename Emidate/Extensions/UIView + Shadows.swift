
import UIKit

typealias GradientPoints = (startPoint: CGPoint, endPoint: CGPoint)

enum GradientOrientation {
  case topRightBottomLeft
  case topLeftBottomRight
  case horizontal
  case vertical

  var startPoint: CGPoint {
    return points.startPoint
  }

  var endPoint: CGPoint {
    return points.endPoint
  }

  var points: GradientPoints {
    switch self {
    case .topRightBottomLeft:
      return (CGPoint(x: 0.0, y: 1.0), CGPoint(x: 1.0, y: 0.0))
    case .topLeftBottomRight:
      return (CGPoint(x: 0.0, y: 0.0), CGPoint(x: 1.0, y: 1.0))
    case .horizontal:
      return (CGPoint(x: 0.0, y: 0.0), CGPoint(x: 1.0, y: 0.0))
    case .vertical:
      return (CGPoint(x: 0.0, y: 0.0), CGPoint(x: 0.0, y: 1.0))
    }
  }
}


extension UIView {
  func applyGradient(with colors: [UIColor], gradientOrientation orientation: GradientOrientation) {
    let gradient = CAGradientLayer()
    gradient.frame = self.bounds
    gradient.colors = colors.map { $0.cgColor }
    gradient.startPoint = orientation.startPoint
    gradient.endPoint = orientation.endPoint
    gradient.borderColor = self.layer.borderColor
    gradient.borderWidth = self.layer.borderWidth
    gradient.cornerRadius = self.layer.cornerRadius
    gradient.masksToBounds = true
    gradient.isHidden = false

    self.layer.insertSublayer(gradient, at: 0)
  }
}

