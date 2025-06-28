import Foundation

var isRunningUnitTests: Bool {
    return ProcessInfo.processInfo.environment["XCTestConfigurationFilePath"] != nil
}

func testableAssertionFailure(_ message: String) {
    #if DEBUG
    if !isRunningUnitTests {
        assertionFailure(message)
    }
    #endif
} 