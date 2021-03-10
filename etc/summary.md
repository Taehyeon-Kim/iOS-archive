# etc

💿 따로 구분되어 있지 않은 것들을 모아놓은 저장소 입니다.

<br>

### 📗 목록

- 스토리보드 레퍼런스 (storyboard-reference)

<br>
<br>

---

## 스토리보드 레퍼런스 (storyboard-reference)

One Storyboard, One ViewController 방식으로 개발하기

<br>

### 🧐 왜 사용할까?

```
스토리보드를 이용해서 프로젝트를 진행한다고 가정해보면,

✓ 프로젝트 규모가 커지고, 협업하는 인원이 증가함에 따라서 스토리보드에서의 충돌이 많이 발생합니다.

✓ 한 스토리보드에 여러 개의 뷰 컨트롤러를 추가하게 되면 점점 무거워지고 스토리보드의 실행이 느려지게 됩니다.
```

<br>

### 🤔 어떻게 사용할까?

```
01. 스토리보드 생성
- .storyboard 파일을 생성한다. (ex. FirstStoryboard.storyboard)
- 스토리보드(.storyboard) 파일을 처음 생성하면 아무것도 없기 때문에 빈 ViewController를 추가한다.

02. 클래스 파일 생성
- ViewController에 연결해 줄 클래스 파일을 생성한다.
- (ex. FristViewController.swift)

03. 스토리보드와 클래스 파일 연결
- 위에서 만든 파일들을 연결한다.

04. 스토리보드 ID 설정
- Inspector에 Storyboard ID를 적는다.
- 일반적으로, 클래스 파일의 이름과 동일하게 적는다.
- (ex. FristViewController.swift)

05. 스토리보드 레퍼런스 (storyboard reference) 생성
- CMD + Shift + L 누르고 storyboard reference 검색한다.

06. 스토리보드 레퍼런스 값 설정
- 아래 2가지의 값을 설정한다.
- Storyboard (ex. FirstStoryboard)
- Referenced ID (ex. FirstViewController)

07. Segue 이용해서 스토리보드 - 스토리보드 레퍼런스 연결
- Ctrl + drag
- 코드로 연결
- ...
```

<br>

### 🖥 실행화면

✓ 스토리보드를 이용해서 탭 바 뷰 컨트롤러 생성 및 하위 뷰 컨트롤러 연결

<img src = "https://user-images.githubusercontent.com/61109660/110595046-e45df980-81c0-11eb-9be0-479241532ae8.gif" width = "250px">

<br>

### 🔖 레퍼런스

- [스토리보드 레퍼런스(Storyboard Reference)
  사용방법](https://swieeft.github.io/2020/02/24/StoryboardReference.html)

- [[iOS/Swift] Storyboard Reference 를 사용해 TabBar 구현하기](https://silver-g-0114.tistory.com/36?category=1094592)
