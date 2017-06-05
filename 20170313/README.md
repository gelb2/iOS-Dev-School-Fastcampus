### 20170313

## THREAD

* 스레드는 프로세스 내에서 실행되는 흐름의 단위
* 일반적으로 한 프로그램은 하나의 스레드를 갖고 있음
* 둘 이상의 스레드를 동시에 실행하는 방식을 멀티스레드라고 함

### iOS Thread

* 모든 애플리케이션은 메인 스레드를 갖고 있음
* UIKit에 있는 모든 것들은 메인스레드에서만 돌아감
* 기본적인 UI및 모든 행동은 메인스레드에서 돌아감
* “만일 작업시간이 오래걸리는 작업을 메인스레드에서 실행하면 애플리케이션은 사용자가 무슨 터치, 스크롤을 하던 멈춰있을 것임”

### 싱글스레드
* 하나의 스레드를 가지며 순차적으로 실행됨

> 스레드1

> 행동1 —> 행동2 —> 행동3 —> 행동4

### 멀티스레드
* 다중 스레드를 가지며 병렬적으로 실행함

> 스레드1


> 행동1 —> 행동2 —> 행동3 —> 행동4

> 스레드2


> 행동5 —> 행동6 —> 행동7


> “이때 실행순서는 2,5,3,6 등으로 다양하게 될 수도 있다”

#### 사용하는 때
* 동시에 작업이 필요한 경우    
* 멀티 코어 프로세스를 사용하기 위해
* 중요한 작업에 방해 받지 않기 위해
* 상태를 계속 감시해야 할 경우가 필요할 때


#### 멀티스레드의 사용 예
* Network Request / Response
* Time Control
* Image Download / Upload
* Long Time Action

### 프로세스와 스레드
* “한 프로세스에서 시간이 지남에 따라 스레드1,스레드 2가 실행되는 경우, 스레드1이 잠시 끊어졌다가 스레드2가 진행되고, 스레드 2가 진행되고 나서 다시 스레드1이 진행되더라도 사용자의 입장에선 “동시에” 진행되는 것 처럼 보인다”

### 동기방식, 비동기방식

- Asynchronous…비동기방식은 두 메소드 실행 시 서로 아무런 상관관계가 없음, 순차적으로 처리되지 않음
- Synchronous…동기 방식은 두 메소드 실행 시 일정 상관관계가 있음, 순차적으로 처리됨 

> ex. A는 B와 동시에 실행, A는 B의 실행 후 10분 후에 실행

- 디자인패턴에 의한 비동기처리 : 델리게이트, 셀렉터, 블록, 노티피케이션
- 큐를 이용한 비동기처리 방법은 GCD로 가능함

> `dispatch_sync, dispatch_async`

### Deadlock(교착상태)
* 두 개 이상의 작업이 서로 상대방의 작업이 끝나기 만을 기다리고 있기 때문에 결과적으로 아무것도 완료되지 못하는 상태 == 결과적으로 프로세스가 멈춰버림

> 블럭은 비동기…값을 “캡쳐”해서 쓰므로 데드락에 빠지지 않음

## iOS와 멀티스레드

- NSThread : 직접 스레드를 만들어서 제어하는 방법…”스레드객체를 만들어서 스레드를 활용함
- GCD : 블록 기반의 기법으로 코드 가독성이 좋고 간편함…멀티코어 활용시 문제를 OS가 자동으로 해결
- NSOperation : GCD 기반의 rapper Class…간단하게 사용 가능, 고수준의 API제공, 성능이 느린편
- PerformSelector : 셀렉터 이용한 방식, ARC 이전에 주로 사용, GCD 이후엔 많이 쓰이지 않음...
- NSTimer : 간단한 인터벌 노티피케이션을 제공해주는 클래스…”MainLoop”에서 실행됨…다른 스레드를 만드는 것이 아닌 mainLoop에 스레드가 있어서 돌아감

