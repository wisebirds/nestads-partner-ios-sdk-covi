# NestAdsPartnerCovi

파트너사가 Wisebirds NestAds 및 Covi 인벤토리를 iOS 앱에 통합할 수 있도록 지원하는
**Covi 파트너 어댑터 SDK** 입니다.

## 현재 릴리스

| 구성요소 | 버전 |
|---|---|
| NestAdsPartnerCovi | `1.0.0` |
| NestAdsPartnerCore (전이 의존) | `1.0.0` 이상 |
| COVI 환경 | `CoviPartnerAdapter.environment` 지정값 → 메인 SDK 환경 → `prod` 순 (아래 "환경 설정") |

## 설치 (Swift Package Manager)

Xcode → `File` → `Add Package Dependencies…` 에서 아래 URL 입력:

```
https://github.com/wisebirds/nestads-partner-ios-sdk-covi
```

또는 `Package.swift` 직접 명시:

```swift
dependencies: [
    .package(
        url: "https://github.com/wisebirds/nestads-partner-ios-sdk-covi",
        from: "1.0.0"
    )
]
```

`NestAdsPartnerCore` 는 이 패키지의 전이 의존성으로 자동 포함되므로 직접 추가할 필요가
없습니다.

> **기존 `nestads-partner-ios-sdk`(통합 패키지)를 쓰고 있었다면 그 의존성을 먼저 제거하세요.**
> 통합 패키지에도 같은 진입점 클래스(`NestAdsPartnerAutoHandler`)가 들어 있어, 파트너별 어댑터와
> 나란히 두면 한 프로세스에 같은 ObjC 클래스가 두 벌 등록되고 어느 쪽이 쓰일지가 로드 순서에
> 따라 달라집니다.

### 메인 NestAdsSDK 추가 (필수)

이 어댑터를 포함해 파트너 SDK 전체가 메인 NestAdsSDK 와 **런타임 브리지 방식**으로
연동됩니다(컴파일 의존 없음). 이 어댑터를 추가해도 메인 SDK 가 전이 의존으로 따라오지
않으므로 **메인 NestAdsSDK(2.16.0 이상)를 직접 추가**해야 합니다. 메인 SDK 가 없거나
브리지 미지원 버전이면 파트너 광고는 조용히 비활성되며 콘솔에 경고가 출력됩니다.

브리지 계약에 대한 자세한 내용은 [NestAdsPartnerCore README](https://github.com/wisebirds/nestads-partner-ios-sdk-core)
도 참고하세요.

## 환경 설정 (선택)

Covi 는 dev/prod 백엔드를 구분합니다. 기본값은 **prod** 이며, 아무 설정도 하지 않으면
운영 환경으로 동작합니다. 개발·QA 빌드에서 Covi dev 소재를 보려면 앱 시작 시 한 번
지정하십시오.

```swift
import NestAdsPartnerCovi

// AppDelegate.application(_:didFinishLaunchingWithOptions:) 또는 App.init()
#if DEBUG
CoviPartnerAdapter.environment = .dev
#endif
```

- 지정하지 않으면(`nil`, 기본) 메인 SDK 의 환경 설정을 따르고, 그것도 없으면 `prod` 입니다.
- 지정한 값은 메인 SDK 의 환경 설정보다 **우선**합니다 — 앱 전체는 dev 이면서 Covi 만 prod 로
  두는 것도 가능합니다.
- 광고를 로드할 때마다 읽으므로, 값을 바꾼 뒤 다시 로드하면 그때부터 적용됩니다.
- 이 설정이 필요 없으면 `import NestAdsPartnerCovi` 자체가 불필요합니다. 어댑터는 런타임에
  발견되므로 패키지만 추가하면 동작합니다.

## 요구 사항

- iOS 15.0+
- Swift 5.9+
- Xcode 15.0+

## 번들 의존성

| Framework | Source |
|---|---|
| COVI-iOS-SDK | GitHub `covigroup/COVI-iOS-SDK` |

## 문의 및 지원

- Wisebirds SDK팀

## 라이선스

Copyright © Wisebirds. All rights reserved.
