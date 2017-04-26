### 20170324
## Segue, Size Class, PCH


### Segue

- Segue   
앱의 인터페이스 흐름을 정의하는 데에 쓰임
앱의 스토리보드 파일의 두개의 뷰 컨트롤러 사이의 전환을 정의함
시작점은 버튼, 테이블뷰의 로우, 제스처 등으로 시작하며 끝점은 진행될 다음 뷰컨트롤러임
일반적으로 다음 뷰컨트롤러로 진행되는 것을 가르키나 unwind segue는 뷰컨트롤러를 닫는 역할을 할 수 있음
segue도 object임

- present modally : 밑 —>위
- present as popover : 위 —>밑

- Modifying a Segue’s Behavior at Runtime
shouldPerformSegueWithIdentifier:sender:  
== 오버라이드 가능한 메소드임. 오버라이드를 하면 segue를 진행 시킬지 말지를 결정할 수 있음.   
prepareForSegue:sender:  
==역시 오버라이드 가능함

- Unwind Segue  
되돌아갈 뷰컨트롤러를 선택  
선택된 뷰컨트롤러에 다음 메소드를 정의함.   
- (IBAction)myUnwindAction:(UIStoryboardSegue*)unwindSegue.       
>해당 메소드는 이름 변경 가능함    
>되돌아갈 “목적지”가 있어야 함.   
>스토리보드에서 Drag로 설정하기 전에 메소드를 먼저 만들어야 Drag로 설정 가능.   
>Unwind Segue 액션이 필요한 뷰컨트롤러에 액션과 Exit를 Drag로 연결한다

- Manual Segue.   
[self performSegueWithIdentifier:@“SegueName” sender:self];
—개발자가 직접 작성 및 실행해야 함
—오버라이드 불가함
—코드로서 Segue를 실행하겠다고 하고, 해당 코드를 직접 작성하는 것임

### SizeClass

- Size Class

인터페이스 빌더는 기본적으로 사이즈 클래스를 사용함
설정 가능한 내용.   
Install or Uninstall a view or control.   
install or Uninstall a constraint

- 한 애플리케이션을 가지고 오토레이아웃 프레임을 자유롭게, 안 흐트러지게 나눌 수 있음
—->현업에선 가로,세로 타입에 따라 아이폰, 아이패드, 아이폰 플러스로 나눠서 관리함
set the value of select attribute (ex.font, layout margin setting)
디자인의 최종 시안이 나왔을때 진행하는 것이 낫다

- 기기별 사이즈 클래스
아이패드 가로모드, 아이패드 세로모드 — 가로 레귤러, 세로 레귤러.   
아이폰 세로모드 —가로 콤펙트,, 세로 레귤러.   
아이폰 6플러스 가로모드 — 가로 레귤러 세로 콤펙트.   
아이폰 가로모드(아이폰 6플러스 제외) — 가로 콤펙트, 세로 콤펙트

### PCH

- 프로젝트 세팅.   
Precompiled Header    
>컴파일전 자주 사용하는 헤더파일을 미리 컴파일해 캐쉬에 저장    
>전역적으로 사용하고자 하는 데이터를 헤더 파일 선언하고 Prefix.pch에 넣어 전역적으로 사용 가능함.   
>New — File — Other — PCH File     
>PCH파일 세팅 시 Prefix Header 에는 “파일경로” 를 작성

