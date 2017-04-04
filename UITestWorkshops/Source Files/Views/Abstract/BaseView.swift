//
//  BaseView.swift
//  UITestWorkshops

import UIKit

class BaseView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)

        setupProperties()
        setupHierarchy()
        setupConstraints()
        setupBindings()
    }

    @available(*, unavailable, message: "Use init(frame:) instead")
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: Abstract

    /// Sets up the properties of `self`. Called automatically on `init()`.
    internal func setupProperties() {
        // no-op by default
    }

    /// Sets up the view hierarchy of `self`. Called automatically on `init()`.
    internal func setupHierarchy() {
        // no-op by default
    }

    /// Sets up layout constraints in `self`. Called automatically on `init()`.
    internal func setupConstraints() {
        // no-op by default
    }

    /// Sets up the bindings inside `self`. Called automatically on `init()`.
    internal func setupBindings() {
        // no-op by default
    }
    
}
