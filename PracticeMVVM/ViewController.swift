//
//  ViewController.swift
//  PracticeMVVM
//
//  Created by KS on 2021/12/22.
//

import UIKit
import RxCocoa
import RxSwift

class ViewController: UIViewController {

    @IBOutlet weak var plusButton: UIButton!
    @IBOutlet weak var minusButton: UIButton!
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var countLabel: UILabel!

    private let dispose = DisposeBag()
    private let viewModel = ViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpVC()
        setUpVM()
    }

    private func setUpVC() {

        plusButton.rx.tap
            .asDriver()
            .drive(onNext: { [weak self] in
                self?.viewModel.incrementCount()
            })
            .disposed(by: dispose)

        minusButton.rx.tap
            .asDriver()
            .drive(onNext: {[weak self] in
                self?.viewModel.decrementCount()
            })
            .disposed(by: dispose)

        resetButton.rx.tap
            .asDriver()
            .drive(onNext: {[weak self] in
                self?.viewModel.resetCount()
            })
            .disposed(by: dispose)
    }

    private func setUpVM() {
        viewModel.countRelay
            .asDriver()
            .map( { return "\($0)"})
            .drive(countLabel.rx.text)
            .disposed(by: dispose)
    }
}
