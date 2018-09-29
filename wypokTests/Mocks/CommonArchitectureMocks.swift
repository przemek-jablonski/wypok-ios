// MARK: - Mocks generated from file: wypok/Common/Architecture/Presenter.swift at 2018-09-29 9:41:27 PM +0000

//
//  Presenter.swift
//  wypok
//
//  Created by Przemyslaw Jablonski on 26/07/2018.
//  Copyright © 2018 Przemyslaw Jablonski. All rights reserved.
//

import Cuckoo
@testable import wypok

import Foundation

class MockPresenter: Presenter, Cuckoo.ProtocolMock {
    typealias MocksType = Presenter
    typealias Stubbing = __StubbingProxy_Presenter
    typealias Verification = __VerificationProxy_Presenter
    let cuckoo_manager = Cuckoo.MockManager(hasParent: false)

    

    

    
    // ["name": "attach", "returnSignature": "", "fullyQualifiedName": "attach(_: View)", "parameterSignature": "_ view: View", "parameterSignatureWithoutNames": "view: View", "inputTypes": "View", "isThrowing": false, "isInit": false, "isOverriding": false, "hasClosureParams": false, "@type": "ProtocolMethod", "accessibility": "", "parameterNames": "view", "call": "view", "parameters": [CuckooGeneratorFramework.MethodParameter(label: nil, name: "view", type: "View", range: CountableRange(217..<229), nameRange: CountableRange(0..<0))], "returnType": "Void", "isOptional": false, "stubFunction": "Cuckoo.ProtocolStubNoReturnFunction"]
     func attach(_ view: View)  {
        
            return cuckoo_manager.call("attach(_: View)",
                parameters: (view),
                superclassCall:
                    
                    Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                    )
        
    }
    
    // ["name": "detach", "returnSignature": "", "fullyQualifiedName": "detach(_: View)", "parameterSignature": "_ view: View", "parameterSignatureWithoutNames": "view: View", "inputTypes": "View", "isThrowing": false, "isInit": false, "isOverriding": false, "hasClosureParams": false, "@type": "ProtocolMethod", "accessibility": "", "parameterNames": "view", "call": "view", "parameters": [CuckooGeneratorFramework.MethodParameter(label: nil, name: "view", type: "View", range: CountableRange(252..<264), nameRange: CountableRange(0..<0))], "returnType": "Void", "isOptional": false, "stubFunction": "Cuckoo.ProtocolStubNoReturnFunction"]
     func detach(_ view: View)  {
        
            return cuckoo_manager.call("detach(_: View)",
                parameters: (view),
                superclassCall:
                    
                    Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                    )
        
    }
    

