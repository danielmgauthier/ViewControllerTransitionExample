import UIKit

protocol InteractionControlling: UIViewControllerInteractiveTransitioning {
    var interactionInProgress: Bool { get }
}
