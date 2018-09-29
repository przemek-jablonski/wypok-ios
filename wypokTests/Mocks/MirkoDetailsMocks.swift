// MARK: - Mocks generated from file: wypok/MirkoDetails/MirkoDetailsInteractor.swift at 2018-09-29 9:56:49 PM +0000

//
//  MirkoDetailsInteractor.swift
//  wypok
//
//  Created by Przemyslaw Jablonski on 09/09/2018.
//  Copyright © 2018 Przemyslaw Jablonski. All rights reserved.
//

import Cuckoo
@testable import wypok

class MockMirkoDetailsInteractor: MirkoDetailsInteractor, Cuckoo.ProtocolMock {
    typealias MocksType = MirkoDetailsInteractor
    typealias Stubbing = __StubbingProxy_MirkoDetailsInteractor
    typealias Verification = __VerificationProxy_MirkoDetailsInteractor
    let cuckoo_manager = Cuckoo.MockManager(hasParent: false)

    

    

    
    // ["name": "getMirkoItemDetails", "returnSignature": "", "fullyQualifiedName": "getMirkoItemDetails(for: Int, fetchDidSucceed: @escaping ItemFetchedClosure, fetchDidFailed: @escaping FetchingFailureClosure)", "parameterSignature": "for itemId: Int, fetchDidSucceed successClosure: @escaping ItemFetchedClosure, fetchDidFailed failureClosure: @escaping FetchingFailureClosure", "parameterSignatureWithoutNames": "itemId: Int, successClosure: @escaping ItemFetchedClosure, failureClosure: @escaping FetchingFailureClosure", "inputTypes": "Int, ItemFetchedClosure, FetchingFailureClosure", "isThrowing": false, "isInit": false, "isOverriding": false, "hasClosureParams": false, "@type": "ProtocolMethod", "accessibility": "", "parameterNames": "itemId, successClosure, failureClosure", "call": "for: itemId, fetchDidSucceed: successClosure, fetchDidFailed: failureClosure", "parameters": [CuckooGeneratorFramework.MethodParameter(label: Optional("for"), name: "itemId", type: "Int", range: CountableRange(384..<399), nameRange: CountableRange(384..<387)), CuckooGeneratorFramework.MethodParameter(label: Optional("fetchDidSucceed"), name: "successClosure", type: "@escaping ItemFetchedClosure", range: CountableRange(409..<469), nameRange: CountableRange(409..<424)), CuckooGeneratorFramework.MethodParameter(label: Optional("fetchDidFailed"), name: "failureClosure", type: "@escaping FetchingFailureClosure", range: CountableRange(479..<542), nameRange: CountableRange(479..<493))], "returnType": "Void", "isOptional": false, "stubFunction": "Cuckoo.ProtocolStubNoReturnFunction"]
     func getMirkoItemDetails(for itemId: Int, fetchDidSucceed successClosure: @escaping ItemFetchedClosure, fetchDidFailed failureClosure: @escaping FetchingFailureClosure)  {
        
            return cuckoo_manager.call("getMirkoItemDetails(for: Int, fetchDidSucceed: @escaping ItemFetchedClosure, fetchDidFailed: @escaping FetchingFailureClosure)",
                parameters: (itemId, successClosure, failureClosure),
                superclassCall:
                    
                    Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                    )
        
    }
    

