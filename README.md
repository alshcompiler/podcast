# Podcast

A modern SwiftUI iOS app for browsing and searching podcasts, featuring clean architecture, async/await, and robust unit testing.

---

## Features

- **Home:** Browse podcast sections with various layouts (square, grid, big square, queue).
- **Search:** Find podcasts with instant feedback.
- **Pagination:** Load more sections as you scroll.
- **Networking:** Async/await API calls with a clean separation of concerns.
- **Testing:** Protocol-based dependency injection and comprehensive unit tests.

---

## Getting Started

### Prerequisites

- Xcode 14 or later
- Swift 5.7 or later
- iOS 16.0+

### Installation

1. **Clone the repository:**
   ```sh
   git clone <your-repo-url>
   cd Podcast
   ```

2. **Open the project:**
   ```
   open Podcast.xcodeproj
   ```

3. **Install dependencies:**
   - The project uses [netfox](https://github.com/kasketis/netfox) for network debugging in Debug builds.
   - Swift Package Manager will resolve dependencies automatically when you open the project.

---

## Project Structure

```
Podcast/
  Podcast/                # Main app source code
    Modules/Podcast/      # Feature modules (Data, UI, ViewModel, etc.)
    Utils/                # Utilities and extensions
    Assets.xcassets/      # App assets
    PodcastApp.swift      # App entry point
  PodcastTests/           # Unit tests
  PodcastUITests/         # UI tests
  README.md               # This file
```

---

## Running the App

1. Select the `Podcast` scheme in Xcode.
2. Choose a simulator or device.
3. Press **Run** (⌘R).

---

## Running Tests

- **Unit Tests:**  
  Select the `PodcastTests` scheme and press **Test** (⌘U).
- **UI Tests:**  
  Select the `PodcastUITests` scheme and press **Test** (⌘U).

---

## Architecture

- **MVVM:**  
  ViewModels manage state and business logic, with protocol-based use cases for testability.
- **Dependency Injection:**  
  All major dependencies are injected via protocols, making the app easy to test and extend.
- **Async/Await:**  
  Modern Swift concurrency for networking and data loading.

---

## Development Notes

- **Network Debugging:**  
  [netfox](https://github.com/kasketis/netfox) is enabled in Debug builds for inspecting network traffic.
- **Testing Framework:**  
  Uses a custom `Testing` framework with `@Test` attributes and `#expect` assertions for expressive, async-friendly tests.
- **Mocks:**  
  Shared test mocks are in `PodcastTests/Mocks.swift`.

---

## Contributing

Pull requests are welcome! For major changes, please open an issue first to discuss what you would like to change.

---

## License

[MIT](LICENSE) (or your license here)