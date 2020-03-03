import UIKit
import Cartography

class CoolViewController: UIViewController, CustomPresentable {
    var transitionManager: UIViewControllerTransitioningDelegate?

    let rectangleView: UIView = .make(backgroundColor: UIColor.systemPink.withAlphaComponent(0.5), cornerRadius: 12.0)

    let sizeButton: UIButton = .make(
        contentColor: .white,
        backgroundColor: .systemPink,
        title: "Change rectangle size!",
        textFormat: (17.0, .bold),
        height: 50,
        cornerRadius: 25,
        padding: 16
    )

    let dismissButton: UIButton = .make(
        contentColor: .systemPink,
        backgroundColor: .clear,
        title: "Dismiss",
        textFormat: (17.0, .bold),
        height: 50,
        cornerRadius: 25,
        padding: 16,
        style: .outline
    )

    var rectangleHeightConstraint: NSLayoutConstraint!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.layer.cornerRadius = 20.0
        view.addSubview(rectangleView)
        view.addSubview(sizeButton)
        view.addSubview(dismissButton)

        constrain(rectangleView) {
            $0.top == $0.superview!.top + 16.0
            $0.leading == $0.superview!.leading + 16.0
            $0.trailing == $0.superview!.trailing - 16.0
            rectangleHeightConstraint = ($0.height == 100.0)
        }

        constrain(sizeButton, rectangleView) {
            $0.top == $1.bottom + 16.0
            $0.centerX == $0.superview!.centerX
        }

        constrain(dismissButton, sizeButton) {
            $0.top == $1.bottom + 16.0
            $0.width == $1.width
            $0.centerX == $1.centerX
            $0.bottom == $0.superview!.bottom - 16.0 ~ .init(999)
        }

        sizeButton.addTarget(self, action: #selector(sizeButtonTapped), for: .touchUpInside)
        dismissButton.addTarget(self, action: #selector(dismissButtonTapped), for: .touchUpInside)
    }

    @objc private func dismissButtonTapped() {
        dismiss(animated: true)
    }

    @objc private func sizeButtonTapped() {
        rectangleHeightConstraint.constant = CGFloat(Int.random(in: 50...400))
        updatePresentationLayout(animated: true)
    }
}
