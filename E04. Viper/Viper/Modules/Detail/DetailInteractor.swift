import Foundation

protocol DetailInteractorOutputs: class {

}

final class DetailInteractor: Interactorable {
    weak var presenter: DetailInteractorOutputs?
}

