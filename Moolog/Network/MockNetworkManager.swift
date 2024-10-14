//
//  MockNetworkManager.swift
//  Moolog
//
//  Created by Jisoo Ham on 10/14/24.
//

import Foundation

import RxSwift
import RxCocoa

final class MockNetworkManager: NetworkType {
    func callRequest<T: Decodable>(
        router: Router,
        type: T.Type
    ) -> Single<Result<T, NetworkError>> {
        return Single.create { single in
            
            
            let fileName: String
             
            switch router {
            case .trendingMovie:
                fileName = "TrendingMovieMockData"
            case .trendingTV:
                fileName = "TrendingTVMockData"
            case .searchMovie(_, _):
                fileName = "SearchMovieMockData"
            case .similarMovie(_):
                fileName = "SimilarMovieMockData"
            default:
                fileName = ""
            }
            
            guard let file = Bundle.main.url(
                forResource: fileName,
                withExtension: "json"
            ) else {
                single(.success(.failure(.invalidResponse)))
                return Disposables.create()
            }
            
            do {
                let jsonData = try Data(contentsOf: file)
                let decodedData = try JSONDecoder().decode(
                    T.self,
                    from: jsonData
                )
                single(.success(.success(decodedData)))
            } catch {
                single(.success(.failure(.decodingError)))
            }
            
            return Disposables.create()
        }
    }
}
