// MARK: - Mocks generated from file: wypok/Common/Networking/Wykop/Services/FrontPageService.swift at 2018-09-29 9:55:39 PM +0000

//
//  FrontPageService.swift
//  wypok
//
//  Created by Przemyslaw Jablonski on 03/08/2018.
//  Copyright © 2018 Przemyslaw Jablonski. All rights reserved.
//

import Cuckoo
@testable import wypok

class MockFrontPageService: FrontPageService, Cuckoo.ProtocolMock {
    typealias MocksType = FrontPageService
    typealias Stubbing = __StubbingProxy_FrontPageService
    typealias Verification = __VerificationProxy_FrontPageService
    let cuckoo_manager = Cuckoo.MockManager(hasParent: false)

    

    

    
    // ["name": "getLinksPromoted", "returnSignature": "", "fullyQualifiedName": "getLinksPromoted(and: @escaping ItemsFetchedClosure, fetchDidFailed: @escaping WypokBaseService.ServiceFailureClosure)", "parameterSignature": "and successClosure: @escaping ItemsFetchedClosure, fetchDidFailed failureClosure: @escaping WypokBaseService.ServiceFailureClosure", "parameterSignatureWithoutNames": "successClosure: @escaping ItemsFetchedClosure, failureClosure: @escaping WypokBaseService.ServiceFailureClosure", "inputTypes": "ItemsFetchedClosure, WypokBaseService.ServiceFailureClosure", "isThrowing": false, "isInit": false, "isOverriding": false, "hasClosureParams": false, "@type": "ProtocolMethod", "accessibility": "", "parameterNames": "successClosure, failureClosure", "call": "and: successClosure, fetchDidFailed: failureClosure", "parameters": [CuckooGeneratorFramework.MethodParameter(label: Optional("and"), name: "successClosure", type: "@escaping ItemsFetchedClosure", range: CountableRange(328..<377), nameRange: CountableRange(328..<331)), CuckooGeneratorFramework.MethodParameter(label: Optional("fetchDidFailed"), name: "failureClosure", type: "@escaping WypokBaseService.ServiceFailureClosure", range: CountableRange(379..<458), nameRange: CountableRange(379..<393))], "returnType": "Void", "isOptional": false, "stubFunction": "Cuckoo.ProtocolStubNoReturnFunction"]
     func getLinksPromoted(and successClosure: @escaping ItemsFetchedClosure, fetchDidFailed failureClosure: @escaping WypokBaseService.ServiceFailureClosure)  {
        
            return cuckoo_manager.call("getLinksPromoted(and: @escaping ItemsFetchedClosure, fetchDidFailed: @escaping WypokBaseService.ServiceFailureClosure)",
                parameters: (successClosure, failureClosure),
                superclassCall:
                    
                    Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                    )
        
    }
    

