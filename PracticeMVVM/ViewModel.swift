//
//  ViewModel.swift
//  PracticeMVVM
//
//  Created by KS on 2021/12/22.
//

import Foundation
import RxRelay

class ViewModel {

    let countRelay = BehaviorRelay<Int>(value: 0)

    func incrementCount() {
        let count = countRelay.value + 1
        countRelay.accept(count)
    }

    func decrementCount() {
        let count = countRelay.value - 1
        countRelay.accept(count)
    }

    func resetCount() {
        countRelay.accept(0)
    }

}
