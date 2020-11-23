import Foundation

protocol ListInteractorOutputs: class {
    func onSuccessSearch(res: SearchRepositoriesResponse)
    func onErrorSearch(error: Error)
}

final class ListInteractor: Interactorable {

    weak var presenter: ListInteractorOutputs?

    func fetchSearch(language: String, page: Int) {
        let request = GitHubApi.SearchLanguageRequest(language: language, page: page)
        GitHubApi().search(with: request, onSuccess: { [weak self] res in
            self?.presenter?.onSuccessSearch(res: res)
        }) { [weak self] error in
            self?.presenter?.onErrorSearch(error: error)
        }
    }
}
