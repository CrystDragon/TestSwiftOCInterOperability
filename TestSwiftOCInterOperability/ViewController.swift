//
//  ViewController.swift
//  TestSwiftOCInterOperability
//
//  Created by 吴君恺 on 2018/8/22.
//  Copyright © 2018 wjk. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        testOCFunction()
    }
}

// MARK: - Logic to dispatch

class Model {

    required init() {
    
    }
    
    var name: String {
        return "Model"
    }
}

class RealModel: Model {
    override var name: String {
        return "RealModel"
    }
}

// MARK: - Attempt No.1

class GenericClass<T: Model>: NSObject {
    let model: T
    init(model: T) {
        self.model = model
    }
}

typealias _Concrete1 = GenericClass<RealModel>

// not working, heterogeneous abstractions (templates) cannot work with objc
// the following "@objc" attribute cannot be compiled

//@objc
class Concrete: _Concrete1 {

}

// MARK: - Attempt No.2

// based on meta type, working.
// only works when one level of abstraction is homogeneous
class GenericClass2: NSObject {
    let modelClass: Model.Type
    
    init<T: Model>(modelClass: T.Type) {
        self.modelClass = modelClass
    }
    
    @objc
    func print() {
        Swift.print(modelClass.init().name)
    }
}

@objc
class Concrete2: GenericClass2 {
    @objc init() {
        super.init(modelClass: RealModel.self)
    }
}
