## 설치 및 실행 방법

1. 패키지 설치
    ```bash
    flutter pub get
    ```

2. 네이버 개발자 센터에서 Client ID와 Client Secret 발급  
    - [네이버 개발자 센터](https://developers.naver.com/main/) 접속  
    - 애플리케이션 등록 및 API 키 발급

3. 키 등록  
   `lib/repositories/location_repository.dart` 파일에 발급받은 키를 입력

4. 앱 실행
    ```bash
    flutter run
    ```


![메인 화면](screenshots/main.png)  
![검색 결과](screenshots/search.png)  
![상세 페이지](screenshots/detail.png)
