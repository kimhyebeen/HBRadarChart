# HBRadarChart

[![CI Status](https://img.shields.io/travis/kimhyebeen/HBRadarChart.svg?style=flat)](https://travis-ci.org/kimhyebeen/HBRadarChart)
[![Version](https://img.shields.io/cocoapods/v/HBRadarChart.svg?style=flat)](https://cocoapods.org/pods/HBRadarChart)
[![License](https://img.shields.io/cocoapods/l/HBRadarChart.svg?style=flat)](https://cocoapods.org/pods/HBRadarChart)
[![Platform](https://img.shields.io/cocoapods/p/HBRadarChart.svg?style=flat)](https://cocoapods.org/pods/HBRadarChart)

HBRadarChart provided polygonal shaped radar charts.

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

:iOS '13.0'

## Installation

HBRadarChart is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'HBRadarChart'
```

## Basics

I used the principle below. Since `HBPentagonChart` makes 5 pentagons layered, it was implemented in consideration of the difference in position and size of each pentagon in the following principle. Since the Y values of **Point 3** and **Point 2** are the same, and the Y values of **Point 4** and **Point 1** are the same, the positions of **Point 3** and **Point 4** can also be obtained by changing `midX + (something)` to `midX - (something)` in the x values.

 

(이미지 첨부 예정)

## Properties

 

## Author

kimhyebeen, kimhbin@naver.com

## License

HBRadarChart is available under the MIT license. See the [LICENSE file](./LICENSE) for more info.