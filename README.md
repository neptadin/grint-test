# grint-test

This project is a Reddit client application developed as part of an iOS developer test for The Grint. It follows the **MVVM architectural pattern** with **Clean Architecture principles** and utilizes **Root Composition** for dependency injection.

## 📱 Requirements

- Latest iOS version
- Xcode 16.4 (Latest version at the time of doing the test)
- CocoaPods

## 🧱 Architecture

The app is structured using **MVVM with Clean Architecture**, focusing on separation of concerns and testability:

- **Presentation Layer**: ViewModels responsible for exposing UI-ready data and the UI developed using UIKit's storyboards and xibs.
- **Domain Layer**: Use cases defining business logic.
- **Data Layer**: Network calls and persistence logic.
- **Dependency Injection**: Managed via Root Composition.

## 📦 Libraries

The following libraries are integrated via CocoaPods as requested in the original requirements:

- [Alamofire](https://github.com/Alamofire/Alamofire) – for HTTP networking.
- [SDWebImage](https://github.com/SDWebImage/SDWebImage) – for asynchronous image loading and caching.

## 📰 Features

Each Reddit post entry displays the following:

- ✅ Title  
- ✅ Author  
- ✅ Date (MM/DD/YYYY format)  
- ✅ Thumbnail (if available)  
- ✅ Number of comments  
- ✅ Subreddit  

## 🎁 Bonus Implementations

The project also includes several optional features for enhanced user experience:

- ✅ **Detail View**: Tapping a post navigates to a detailed view.
- ✅ **Auto-resizing Cells**: Dynamic cell height adapts to content.
- ✅ **Landscape Support**: Fully functional UI in both portrait and landscape modes.
- ✅ **Custom Protocols**: Decoupling with protocol-oriented abstractions.
- ✅ **Persistence**: First page of Reddit feed is cached for offline access.

## 🚀 Getting Started

1. Clone the repository:
   ```bash
   git clone https://github.com/neptadin/grint-test.git
   cd grint-test
   pod install
   ```
