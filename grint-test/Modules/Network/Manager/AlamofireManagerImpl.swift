//
//  AlamofireManagerImpl.swift
//  grint-test
//
//  Created by Neptali Duque on 6/18/25.
//

import Alamofire

final class AlamofireManagerImpl: NetworkManager {
    private var successfulStatusCodes = 200 ..< 300
    private var baseURL: String {
        NetworkConstants.baseUrl
    }

    private let session: Session

    init(session: Session) {
        self.session = session
    }

    func requestNoParams<R: Decodable>(
        path: String,
        method: HTTPMethod,
        queryParameters: [String: String]
    ) async -> Result<R, Error> {
        let endpoint = createUrlWithQueryItems(endpoint: baseURL + path, queryParams: queryParameters)
        return await withCheckedContinuation { continuation in
            session.request(
                endpoint,
                method: method.alamofireHttpMethod
            )
            .validate(statusCode: successfulStatusCodes)
            .responseDecodable(of: NetworkPayload<R>.self) { response in
                switch response.result {
                case let .success(payload):
                    continuation.resume(returning: .success(payload.data))
                case let .failure(error):
                    continuation.resume(returning: .failure(error))
                }
            }
        }
    }
}

private extension AlamofireManagerImpl {
    func createUrlWithQueryItems(endpoint: String, queryParams: [String: String]) -> String {
        guard !queryParams.isEmpty else {
            return endpoint
        }

        let queries = queryParams.map { URLQueryItem(name: $0.key, value: $0.value) }
        var components = URLComponents(string: endpoint)
        components?.queryItems = queries
        return components?.url?.absoluteString ?? ""
    }
}
