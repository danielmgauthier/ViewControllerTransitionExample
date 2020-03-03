import UIKit

enum ButtonStyle {
    case standard
    case outline
}

extension UIButton {
    static func make(image: UIImage? = nil,
                     contentColor: UIColor? = nil,
                     backgroundColor: UIColor = .clear,
                     title: String? = nil,
                     textFormat: (size: CGFloat, weight: UIFont.Weight)? = nil,
                     width: CGFloat? = nil,
                     height: CGFloat? = nil,
                     cornerRadius: CGFloat = 0.0,
                     padding: CGFloat = 0,
                     style: ButtonStyle = .standard,
                     targetSelector: (target: Any, action: Selector)? = nil) -> UIButton {

        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        if let image = image { button.setImage(image, for: .normal) }
        if let contentColor = contentColor {
            button.tintColor = contentColor
            button.setTitleColor(contentColor, for: .normal)
        }
        button.backgroundColor = backgroundColor
        if let title = title { button.setTitle(title, for: .normal) }
        if let textFormat = textFormat {
            button.titleLabel?.font = UIFont.systemFont(ofSize: textFormat.size, weight: textFormat.weight)
        }

        if let width = width { button.widthAnchor.constraint(equalToConstant: width).isActive = true }
        if let height = height { button.heightAnchor.constraint(equalToConstant: height).isActive = true }
        button.layer.cornerRadius = cornerRadius
        button.contentEdgeInsets = UIEdgeInsets(top: 0.0, left: padding, bottom: 0.0, right: padding)
        if let targetSelector = targetSelector { button.addTarget(targetSelector.target, action: targetSelector.action, for: .touchUpInside) }

        if image != nil && title != nil {
            button.contentEdgeInsets = UIEdgeInsets(top: 0, left: button.contentEdgeInsets.left + 4, bottom: 0, right: button.contentEdgeInsets.right + 8)
            button.titleEdgeInsets = UIEdgeInsets(top: 0, left: 4, bottom: 0, right: -4)
        }

        if style == .outline {
            button.layer.borderColor = contentColor?.cgColor
            button.layer.borderWidth = 2.0
        }

        return button
    }
}

extension UIView {
    static func make(backgroundColor: UIColor = .clear,
                     alpha: CGFloat = 1.0,
                     borderColor: UIColor = .clear,
                     borderWidth: CGFloat = 0.0,
                     height: CGFloat? = nil,
                     width: CGFloat? = nil,
                     cornerRadius: CGFloat = 0.0) -> UIView {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = backgroundColor
        view.alpha = alpha
        view.layer.borderColor = borderColor.cgColor
        view.layer.borderWidth = borderWidth
        view.layer.cornerRadius = cornerRadius
        if let height = height { view.heightAnchor.constraint(equalToConstant: height).isActive = true }
        if let width = width { view.widthAnchor.constraint(equalToConstant: width).isActive = true }
        return view
    }
}