	struct __StubbingProxy_FrontPageService: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	    init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	    func getLinksPromoted<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable>(and successClosure: M1, fetchDidFailed failureClosure: M2) -> Cuckoo.ProtocolStubNoReturnFunction<(ItemsFetchedClosure, WypokBaseService.ServiceFailureClosure)> where M1.MatchedType == ItemsFetchedClosure, M2.MatchedType == WypokBaseService.ServiceFailureClosure {
	        let matchers: [Cuckoo.ParameterMatcher<(ItemsFetchedClosure, WypokBaseService.ServiceFailureClosure)>] = [wrap(matchable: successClosure) { $0.0 }, wrap(matchable: failureClosure) { $0.1 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockFrontPageService.self, method: "getLinksPromoted(and: @escaping ItemsFetchedClosure, fetchDidFailed: @escaping WypokBaseService.ServiceFailureClosure)", parameterMatchers: matchers))
	    }
	    
	}

	struct __VerificationProxy_FrontPageService: Cuckoo.VerificationProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	    private let callMatcher: Cuckoo.CallMatcher
	    private let sourceLocation: Cuckoo.SourceLocation
	
	    init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
	        self.cuckoo_manager = manager
	        self.callMatcher = callMatcher
	        self.sourceLocation = sourceLocation
	    }
	
	    
	
	    
	    @discardableResult
	    func getLinksPromoted<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable>(and successClosure: M1, fetchDidFailed failureClosure: M2) -> Cuckoo.__DoNotUse<Void> where M1.MatchedType == ItemsFetchedClosure, M2.MatchedType == WypokBaseService.ServiceFailureClosure {
	        let matchers: [Cuckoo.ParameterMatcher<(ItemsFetchedClosure, WypokBaseService.ServiceFailureClosure)>] = [wrap(matchable: successClosure) { $0.0 }, wrap(matchable: failureClosure) { $0.1 }]
	        return cuckoo_manager.verify("getLinksPromoted(and: @escaping ItemsFetchedClosure, fetchDidFailed: @escaping WypokBaseService.ServiceFailureClosure)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	}

}

 class FrontPageServiceStub: FrontPageService {
    

    

    
     func getLinksPromoted(and successClosure: @escaping ItemsFetchedClosure, fetchDidFailed failureClosure: @escaping WypokBaseService.ServiceFailureClosure)  {
        return DefaultValueRegistry.defaultValue(for: Void.self)
    }
    
}


// MARK: - Mocks generated from file: wypok/Common/Networking/Wykop/Services/MirkoService.swift at 2018-09-29 9:55:39 PM +0000

//
//  MirkoService.swift
//  wypok
//
//  Created by Przemyslaw Jablonski on 12/08/2018.
//  Copyright © 2018 Przemyslaw Jablonski. All rights reserved.
//

import Cuckoo
@testable import wypok

class MockMirkoService: MirkoService, Cuckoo.ProtocolMock {
    typealias MocksType = MirkoService
    typealias Stubbing = __StubbingProxy_MirkoService
    typealias Verification = __VerificationProxy_MirkoService
    let cuckoo_manager = Cuckoo.MockManager(hasParent: false)

    

    

    
    // ["name": "getMirkoRecents", "returnSignature": "", "fullyQualifiedName": "getMirkoRecents(for: Int, and: @escaping ItemsFetchedClosure, fetchDidFailed: @escaping WypokBaseService.ServiceFailureClosure)", "parameterSignature": "for page: Int, and successClosure: @escaping ItemsFetchedClosure, fetchDidFailed failureClosure: @escaping WypokBaseService.ServiceFailureClosure", "parameterSignatureWithoutNames": "page: Int, successClosure: @escaping ItemsFetchedClosure, failureClosure: @escaping WypokBaseService.ServiceFailureClosure", "inputTypes": "Int, ItemsFetchedClosure, WypokBaseService.ServiceFailureClosure", "isThrowing": false, "isInit": false, "isOverriding": false, "hasClosureParams": false, "@type": "ProtocolMethod", "accessibility": "", "parameterNames": "page, successClosure, failureClosure", "call": "for: page, and: successClosure, fetchDidFailed: failureClosure", "parameters": [CuckooGeneratorFramework.MethodParameter(label: Optional("for"), name: "page", type: "Int", range: CountableRange(389..<402), nameRange: CountableRange(389..<392)), CuckooGeneratorFramework.MethodParameter(label: Optional("and"), name: "successClosure", type: "@escaping ItemsFetchedClosure", range: CountableRange(404..<453), nameRange: CountableRange(404..<407)), CuckooGeneratorFramework.MethodParameter(label: Optional("fetchDidFailed"), name: "failureClosure", type: "@escaping WypokBaseService.ServiceFailureClosure", range: CountableRange(455..<534), nameRange: CountableRange(455..<469))], "returnType": "Void", "isOptional": false, "stubFunction": "Cuckoo.ProtocolStubNoReturnFunction"]
     func getMirkoRecents(for page: Int, and successClosure: @escaping ItemsFetchedClosure, fetchDidFailed failureClosure: @escaping WypokBaseService.ServiceFailureClosure)  {
        
            return cuckoo_manager.call("getMirkoRecents(for: Int, and: @escaping ItemsFetchedClosure, fetchDidFailed: @escaping WypokBaseService.ServiceFailureClosure)",
                parameters: (page, successClosure, failureClosure),
                superclassCall:
                    
                    Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                    )
        
    }
    
    // ["name": "getMirkoHots", "returnSignature": "", "fullyQualifiedName": "getMirkoHots(for: Int, and: Int, and: @escaping ItemsFetchedClosure, fetchDidFailed: @escaping WypokBaseService.ServiceFailureClosure)", "parameterSignature": "for page: Int, and period: Int, and successClosure: @escaping ItemsFetchedClosure, fetchDidFailed failureClosure: @escaping WypokBaseService.ServiceFailureClosure", "parameterSignatureWithoutNames": "page: Int, period: Int, successClosure: @escaping ItemsFetchedClosure, failureClosure: @escaping WypokBaseService.ServiceFailureClosure", "inputTypes": "Int, Int, ItemsFetchedClosure, WypokBaseService.ServiceFailureClosure", "isThrowing": false, "isInit": false, "isOverriding": false, "hasClosureParams": false, "@type": "ProtocolMethod", "accessibility": "", "parameterNames": "page, period, successClosure, failureClosure", "call": "for: page, and: period, and: successClosure, fetchDidFailed: failureClosure", "parameters": [CuckooGeneratorFramework.MethodParameter(label: Optional("for"), name: "page", type: "Int", range: CountableRange(563..<576), nameRange: CountableRange(563..<566)), CuckooGeneratorFramework.MethodParameter(label: Optional("and"), name: "period", type: "Int", range: CountableRange(578..<593), nameRange: CountableRange(578..<581)), CuckooGeneratorFramework.MethodParameter(label: Optional("and"), name: "successClosure", type: "@escaping ItemsFetchedClosure", range: CountableRange(595..<644), nameRange: CountableRange(595..<598)), CuckooGeneratorFramework.MethodParameter(label: Optional("fetchDidFailed"), name: "failureClosure", type: "@escaping WypokBaseService.ServiceFailureClosure", range: CountableRange(646..<725), nameRange: CountableRange(646..<660))], "returnType": "Void", "isOptional": false, "stubFunction": "Cuckoo.ProtocolStubNoReturnFunction"]
     func getMirkoHots(for page: Int, and period: Int, and successClosure: @escaping ItemsFetchedClosure, fetchDidFailed failureClosure: @escaping WypokBaseService.ServiceFailureClosure)  {
        
            return cuckoo_manager.call("getMirkoHots(for: Int, and: Int, and: @escaping ItemsFetchedClosure, fetchDidFailed: @escaping WypokBaseService.ServiceFailureClosure)",
                parameters: (page, period, successClosure, failureClosure),
                superclassCall:
                    
                    Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                    )
        
    }
    
    // ["name": "getMirkoItemWithComments", "returnSignature": "", "fullyQualifiedName": "getMirkoItemWithComments(for: Int, and: @escaping ItemFetchedClosure, fetchDidFailed: @escaping WypokBaseService.ServiceFailureClosure)", "parameterSignature": "for id: Int, and successClosure: @escaping ItemFetchedClosure, fetchDidFailed failureClosure: @escaping WypokBaseService.ServiceFailureClosure", "parameterSignatureWithoutNames": "id: Int, successClosure: @escaping ItemFetchedClosure, failureClosure: @escaping WypokBaseService.ServiceFailureClosure", "inputTypes": "Int, ItemFetchedClosure, WypokBaseService.ServiceFailureClosure", "isThrowing": false, "isInit": false, "isOverriding": false, "hasClosureParams": false, "@type": "ProtocolMethod", "accessibility": "", "parameterNames": "id, successClosure, failureClosure", "call": "for: id, and: successClosure, fetchDidFailed: failureClosure", "parameters": [CuckooGeneratorFramework.MethodParameter(label: Optional("for"), name: "id", type: "Int", range: CountableRange(766..<777), nameRange: CountableRange(766..<769)), CuckooGeneratorFramework.MethodParameter(label: Optional("and"), name: "successClosure", type: "@escaping ItemFetchedClosure", range: CountableRange(779..<827), nameRange: CountableRange(779..<782)), CuckooGeneratorFramework.MethodParameter(label: Optional("fetchDidFailed"), name: "failureClosure", type: "@escaping WypokBaseService.ServiceFailureClosure", range: CountableRange(829..<908), nameRange: CountableRange(829..<843))], "returnType": "Void", "isOptional": false, "stubFunction": "Cuckoo.ProtocolStubNoReturnFunction"]
     func getMirkoItemWithComments(for id: Int, and successClosure: @escaping ItemFetchedClosure, fetchDidFailed failureClosure: @escaping WypokBaseService.ServiceFailureClosure)  {
        
            return cuckoo_manager.call("getMirkoItemWithComments(for: Int, and: @escaping ItemFetchedClosure, fetchDidFailed: @escaping WypokBaseService.ServiceFailureClosure)",
                parameters: (id, successClosure, failureClosure),
                superclassCall:
                    
                    Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                    )
        
    }
    

	struct __StubbingProxy_MirkoService: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	    init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	    func getMirkoRecents<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable, M3: Cuckoo.Matchable>(for page: M1, and successClosure: M2, fetchDidFailed failureClosure: M3) -> Cuckoo.ProtocolStubNoReturnFunction<(Int, ItemsFetchedClosure, WypokBaseService.ServiceFailureClosure)> where M1.MatchedType == Int, M2.MatchedType == ItemsFetchedClosure, M3.MatchedType == WypokBaseService.ServiceFailureClosure {
	        let matchers: [Cuckoo.ParameterMatcher<(Int, ItemsFetchedClosure, WypokBaseService.ServiceFailureClosure)>] = [wrap(matchable: page) { $0.0 }, wrap(matchable: successClosure) { $0.1 }, wrap(matchable: failureClosure) { $0.2 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockMirkoService.self, method: "getMirkoRecents(for: Int, and: @escaping ItemsFetchedClosure, fetchDidFailed: @escaping WypokBaseService.ServiceFailureClosure)", parameterMatchers: matchers))
	    }
	    
	    func getMirkoHots<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable, M3: Cuckoo.Matchable, M4: Cuckoo.Matchable>(for page: M1, and period: M2, and successClosure: M3, fetchDidFailed failureClosure: M4) -> Cuckoo.ProtocolStubNoReturnFunction<(Int, Int, ItemsFetchedClosure, WypokBaseService.ServiceFailureClosure)> where M1.MatchedType == Int, M2.MatchedType == Int, M3.MatchedType == ItemsFetchedClosure, M4.MatchedType == WypokBaseService.ServiceFailureClosure {
	        let matchers: [Cuckoo.ParameterMatcher<(Int, Int, ItemsFetchedClosure, WypokBaseService.ServiceFailureClosure)>] = [wrap(matchable: page) { $0.0 }, wrap(matchable: period) { $0.1 }, wrap(matchable: successClosure) { $0.2 }, wrap(matchable: failureClosure) { $0.3 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockMirkoService.self, method: "getMirkoHots(for: Int, and: Int, and: @escaping ItemsFetchedClosure, fetchDidFailed: @escaping WypokBaseService.ServiceFailureClosure)", parameterMatchers: matchers))
	    }
	    
	    func getMirkoItemWithComments<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable, M3: Cuckoo.Matchable>(for id: M1, and successClosure: M2, fetchDidFailed failureClosure: M3) -> Cuckoo.ProtocolStubNoReturnFunction<(Int, ItemFetchedClosure, WypokBaseService.ServiceFailureClosure)> where M1.MatchedType == Int, M2.MatchedType == ItemFetchedClosure, M3.MatchedType == WypokBaseService.ServiceFailureClosure {
	        let matchers: [Cuckoo.ParameterMatcher<(Int, ItemFetchedClosure, WypokBaseService.ServiceFailureClosure)>] = [wrap(matchable: id) { $0.0 }, wrap(matchable: successClosure) { $0.1 }, wrap(matchable: failureClosure) { $0.2 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockMirkoService.self, method: "getMirkoItemWithComments(for: Int, and: @escaping ItemFetchedClosure, fetchDidFailed: @escaping WypokBaseService.ServiceFailureClosure)", parameterMatchers: matchers))
	    }
	    
	}

	struct __VerificationProxy_MirkoService: Cuckoo.VerificationProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	    private let callMatcher: Cuckoo.CallMatcher
	    private let sourceLocation: Cuckoo.SourceLocation
	
	    init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
	        self.cuckoo_manager = manager
	        self.callMatcher = callMatcher
	        self.sourceLocation = sourceLocation
	    }
	
	    
	
	    
	    @discardableResult
	    func getMirkoRecents<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable, M3: Cuckoo.Matchable>(for page: M1, and successClosure: M2, fetchDidFailed failureClosure: M3) -> Cuckoo.__DoNotUse<Void> where M1.MatchedType == Int, M2.MatchedType == ItemsFetchedClosure, M3.MatchedType == WypokBaseService.ServiceFailureClosure {
	        let matchers: [Cuckoo.ParameterMatcher<(Int, ItemsFetchedClosure, WypokBaseService.ServiceFailureClosure)>] = [wrap(matchable: page) { $0.0 }, wrap(matchable: successClosure) { $0.1 }, wrap(matchable: failureClosure) { $0.2 }]
	        return cuckoo_manager.verify("getMirkoRecents(for: Int, and: @escaping ItemsFetchedClosure, fetchDidFailed: @escaping WypokBaseService.ServiceFailureClosure)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func getMirkoHots<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable, M3: Cuckoo.Matchable, M4: Cuckoo.Matchable>(for page: M1, and period: M2, and successClosure: M3, fetchDidFailed failureClosure: M4) -> Cuckoo.__DoNotUse<Void> where M1.MatchedType == Int, M2.MatchedType == Int, M3.MatchedType == ItemsFetchedClosure, M4.MatchedType == WypokBaseService.ServiceFailureClosure {
	        let matchers: [Cuckoo.ParameterMatcher<(Int, Int, ItemsFetchedClosure, WypokBaseService.ServiceFailureClosure)>] = [wrap(matchable: page) { $0.0 }, wrap(matchable: period) { $0.1 }, wrap(matchable: successClosure) { $0.2 }, wrap(matchable: failureClosure) { $0.3 }]
	        return cuckoo_manager.verify("getMirkoHots(for: Int, and: Int, and: @escaping ItemsFetchedClosure, fetchDidFailed: @escaping WypokBaseService.ServiceFailureClosure)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func getMirkoItemWithComments<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable, M3: Cuckoo.Matchable>(for id: M1, and successClosure: M2, fetchDidFailed failureClosure: M3) -> Cuckoo.__DoNotUse<Void> where M1.MatchedType == Int, M2.MatchedType == ItemFetchedClosure, M3.MatchedType == WypokBaseService.ServiceFailureClosure {
	        let matchers: [Cuckoo.ParameterMatcher<(Int, ItemFetchedClosure, WypokBaseService.ServiceFailureClosure)>] = [wrap(matchable: id) { $0.0 }, wrap(matchable: successClosure) { $0.1 }, wrap(matchable: failureClosure) { $0.2 }]
	        return cuckoo_manager.verify("getMirkoItemWithComments(for: Int, and: @escaping ItemFetchedClosure, fetchDidFailed: @escaping WypokBaseService.ServiceFailureClosure)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	}

}

 class MirkoServiceStub: MirkoService {
    

    

    
     func getMirkoRecents(for page: Int, and successClosure: @escaping ItemsFetchedClosure, fetchDidFailed failureClosure: @escaping WypokBaseService.ServiceFailureClosure)  {
        return DefaultValueRegistry.defaultValue(for: Void.self)
    }
    
     func getMirkoHots(for page: Int, and period: Int, and successClosure: @escaping ItemsFetchedClosure, fetchDidFailed failureClosure: @escaping WypokBaseService.ServiceFailureClosure)  {
        return DefaultValueRegistry.defaultValue(for: Void.self)
    }
    
     func getMirkoItemWithComments(for id: Int, and successClosure: @escaping ItemFetchedClosure, fetchDidFailed failureClosure: @escaping WypokBaseService.ServiceFailureClosure)  {
        return DefaultValueRegistry.defaultValue(for: Void.self)
    }
    
}

