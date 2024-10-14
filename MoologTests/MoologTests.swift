//
//  MoologTests.swift
//  MoologTests
//
//  Created by Jisoo Ham on 10/14/24.
//

import XCTest
@testable
import Moolog
import RxSwift
import RxCocoa

final class MoologTests: XCTestCase {
    var disposeBag = DisposeBag()
    var sut: NetworkType!

    override func setUpWithError() throws {
        print("Setup func 실행 🟢 ")
        sut = NetworkManager()
        disposeBag = DisposeBag()
    }

    override func tearDownWithError() throws {
        print("tearDown func 실행 🟢 ")
        sut = nil
        disposeBag = DisposeBag()
    }

    func test_Network_Async_Success() throws {
        // 1) expectation 2) fulfill 3) wait
        
        let promise = expectation(description: "RxSwift - Single Network Test")
        
        sut.callRequest(router: .trendingTV, type: TrendingTVResponse.self)
            .subscribe(with: self) { owner, result in
                switch result {
                case .success(let response):
                    print(response.results)
                    XCTAssertTrue(
                        !response.results.isEmpty,
                        "데이터 있음!"
                    )
                    promise.fulfill()
                case .failure(let error):
                    print(error)
                }
            }
            .disposed(by: disposeBag)
        
        wait(for: [promise], timeout: 10)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

}
