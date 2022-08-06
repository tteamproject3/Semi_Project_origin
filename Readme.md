# # GITHUB 협업 메뉴얼

- 깃허브 이용시 메인에서 pull push하지 마시고, 브렌치를 만들어서 작업해주세요.
  - 원본 파일이 될 메인에서 직접 pull push 작업을 하실 경우 다른 분이 병합 하실 때 conflict 나 다른 오류가 발생하여 작업이 꼬일 수 있습니다.
- 잘모르겠다면 ->  [참고 링크](https://dewworld27.tistory.com/entry/github-%ED%98%91%EC%97%85-%EB%A9%94%EB%89%B4%EC%96%BC-git-clone%EB%B6%80%ED%84%B0-Pull-request%EA%B9%8C%EC%A7%80)

# FE 개발 시

## 1. 추천 사항

- 뷰 페이지 개발 시 이클립스/스프링보다는 기타 에디터를 사용하는 것을 추천드립니다.
   => 특히 vsCode에서 익스텐션이 편리한게 많아 강추합니다. 
   [참고 링크](https://parkjh7764.tistory.com/93) 확인하시고 익스텐션 깔아서 사용하시면 됩니다.
       - Live Server(실시간 웹페이지 확인가능)
           - Emmet(괄호없이 간단히 html 코드 작성 가능)
           위에 두 개는 특히 필수라고 생각합니다.

- [링크](https://xd.adobe.com/view/7be723b7-c502-4210-a1cc-f2a1d7bf0b54-2eb4/)에서 css 코드를 확인 가능
   - 색상, 요소 크기를 확인할 수 있지만 요소 위치 배치는 직접하셔야합니다.

## 2. 기본 규칙
- 주석을 작성해주세요
   - 주석은 협업의 기본입니다. 
   - 잘 정리된 주석이 있어야 다른 사람이 내 코드를 이해할 수 있고 시간이 지나도 내 코드를 알아볼 수 있습니다.
   - 코드 위에 주석을 달되 이 코드는 무슨 기능을 하는 코드인지 설명이 되는 정도로 작성해주세요.

- 아이디 선택자보다는 클래스 선택자를 사용해주세요
   - 이유: 스타일 지정 시 아이디 대신 클래스를 사용하기 - 스타일 지정을 위해서는 무조건 클래스를 사용한다.
   아이디를 사용한다면 재사용성 측면뿐 아니라 선택자 우선순위가 매우 높기 때문에 예측하지 못한 동작을 야기할 수 있다.
   만약 문서 내 링크 이동이나 for를 사용하는 특별한 경우에만 아이디를 사용한다. - [출처](https://ui.toast.com/fe-guide/ko_HTMLCSS)

- semantic tag를 적극 사용해주세요
   - header, footer 이 외에도 웹페이지의 큰 영역은 section 태그를 사용합니다.

- float를 이용한 정렬보다는 flexbox를 이용한 정렬을 해주세요
   - flexbox는 비교적 최근에 나온 CSS 기능 중 하나인데 요소 배치가 아주 편리해서 float보다는 flexbox를 이용한 요소 배치를 더 많이 이용합니다.
   - 어렵지도 않아서 금방 배우고 적용할 수 있습니다.
   - [mdn 공식 문서 ](https://developer.mozilla.org/ko/docs/Web/CSS/CSS_Flexible_Box_Layout/Basic_Concepts_of_Flexbox)
   - [flexbox 학습 게임](https://flexboxfroggy.com/#ko)

- 기본 웹페이지 규격
   - 현재 목업은 뷰포트 크기가 1920x1080 입니다. (메인 페이지 제외)
   - 콘텐츠가 직접 들어가는 영역은 가운데 정렬 **1200px** 사이입니다.
   - 기본 규격 + 헤더 푸터 같은 고정 영역 외의 요소 크기는 px 보다는 vw, vh, % 사용해서 지정하는 것을 권장합니다.
       - [단위 차이점](https://velog.io/@jhur98/CSS%EC%97%90%EC%84%9C-px-em-rem-vh-vw-%EB%8B%A8%EC%9C%84%EB%93%A4%EC%9D%98-%EC%B0%A8%EC%9D%B4%EC%A0%90)

## 그 외
- 현재 목업을 기반으로 개발하되 재량 것 요소 추가/수정/삭제 필요
  - 목업 제작 시에 고려못한 요소 있을 수 있습니다.  
  - 이런 부분은 기능 흐름을 생각해보시고 추가하거나 필요없는 요소는 빼주셔야합니다.
  
- 디자인을 최대한 따라가되 이것에 너무 제약을 받지는 말자. 

- 목업에 없는 서브 뷰 페이지를 제작해야 할 때가 있습니다. 
  - (글쓰기 창, 글 수정창 등등) 
  - 최대한 목업에 구현된 스타일과 비슷하게 하시면 될 것 같습니다. 
  - _연락 주시면 와이어 프레임 같이 구상해보겠습니다._
  
- 요소 변경 시에는 기록으로 남겨서 공유하거나 회의 때 말씀해주세요. 

  

# DB설계

- ERD CloudLink
  - [모델링 확인](https://www.erdcloud.com/d/aCtch3zYbTm4HdEvH)



# 파일 구조

