//
//  PrefetchingService.swift
//  wypok
//
//  Created by Przemyslaw Jablonski on 27/08/2018.
//  Copyright © 2018 Przemyslaw Jablonski. All rights reserved.
//

import SDWebImage

class PrefetchingService {
    
    private let prefetchingManager: SDWebImagePrefetcher
    
    init(prefetchingManager: SDWebImagePrefetcher) {
        self.prefetchingManager = prefetchingManager
    }
    
    func prefetch(from imagesUrls: [String], and successClosure: @escaping CommonSuccessClosure, prefetchDidFailed failureClosure: @escaping CommonFailureClosure) {
//        let imagePrefetcher = SDWebImagePrefetcher.shared()
        prefetchingManager.prefetchURLs(
            imagesUrls.map { imageUrl -> URL in URL(string: imageUrl)! },
            progress: nil,
            completed: { (successfulPrefetchesCount, failedPrefetchesCount) in
                successClosure()
        })
    }
    
}