	struct __StubbingProxy_MirkoDetailsInteractor: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	    init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	    func getMirkoItemDetails<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable, M3: Cuckoo.Matchable>(for itemId: M1, fetchDidSucceed successClosure: M2, fetchDidFailed failureClosure: M3) -> Cuckoo.ProtocolStubNoReturnFunction<(Int, ItemFetchedClosure, FetchingFailureClosure)> where M1.MatchedType == Int, M2.MatchedType == ItemFetchedClosure, M3.MatchedType == FetchingFailureClosure {
	        let matchers: [Cuckoo.ParameterMatcher<(Int, ItemFetchedClosure, FetchingFailureClosure)>] = [wrap(matchable: itemId) { $0.0 }, wrap(matchable: successClosure) { $0.1 }, wrap(matchable: failureClosure) { $0.2 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockMirkoDetailsInteractor.self, method: "getMirkoItemDetails(for: Int, fetchDidSucceed: @escaping ItemFetchedClosure, fetchDidFailed: @escaping FetchingFailureClosure)", parameterMatchers: matchers))
	    }
	    
	}

	struct __VerificationProxy_MirkoDetailsInteractor: Cuckoo.VerificationProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	    private let callMatcher: Cuckoo.CallMatcher
	    private let sourceLocation: Cuckoo.SourceLocation
	
	    init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
	        self.cuckoo_manager = manager
	        self.callMatcher = callMatcher
	        self.sourceLocation = sourceLocation
	    }
	
	    
	
	    
	    @discardableResult
	    func getMirkoItemDetails<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable, M3: Cuckoo.Matchable>(for itemId: M1, fetchDidSucceed successClosure: M2, fetchDidFailed failureClosure: M3) -> Cuckoo.__DoNotUse<Void> where M1.MatchedType == Int, M2.MatchedType == ItemFetchedClosure, M3.MatchedType == FetchingFailureClosure {
	        let matchers: [Cuckoo.ParameterMatcher<(Int, ItemFetchedClosure, FetchingFailureClosure)>] = [wrap(matchable: itemId) { $0.0 }, wrap(matchable: successClosure) { $0.1 }, wrap(matchable: failureClosure) { $0.2 }]
	        return cuckoo_manager.verify("getMirkoItemDetails(for: Int, fetchDidSucceed: @escaping ItemFetchedClosure, fetchDidFailed: @escaping FetchingFailureClosure)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	}

}

 class MirkoDetailsInteractorStub: MirkoDetailsInteractor {
    

    

    
     func getMirkoItemDetails(for itemId: Int, fetchDidSucceed successClosure: @escaping ItemFetchedClosure, fetchDidFailed failureClosure: @escaping FetchingFailureClosure)  {
        return DefaultValueRegistry.defaultValue(for: Void.self)
    }
    
}


// MARK: - Mocks generated from file: wypok/MirkoDetails/MirkoDetailsPresenter.swift at 2018-09-29 9:56:49 PM +0000

//
//  MirkoDetailsPresenter.swift
//  wypok
//
//  Created by Przemyslaw Jablonski on 08/09/2018.
//  Copyright © 2018 Przemyslaw Jablonski. All rights reserved.
//

import Cuckoo
@testable import wypok

class MockMirkoDetailsPresenter: BasePresenter<WypokMirkoDetailsViewState>, MirkoDetailsPresenter, Cuckoo.ProtocolMock {
    
    typealias MocksType = MirkoDetailsPresenter
    typealias Stubbing = __StubbingProxy_MirkoDetailsPresenter
    typealias Verification = __VerificationProxy_MirkoDetailsPresenter
    let cuckoo_manager = Cuckoo.MockManager(hasParent: false)

    

    
    // ["name": "onSelectedEntryIdReceived", "returnSignature": "", "fullyQualifiedName": "onSelectedEntryIdReceived(_: Int)", "parameterSignature": "_ id: Int", "parameterSignatureWithoutNames": "id: Int", "inputTypes": "Int", "isThrowing": false, "isInit": false, "isOverriding": false, "hasClosureParams": false, "@type": "ProtocolMethod", "accessibility": "", "parameterNames": "id", "call": "id", "parameters": [CuckooGeneratorFramework.MethodParameter(label: nil, name: "id", type: "Int", range: CountableRange(252..<261), nameRange: CountableRange(0..<0))], "returnType": "Void", "isOptional": false, "stubFunction": "Cuckoo.ProtocolStubNoReturnFunction"]
     func onSelectedEntryIdReceived(_ id: Int)  {
        
            return cuckoo_manager.call("onSelectedEntryIdReceived(_: Int)",
                parameters: (id),
                superclassCall:
                    
                    Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                    )
        
    }
    

	struct __StubbingProxy_MirkoDetailsPresenter: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	    init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	    func onSelectedEntryIdReceived<M1: Cuckoo.Matchable>(_ id: M1) -> Cuckoo.ProtocolStubNoReturnFunction<(Int)> where M1.MatchedType == Int {
	        let matchers: [Cuckoo.ParameterMatcher<(Int)>] = [wrap(matchable: id) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockMirkoDetailsPresenter.self, method: "onSelectedEntryIdReceived(_: Int)", parameterMatchers: matchers))
	    }
	    
	}

	struct __VerificationProxy_MirkoDetailsPresenter: Cuckoo.VerificationProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	    private let callMatcher: Cuckoo.CallMatcher
	    private let sourceLocation: Cuckoo.SourceLocation
	
	    init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
	        self.cuckoo_manager = manager
	        self.callMatcher = callMatcher
	        self.sourceLocation = sourceLocation
	    }
	
	    
	
	    
	    @discardableResult
	    func onSelectedEntryIdReceived<M1: Cuckoo.Matchable>(_ id: M1) -> Cuckoo.__DoNotUse<Void> where M1.MatchedType == Int {
	        let matchers: [Cuckoo.ParameterMatcher<(Int)>] = [wrap(matchable: id) { $0 }]
	        return cuckoo_manager.verify("onSelectedEntryIdReceived(_: Int)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	}

}

class MirkoDetailsPresenterStub: MirkoDetailsPresenter {
    func attach(_ view: View) {
        
    }
    
    func detach(_ view: View) {
        
    }
    
    
     func onSelectedEntryIdReceived(_ id: Int)  {
        return DefaultValueRegistry.defaultValue(for: Void.self)
    }
    
}

