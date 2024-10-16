# Moolog
유행하는 TV 프로그램 및 영화를 확인하고 영화를 검색할 수 있는 앱

## 개발 환경
```
- 개발 인원 : 3명
- 개발 기간 : 2024.10.09 ~ 2024.10.13 (약 일주일)
- Swift 5.10
- Xcode 15.4
- iOS 15.0+
- 세로모드 지원
```
## 기술 스택

<a href="https://swift.org/package-manager/"><img src="https://img.shields.io/badge/6.8.0-RxSwift-E30C8D.svg?style=flat"></a>
<a href="https://swift.org/package-manager/"><img src="https://img.shields.io/badge/5.0.2-RxDataSources-9D268D.svg?style=flat"></a>
<a href="https://swift.org/package-manager/"><img src="https://img.shields.io/badge/8.0.3-Kingfisher-FF612E.svg?style=flat"></a>

<a href="https://swift.org/package-manager/"><img src="https://img.shields.io/badge/10.54.0-Realm-59569E.svg?style=flat"></a>
<a href="https://swift.org/package-manager/"><img src="https://img.shields.io/badge/5.7.1-Snapkit-1C8DFC.svg?style=flat"></a>
<a href="https://swift.org/package-manager/"><img src="https://img.shields.io/badge/5.7.1-SwiftLint-F9D32E.svg?style=flat"></a>

## 핵심 기능

| 검색| 즐겨찾기 목록 & 즐겨찾기 삭제 | 미디어 추천 & 즐겨찾기 추가 |
| --- | --- | --- |
|<img  width=300 src="https://github.com/user-attachments/assets/a0f312a6-b9e0-4b32-a182-daee96cad5b8"/>|<img  width=300 src="https://github.com/user-attachments/assets/5cfb2c3b-3b39-4183-8923-2796d0b02347"/>|<img  width=300 src="https://github.com/user-attachments/assets/cb4c7fa0-4be0-4c97-9e05-a8bd269d6797"/>|

## 주요 기술
**1) FileManger**
* 네트워크 통신 여부와 관계없이 즐겨찾기 기능에서 이미지를 사용가능

**2) 네트워크-URLSession**

* Router pattern을 적용한 네트워크 추상화
* class간 결합도를 낮추기 위한 추상화된 Network Protocol채택

**3) Pagination**

*  prefetchItems로 IndexPath를 받아 collectionView에서의 offset기반 페이지네이션 처리




## 트러블슈팅
**1) ScrollView의 제약조건 설정 이슈**
- 상황
    - ScrollView의 하위 계층에 CollectionView를 추가했으나 CollectionView가 보이지 않는 문제가 발생했다.
- 원인
    - ScrollView는 하위 뷰들의 높이에 대한 제약조건이 설정되어야 하지만 CollectionView는 높이가 자동으로 계산되지 않는다.
- 해결
    - 셀의 개수를 20개로 제한을 한 상황이기 때문에 item size를 기반으로 전체 CollectionView의 높이를 설정하여 해결할 수 있었다.

**2) 버튼이 동작하지 않는 문제**
- 원인
    - 해당 버튼을 UIImageView의 하위 계층에 추가했다. UIImageView는 일반적인 Container View가 아니기 때문에 하위 계층에 다른 컴포넌트를 추가하면 원하는 동작이 안될 수 있다.
- 해결
    - 버튼의 계층을 UIImageView와 동일하게 두고, 제약조건을 조정하여 해결할 수 있었다.