### NSThread

* 메인스레드 외 다른 스레드를 만드는 클래스
* UI는 절대로 추가 스레드에서 실행하면 안됨 == UI는 메인스레드에서 돌아가야 함
* 셀렉터로 실행된 메소드가 종료된 후 자연스럽게 스레드도 종료됨
* cancel 명령으로 강제 종료 되지 않음, cancel은 프로퍼티로 생각해야 함

> “메소드가 끝나면 끝난다. 중간에 멈추기가 불가하다

### NSThread의 요소

		Initializing… 
		- initWithTarget:selector:object:
		  Statting a Thread
		  +detachNewThreadSelector:toTatget:withObject:-start
		  Stopping a Threa
		  +sleepForTimeInterval:

		cancel
		Execution State
		@property executing
		@property finished
		@property cancelled

### GCD
* 비동기로 작업을 수행시키는 강력하고 쉬운 방법
* 멀티코어프로세서에서 최적화 되어서 작동됨
* dispatch queue를 이용해 작업들을 컨트롤함 —-> 개발자는 앱의 일감을 블록단위로 queue로 보냄…”queue와 블록을 적어서” 
* —-> GCD가 각 queue에 쌓인 일을 알아서 처리, 알아서 CPU로 보냄…GCD는 각 CPU의 코어가 놀지 않고 효율적으로 일하도록 코어에 일을 분배함
* block으로 구현됨

#### dispatch queue 
* GCD의 핵심으로 GCD로 실행한 작업들을 관리하는 큐
* 모든 디스패치 큐는 “First in First out” 데이터 구조
* serial dispatch queue와 concurrent dispatch queue 두 종류로 나눔
* 시리얼 디스패치 큐는 순차적으로 작업을 처리함
* 컨커런트 디스패치 큐는 병렬적으로 작업을 처리함

##### Main Dispatch Queue
* 메인스레드를 가르킴…기본 UI를 제어하는 큐임
* 해당 디스페치에 넣으면 메인스레드에서 돌아감
* 시리얼방식…들어온 순서대로 진행되며 앞에 작업이 종료될 때까지 뒤의 작업들은 대기함
`dispatch_queue_type global_queue = dispatch_get_main_queue();`

##### Global dispatch queue
* 앱 전역에 사용되는 큐…concurrent 방식의 큐임
* 총 4개의 큐로 이뤄져 있음…중요도에 따라 high, default, low, background queue중 선택되어 실행

		dispatch_queue_t global_queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);		
		//두 번째 인자는 사용하지 않는 예약인자로 무조건 0을 입력함

##### Private dispatch Queue
* 사용자 정의 큐임
* 사용자가 만든 큐는 serial방식과 concurrent 방식으로 만들 수 있음

		dispatch_queue_type concurrent_queue = 
		dispatch_queue_create(@“queue.name”, 
		DISPATCH_QUEUE_CONCURRENT);
		dispatch_queue_type serial_queue = dispatch_queue_create(@“queue.name”, DISPATCH_QUEUE_SERIAL);

  ​

  ## GCD 함수

- dispatch_async : 비동기로 작업을 추가 및 수행함

- dispatch_sync : 동기로 작업을 추가 및 수행함

- dispatch_after : 시간이 지난 후 작업을 추가함 + dispatch_time_t 으로 시간 객체를 생성해서 인자로 집어넣음

- dispatch_barrier_async : 작업을 구분함

- dispatch_once : 한 번만 실행할 수 있는 작업을 수행함

- dispatch_suspend : 큐에서 작업을 실행하지 옷하도록 정지시킴…object는 큐가 들어가는 자리

- dispatch_resume : 정지된 큐를 재개시킴…object는 큐가 들어가는 자리

## 블록과 self

“블록안에 self를 쓰려면… “__weak ~~ *self = self;” , “[~~self. ~~ settext:~~~]”
“레퍼런스 카운트의 관리를 위해서임”