	struct __StubbingProxy_Presenter: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	    init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	    func attach<M1: Cuckoo.Matchable>(_ view: M1) -> Cuckoo.ProtocolStubNoReturnFunction<(View)> where M1.MatchedType == View {
	        let matchers: [Cuckoo.ParameterMatcher<(View)>] = [wrap(matchable: view) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockPresenter.self, method: "attach(_: View)", parameterMatchers: matchers))
	    }
	    
	    func detach<M1: Cuckoo.Matchable>(_ view: M1) -> Cuckoo.ProtocolStubNoReturnFunction<(View)> where M1.MatchedType == View {
	        let matchers: [Cuckoo.ParameterMatcher<(View)>] = [wrap(matchable: view) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockPresenter.self, method: "detach(_: View)", parameterMatchers: matchers))
	    }
	    
	}

	struct __VerificationProxy_Presenter: Cuckoo.VerificationProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	    private let callMatcher: Cuckoo.CallMatcher
	    private let sourceLocation: Cuckoo.SourceLocation
	
	    init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
	        self.cuckoo_manager = manager
	        self.callMatcher = callMatcher
	        self.sourceLocation = sourceLocation
	    }
	
	    
	
	    
	    @discardableResult
	    func attach<M1: Cuckoo.Matchable>(_ view: M1) -> Cuckoo.__DoNotUse<Void> where M1.MatchedType == View {
	        let matchers: [Cuckoo.ParameterMatcher<(View)>] = [wrap(matchable: view) { $0 }]
	        return cuckoo_manager.verify("attach(_: View)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func detach<M1: Cuckoo.Matchable>(_ view: M1) -> Cuckoo.__DoNotUse<Void> where M1.MatchedType == View {
	        let matchers: [Cuckoo.ParameterMatcher<(View)>] = [wrap(matchable: view) { $0 }]
	        return cuckoo_manager.verify("detach(_: View)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	}

}

 class PresenterStub: Presenter {
    

    

    
     func attach(_ view: View)  {
        return DefaultValueRegistry.defaultValue(for: Void.self)
    }
    
     func detach(_ view: View)  {
        return DefaultValueRegistry.defaultValue(for: Void.self)
    }
    
}


// MARK: - Mocks generated from file: wypok/Common/Architecture/View.swift at 2018-09-29 9:41:27 PM +0000

//
//  View.swift
//  wypok
//
//  Created by Przemyslaw Jablonski on 26/07/2018.
//  Copyright © 2018 Przemyslaw Jablonski. All rights reserved.
//

import Cuckoo
@testable import wypok

import Foundation

class MockView: View, Cuckoo.ProtocolMock {
    typealias MocksType = View
    typealias Stubbing = __StubbingProxy_View
    typealias Verification = __VerificationProxy_View
    let cuckoo_manager = Cuckoo.MockManager(hasParent: false)

    

    

    
    // ["name": "render", "returnSignature": "", "fullyQualifiedName": "render(_: ViewState)", "parameterSignature": "_ viewState: ViewState", "parameterSignatureWithoutNames": "viewState: ViewState", "inputTypes": "ViewState", "isThrowing": false, "isInit": false, "isOverriding": false, "hasClosureParams": false, "@type": "ProtocolMethod", "accessibility": "", "parameterNames": "viewState", "call": "viewState", "parameters": [CuckooGeneratorFramework.MethodParameter(label: nil, name: "viewState", type: "ViewState", range: CountableRange(207..<229), nameRange: CountableRange(0..<0))], "returnType": "Void", "isOptional": false, "stubFunction": "Cuckoo.ProtocolStubNoReturnFunction"]
     func render(_ viewState: ViewState)  {
        
            return cuckoo_manager.call("render(_: ViewState)",
                parameters: (viewState),
                superclassCall:
                    
                    Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                    )
        
    }
    

	struct __StubbingProxy_View: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	    init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	    func render<M1: Cuckoo.Matchable>(_ viewState: M1) -> Cuckoo.ProtocolStubNoReturnFunction<(ViewState)> where M1.MatchedType == ViewState {
	        let matchers: [Cuckoo.ParameterMatcher<(ViewState)>] = [wrap(matchable: viewState) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockView.self, method: "render(_: ViewState)", parameterMatchers: matchers))
	    }
	    
	}

	struct __VerificationProxy_View: Cuckoo.VerificationProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	    private let callMatcher: Cuckoo.CallMatcher
	    private let sourceLocation: Cuckoo.SourceLocation
	
	    init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
	        self.cuckoo_manager = manager
	        self.callMatcher = callMatcher
	        self.sourceLocation = sourceLocation
	    }
	
	    
	
	    
	    @discardableResult
	    func render<M1: Cuckoo.Matchable>(_ viewState: M1) -> Cuckoo.__DoNotUse<Void> where M1.MatchedType == ViewState {
	        let matchers: [Cuckoo.ParameterMatcher<(ViewState)>] = [wrap(matchable: viewState) { $0 }]
	        return cuckoo_manager.verify("render(_: ViewState)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	}

}

 class ViewStub: View {
    

    

    
     func render(_ viewState: ViewState)  {
        return DefaultValueRegistry.defaultValue(for: Void.self)
    }
    
}

