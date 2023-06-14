## 🖥️ 프로젝트 소개
- ERP 기반 인사관리 사이트
- <a href="https://github.com/sexyflowermins/green_erp/wiki/%EB%8D%B0%EC%9D%B4%ED%84%B0%EB%B2%A0%EC%9D%B4%EC%8A%A4" >데이터베이스 - WIKI 이동</a>
- <a href="https://github.com/sexyflowermins/green_erp/wiki/%ED%94%8C%EB%A1%9C%EC%9A%B0%EC%B0%A8%ED%8A%B8" >플로우차트 - WIKI 이동</a>
<br>

## 🕰️ 개발 기간
* 23.04.21일 - 23.05.02일

## 🧑‍🤝‍🧑 멤버구성 (4명)
 - 팀원1 : 김민우 - 로그인, 로그아웃, 마이페이지(수정, 출퇴근 기능), ERD 제작, 
                   데이터 베이스 설계, 연봉 성과급 알고리즘, 날씨 API활용 기능 구현
 - 팀원2 : 김경은 - 공지사항(CRUD), 자유 게시판(CRUD),게시판 페이징 처리, animate.css 구현, 메인 페이지(부트스트랩5 css 처리),인터셉터 처리 
 - 팀원3 : 정다운 - 사원등록, 사원 관리 페이지(CRUD 부트스트랩5 활용), 페이지 레이아웃 구성, 이미지 업로드 기능 구현(수정) 
 - 팀원4 : 이지운 - 일정관리(CRUD), 캘린더 구현(ajax통신/javascript/jquery), 사원 정보 조회 기능, ppt 제작

### ⚙️ 개발 환경
- `Java 11`
- `JDK 11.0.17`
- **IDE** : sts 4.18(Spring Tool Suite 4)
- **Database** : Mysql
- **Framework** : bootstrap@5.0.2, Spring Boot '2.7.11', animate.css '4.1.1'

## 📌 주요 기능
#### 로그인 - <a href="https://github.com/sexyflowermins/green_erp/wiki/%EB%A1%9C%EA%B7%B8%EC%9D%B8" >상세보기 - WIKI 이동</a>
- DB값 검증(인증처리)
- 로그인 시 쿠키(Cookie) 및 세션(Session) 생성
- 등록 개인 입사사진 가져오기

#### 네비게이션 바 - <a href="https://github.com/sexyflowermins/green_erp/wiki/%EB%84%A4%EB%B9%84%EA%B2%8C%EC%9D%B4%EC%85%98-%EB%B0%94" >상세보기 - WIKI 이동</a>
- 로그아웃 기능
- 최근 공지사항 기능

#### 메인 페이지 - <a href="https://github.com/sexyflowermins/green_erp/wiki/%EB%A9%94%EC%9D%B8-%ED%8E%98%EC%9D%B4%EC%A7%80" >상세보기 - WIKI 이동</a>
- 미니 캘린더
- 최근 공지사항 캐러셀
- 전체 게시글 카테고리 차트
- 자유 게시판 
- 날씨 API 데이터 표
- 애니메이션 효과 적용

#### 마이 페이지 - <a href="https://github.com/sexyflowermins/green_erp/wiki/%EB%A7%88%EC%9D%B4%ED%8E%98%EC%9D%B4%EC%A7%80" >상세보기 - WIKI 이동</a>
- 출퇴근 기능 구현
- 개인 정보 및 연봉 조회 
- 개인정보 수정 기능
- 연도별 호봉에 따른 연봉 조회 기능

#### 일정 관리 페이지 - <a href="https://github.com/sexyflowermins/green_erp/wiki/%EC%9D%BC%EC%A0%95%EA%B4%80%EB%A6%AC" >상세보기 - WIKI 이동</a>
- fullcalendar
- 일정 CRUD 기능
- 캘린더 일정 표시
- 일정 상세 페이지

#### 공지사항 페이지 - <a href="https://github.com/sexyflowermins/green_erp/wiki/%EA%B3%B5%EC%A7%80%EC%82%AC%ED%95%AD" >상세보기 - WIKI 이동</a>
- 공지사항 CRUD 기능
- 모달 창 활용 Read 기능

#### 자유 게시판 페이지 - <a href="https://github.com/sexyflowermins/green_erp/wiki/%EC%9E%90%EC%9C%A0-%EA%B2%8C%EC%8B%9C%ED%8C%90" >상세보기 - WIKI 이동</a>
- 게시판 CRUD 기능
- 게시판 페이징 처리
- 게시글 보기 개수 설정

#### 사원 등록 페이지 - <a href="https://github.com/sexyflowermins/green_erp/wiki/%EC%82%AC%EC%9B%90-%EB%93%B1%EB%A1%9D" >상세보기 - WIKI 이동</a>
- 사번 중복 체크
- 입사 사진 등록 
- 사원 등록 기능 

#### 사원 관리 페이지 - <a href="https://github.com/sexyflowermins/green_erp/wiki/%EC%82%AC%EC%9B%90-%EA%B4%80%EB%A6%AC" >상세보기 - WIKI 이동</a>
- 부서 별 사원 목록 조회
- 사원 정보 수정,삭제
- 모달 창 활용 UPDATE 기능
- 사원 정보 차트
