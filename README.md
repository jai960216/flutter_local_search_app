markdown# 지역 검색 앱 (Flutter Local Search App)

네이버 검색 API를 활용한 지역 검색 Flutter 애플리케이션입니다. 사용자가 입력한 키워드를 기반으로 지역 정보를 검색하고 결과를 보여줍니다.

## 주요 기능

- 지역명 검색 기능
- 검색 결과 목록 표시 (장소명, 카테고리, 도로명 주소)
- 상세 정보 페이지 제공 (WebView)

## 사용 기술

- Flutter
- Dio (HTTP 통신)
- Flutter Riverpod (상태 관리)
- Flutter InAppWebView (웹 페이지 표시)
- 네이버 검색 API (지역 검색)

## 설치 및 실행 방법

1. 필요한 패키지 설치
```bash
flutter pub get

네이버 개발자 센터에서 Client ID와 Client Secret 발급

네이버 개발자 센터 접속
애플리케이션 등록 및 API 키 발급
lib/repositories/location_repository.dart 파일에 발급받은 키 입력


앱 실행

bashflutter run
프로젝트 구조
lib/
├── main.dart                      # 앱의 시작점
├── models/
│   └── location.dart              # Location 모델 클래스
├── repositories/
│   └── location_repository.dart   # API 연동 Repository
├── viewmodels/
│   └── location_view_model.dart   # Riverpod 상태 관리
└── pages/
    ├── home_page.dart             # 메인 검색 화면
    └── detail_page.dart           # 웹뷰 상세 페이지


## 📷 스크린샷

| 메인 화면 | 검색 결과 | 상세 페이지 |
|-----------|------------|-------------|
| ![main](screenshots/main.png) | ![search](screenshots/search.png) | ![detail](screenshots/detail.png) |
