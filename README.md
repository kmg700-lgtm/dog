# 🐶 PawMatch AI - 인공지능 반려견 품종 분류기

Google Teachable Machine 이미지 분류 모델을 연동하여, 업로드한 사진 또는 실시간 웹캠 화면을 통해 **10대 반려견 품종**을 정밀 판별하고 상세한 견종 정보와 확률 그래프를 제공하는 반응형 웹 애플리케이션입니다.

---

## 🌟 주요 기능 및 특징

1. **소프트 파스텔 톤 웜 & 모던 UI/UX 디자인**:
   - 강아지 테마에 맞춘 부드러운 웜 옐로우/카라멜 브라운/크림 톤의 컬러 팔레트
   - Tailwind CSS 기반 반응형 레이아웃 (모바일, 태블릿, 데스크톱 완벽 지원)
   - 부드러운 호버 애니메이션, 스켈레톤/스캐너 효과 및 축하 컨페티(Confetti) 연출

2. **2가지 입력 모드 지원**:
   - **📁 파일 드래그 앤 드롭 & 업로드**: 이미지 파일을 드롭존에 끌어다 놓거나 클릭하여 즉시 판별
   - **⚡ 원클릭 샘플 테스트**: 골든 리트리버, 푸들, 비숑 프리제, 말티즈, 불독 등의 고화질 사진을 원클릭으로 바로 테스트
   - **📹 실시간 웹캠 비디오 모드**: 웹캠을 켜면 화면 속 반려견을 프레임 단위(약 120ms 간격)로 실시간 연속 추론 (일시정지, 좌우 반전 지원)

3. **인공지능 모델 동적 연동**:
   - Google Teachable Machine 전용 모델 URL 기본 탑재 (`https://teachablemachine.withgoogle.com/models/DqNbyXGwg/`)
   - 상단 **[모델 설정]** 창을 통해 사용자가 다른 Teachable Machine 이미지 모델 URL로 손쉽게 교체 가능
   - URL 끝부분 슬래시(`/`)나 `model.json` 중복 입력 시 자동 정규화 처리

4. **풍부한 결과 인포그래픽 및 10대 품종 도감**:
   - **1순위 결과 카드**: 가장 높은 확률의 견종명(한/영), 일치율(%), 견종 캐치프레이즈, 핵심 성격 해시태그, 체급/활동량/털빠짐 스탯 카드
   - **확률 프로그레스 바**: 모델의 10개 전체 클래스 예측치를 확률 순으로 시각화한 막대 그래프
   - **10대 견종 백과 도감**: 우측 상단 버튼을 클릭하면 모델이 판별하는 10개 품종의 특성과 사육 팁을 한눈에 열람 가능

---

## 📋 모델에 탑재된 10대 견종 라벨 매핑

`metadata.json` 기준 10개 클래스가 한국어 및 상세 특성 데이터와 완벽 매핑되어 있습니다.

| 인덱스 | 모델 클래스 라벨 (Raw Label) | 한국어 견종명 | 영어 견종명 | 핵심 특징 |
| :---: | :--- | :--- | :--- | :--- |
| 1 | `retriever` | **골든 리트리버** | Golden Retriever | 친화력 갑 인절미 천사견, 안내견 활약 |
| 2 | `poodle` | **푸들** | Poodle | 지능 2위, 털 빠짐이 거의 없는 다재다능견 |
| 3 | `bichon` | **비숑 프리제** | Bichon Frise | 솜사탕 하이바 미용, 명랑하고 애교 넘침 |
| 4 | `maltese` | **말티즈** | Maltese | 새하얀 털과 맑은 눈망울의 국민 반려견 |
| 5 | `jindo` | **진돗개** | Jindo Dog | 천연기념물 53호, 충성심과 용맹함의 상징 |
| 6 | `buldog` | **불독** | Bulldog | 주름진 얼굴 속 숨겨진 순둥이 반전 매력 |
| 7 | `bordercoli` | **보더콜리** | Border Collie | 지능 1위 천재견, 폭발적인 활동량과 민첩성 |
| 8 | `schnauzer` | **슈나우저** | Schnauzer | 멋진 턱수염과 눈썹, 충직하고 튼튼한 체력 |
| 9 | `sitzu` | **시츄** | Shih Tzu | 온순하고 짖음 적은 평화주의자 힐링견 |
| 10 | `yorkshire` | **요크셔 테리어** | Yorkshire Terrier | 비단결 코트와 당찬 성격의 움직이는 보석 |

---

## 🚀 빠른 실행 방법

### 방법 1. 원클릭 실행 (Windows)
프로젝트 폴더 내 `run.bat` 파일을 더블클릭하면 로컬 서버가 자동으로 구동되고 브라우저가 열립니다.

### 방법 2. Python 로컬 웹서버 실행 (권장)
> **웹캠 사용 시 주의사항**: 브라우저 보안 정책상 카메라 기능(`getUserMedia`)은 `file://` 경로보다 `http://localhost` 환경에서 가장 원활하게 동작합니다.

```bash
# 프로젝트 디렉터리로 이동
cd C:\Users\User\.gemini\antigravity\scratch\dog-breed-classifier

# Python 내장 웹서버 실행
python -m http.server 8080
```
실행 후 웹 브라우저에서 [http://localhost:8080](http://localhost:8080) 으로 접속합니다.

### 방법 3. Node.js npx serve 실행
```bash
npx serve -l 8080
```

### 방법 4. 브라우저에서 바로 열기
`index.html` 파일을 더블 클릭하여 웹 브라우저(Chrome, Edge 등)로 바로 열어도 이미지 파일 업로드 분석 기능은 즉시 정상 동작합니다.

---

## 🛠️ 기술 스택

- **Markup & Layout**: HTML5, Responsive Flex/Grid Layout
- **Styling**: Tailwind CSS (JIT CDN), Google Pretendard & Plus Jakarta Sans Font
- **Icons**: Font Awesome 6
- **Machine Learning**: TensorFlow.js (`@tensorflow/tfjs@1.3.1`), Teachable Machine Image Library (`@teachablemachine/image@0.8`)
- **Interactions**: HTML5 Canvas, MediaDevices WebRTC API, Canvas Confetti
