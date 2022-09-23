//
//  BaseViewController.swift
//  Bidit
//
//  Created by pokers on 2022/09/20.
//

import Foundation

import UIKit
import RxSwift
import SwiftyColor
import SwiftyImage

class BaseViewController: UIViewController {
    lazy private(set) var className: String = {
    return type(of: self).description().components(separatedBy: ".").last ?? ""
    }()

    init() {
        super.init(nibName: nil, bundle: nil)
    }
    required convenience init?(coder aDecoder: NSCoder) {
        self.init()
    }

    deinit {
        log.info("DEINIT: \(self.className)")
    }

    var disposeBag = DisposeBag()

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }

    private(set) var didSetupConstraints = false

    override func viewDidLoad() {
        self.view.setNeedsUpdateConstraints()
    }

    override func updateViewConstraints() {
        if !self.didSetupConstraints {
            self.setupConstraints()
            self.didSetupConstraints = true
        }
        super.updateViewConstraints()
    }

    func setupConstraints() {
    // Override point
    }
}
