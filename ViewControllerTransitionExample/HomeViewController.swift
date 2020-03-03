import UIKit
import Cartography

final class HomeViewController: UIViewController {

    let presentButton: UIButton = .make(contentColor: .white,
                                        backgroundColor: .systemPink,
                                        title: "Present the thing!",
                                        textFormat: (17.0, .bold),
                                        height: 56.0,
                                        cornerRadius: 28.0,
                                        padding: 16.0)

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(presentButton)
        constrain(presentButton) {
            $0.center == $0.superview!.center
        }

        presentButton.addTarget(self, action: #selector(presentButtonTapped), for: .touchUpInside)
    }

    @objc private func presentButtonTapped() {
        present(CoolViewController(), interactiveDismissalType: .standard)
    }
}
