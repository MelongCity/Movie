//
//  MoologMockNetworkTests.swift
//  MoologTests
//
//  Created by Jisoo Ham on 10/14/24.
//

import XCTest
@testable
import Moolog
import RxSwift
import RxCocoa


final class MoologMockNetworkTests: XCTestCase {

    var disposeBag = DisposeBag()
    var sut: NetworkType!
    override func setUpWithError() throws {
        print("Setup func 실행 🟢 ")
        sut = MockNetworkManager()
        disposeBag = DisposeBag()
    }

    override func tearDownWithError() throws {
        print("tearDown func 실행 🟢 ")
        sut = nil
        disposeBag = DisposeBag()
    }

    func test_TrendMovie_MockNetwork_Success() throws {
        
        // MAKR: 파라미터 X
//        sut.callRequest(router: .trendingMovie, type: TrendingMovieResponse.self)
//            .subscribe { result in
//                switch result {
//                case .success(let response):
//                    print(response)
//                    XCTAssertTrue(!response.results.isEmpty, "응답값 존재")
//                case .failure(let error):
//                    print(error)
//                }
//            }
//            .disposed(by: disposeBag)
        
        let text = "하이"
        let page = 1
        
        // MAKR: 파라미터 O
        sut.callRequest(
            router: .searchMovie(target: text, page: page),
            type: SearchResponse.self
        )
        .subscribe { result in
            switch result {
            case .success(let response):
                print(response)
                XCTAssertTrue(!response.results.isEmpty, "응답값 존재")
            case .failure(let error):
                print(error)
            }
        }
        .disposed(by: disposeBag)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
