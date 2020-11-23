import UIKit

final class ViewController: UIViewController {

    @IBAction func pushListScreenAction(_ sender: Any) {
        ListRouterInput().push(from: self, entryEntity: ListEntryEntity(language: "Swift"))
    }

    @IBAction func presentListScreenAction(_ sender: Any) {
        ListRouterInput().present(from: self, entryEntity: ListEntryEntity(language: "Swift"))
    }

}

extension ViewController: Viewable {}
