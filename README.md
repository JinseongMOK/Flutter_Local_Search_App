# flutter_local_search_app

![Dart](https://img.shields.io/badge/dart-%230175C2.svg?style=for-the-badge&logo=dart&logoColor=white)![Flutter](https://img.shields.io/badge/Flutter-%2302569B.svg?style=for-the-badge&logo=Flutter&logoColor=white)

Flutter로 제작된 지역 검색 애플리케이션으로, MVVM 아키텍처를 기반으로 구현되었습니다. NAVER 검색 API, NAVER 지도 API, VWORLD API, Geolocator, Riverpod를 활용하여 개발되었습니다.

## 주요기능

1. 지역 검색

- 지역명을 입력하면 관련된 지역 정보를 리스트로 표시합니다.
- 각 결과는 다음 정보를 포함합니다:
  - 제목 (Title)
  - 카테고리 (Category)
  - 도로명 주소 (Road Address)
  - 링크 (Link)
  - 위도와 경도 (Lat,long)
  - 웹 링크 표시

결과에 유효한 링크가 있는 경우, 제목 위에 웹 아이콘이 표시됩니다.
아이콘을 클릭하면 WebView를 통해 링크가 열립니다. (필수 기능 2)

2. GPS 기반 검색

- GPS 아이콘을 클릭하면 기기의 현재 위치를 가져옵니다.
- 가져온 위치를 VWORLD API로 변환하여 행정구역 정보(읍면동)를 검색에 활용합니다. (도전 기능 1)

## 트러블슈팅

1. NAVER 지도 API 통합

- 문제: NAVER 검색 API에서 제공하는 mapx, mapy 필드가 일반적인 위도/경도와 다른 형식.
- 해결 방법:
  - mapx와 mapy를 변환해 위도와 경도로 활용 가능.
  - flutter_naver_map 문서를 참고해 지도에 올바르게 표시.
