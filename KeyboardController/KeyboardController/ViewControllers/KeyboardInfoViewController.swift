//
//  KeyboardInfoViewController.swift
//  KeyboardController
//
//  Created by Igor Kulik on 08.10.2020.
//

import Foundation
import UIKit

final class KeyboardInfoViewController: UIViewController {

    // MARK: - Outlets

    @IBOutlet private weak var keyboardInfoLabel: UILabel!

    // MARK: - Constraints

    @IBOutlet private weak var adjustableViewBottom: NSLayoutConstraint!

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChangeFrame(_:)), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }

    // MARK: - Notifications

    @objc private func keyboardWillChangeFrame(_ notification: Notification) {
        guard let keyboardInfo = KeyboardInfo(notification: notification) else { return }
        keyboardInfoLabel.text = String(describing: keyboardInfo)
    }

    @objc private func keyboardWillShow(_ notification: Notification) {
        guard let keyboardInfo = KeyboardInfo(notification: notification) else { return }
        adjustableViewBottom.constant = keyboardInfo.frameHeightDelta - view.safeAreaInsets.bottom
        keyboardInfo.animateView({ [weak self] in
            self?.view.layoutIfNeeded()
        })
    }

    @objc private func keyboardWillHide(_ notification: Notification) {
        guard let keyboardInfo = KeyboardInfo(notification: notification) else { return }
        adjustableViewBottom.constant = 0.0
        keyboardInfo.animateView({ [weak self] in
            self?.view.layoutIfNeeded()
        })
    }
}

// MARK: - UITextFieldDelegate
extension KeyboardInfoViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.endEditing(true)
        return true
    }
}
