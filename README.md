# KMPMobile

This project is a practice application developed using Kotlin Multiplatform (KMP).  
The purpose of the project is to get more familiar with the KMP platform.  
It is designed to demonstrate the capabilities of KMP by creating a multiplatform native application that fetches product data from a remote API and displays it on the screen.  
The project is structured into three main modules: `shared`, `androidApp`, and `iosApp`.  

## Technologies Used

- Kotlin
- Jetpack Compose
- Swift
- SwiftUI
- Gradle
- KMP

## Modules

### Shared

The `shared` module contains the common code that can be shared across different platforms.  
It includes the `ProductsApi` class which is responsible for fetching the product data from the remote API.

### AndroidApp

The `androidApp` module contains the Android-specific code. It includes the code in Kotlin which displays the product data on the screen based on the state of the network request.

### iOSApp

The `iosApp` module contains the iOS-specific code. It includes the code in Swift which displays the product data on the screen based on the state of the network request.

## Contributing

As this is a practice project, contributions are not actively sought. However, if you wish to contribute, you are welcome to do so.

## License

This project is licensed under the terms of the MIT license. This means that you are free to use, modify, and distribute the project as you see fit.
