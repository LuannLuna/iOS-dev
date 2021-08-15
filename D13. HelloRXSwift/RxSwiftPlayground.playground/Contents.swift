import UIKit
import RxSwift
import RxCocoa
import PlaygroundSupport

/*
let observable = Observable.just(1)

let observable2 = Observable.of(1,2,3)

let observable3 = Observable.of([1,2,3])

let observable4 = Observable.from([1,2,3])


observable4.subscribe { event in
    if let element = event.element {
        print(element)
    }
}

observable3.subscribe { event in
    if let element = event.element {
        print(element)
    }
}

let subscription4 = observable4.subscribe(onNext: { (element) in
    print(element)
})

subscription4.dispose()
*/


/*
let disposeBag = DisposeBag()

Observable.of("A", "B", "C").subscribe{ print($0) }.disposed(by: disposeBag)

Observable<String>.create { observer in
    observer.onNext("A")
    observer.onCompleted()
    observer.onNext("?")
    return Disposables.create()
}.subscribe(onNext: { print($0) }, onError: { print($0) }, onCompleted: { print("Completed") }, onDisposed: { print("Disposed") }).disposed(by: disposeBag)
*/


/*
let disposeBag = DisposeBag()

let subject = PublishSubject<String>()

subject.onNext("Issue 1")

subject.subscribe { event in
    print(event)
}

subject.onNext("Issue 2")
*/


/*
let disposeBag = DisposeBag()

let subject = BehaviorSubject(value: "Initial Value")

subject.subscribe { event in
    print(event)
}

subject.onNext("Issue 1")
*/


/*
let disposeBag = DisposeBag()

let subbject = ReplaySubject<String>.create(bufferSize: 2)

subbject.onNext("Issue 1")
subbject.onNext("Issue 2")
subbject.onNext("Issue 3")

subbject.subscribe { print($0) }
*/


/*
let disposeBag = DisposeBag()

let variable = Variable("Initial Value")
variable.value = "Hello World"

variable.asObservable().subscribe {print($0)}
*/


//
//let disposeBag = DisposeBag()
//
//let relay = BehaviorRelay(value: ["initial value"])
//
//var value = relay.value
//value.append("Element 2")
//
//relay.accept(value)
//
//relay.asObservable().subscribe {print($0)}
//


let strikes = PublishSubject<String>()

let disposeBag = DisposeBag()

strikes.ignoreElements().subscribe { _ in
    print("[Subscriptions is called]")
}.disposed(by: disposeBag)
