//
// NetworkTestCase
// Legacy
//
// Copyright (c) 2018 Eugene Egorov.
// License: MIT, https://github.com/eugeneego/legacy/blob/master/LICENSE
//

import Foundation
import XCTest
@testable import Legacy

class NetworkTestCase: XCTestCase {
    enum Constants {
        static let host = "https://jsonplaceholder.typicode.com"
        static let posts = "posts"
        static let users = "users"

        static let post = Post(userId: 1, id: 1, title: "Title", body: "Body")
    }

    let rest: BaseRestClient = {
        guard let baseUrl = URL(string: Constants.host) else { fatalError("Invalid base url") }

        let configuration = URLSessionConfiguration.default
        configuration.urlCache = nil
        configuration.requestCachePolicy = .reloadIgnoringLocalAndRemoteCacheData
        let queue = DispatchQueue.global(qos: .default)
        let http = UrlSessionHttp(configuration: configuration, responseQueue: queue, logger: nil)
        let rest = BaseRestClient(http: http, baseURL: baseUrl, workQueue: queue, completionQueue: DispatchQueue.main)
        return rest
    }()
}
