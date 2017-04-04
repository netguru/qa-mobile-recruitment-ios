# UITestWorkshops

Welcome to the **UITestWorkshops** project. It's an application made for iOS for UI Workshop

### Team

* [Błażej Wdowikowski](mailto:blazej.wdowikowski@netguru.co) - Developer
* [Piotr Torczyński](mailto:piotr.torczynski@netguru.co) - Developer


### Tools & requirements

- Xcode 8 with iOS 10.2+ SDK

- [Carthage](https://github.com/Carthage/Carthage) 0.10.1


### Configuration

Assuming the above tools are already installed.

 * Clone repo at `https://github.com/netguru/uitestworkshops-ios.git`
 * Within Terminal navigate to `uitestworkshops-ios` directory
 * Type `carthage bootstrap --platform iOS`

You are good to go! Just open `UITestWorkshops.xcodeproj`. In case of any problems don't hesitate to contact with us!

### Coding guidelines

- Respect community [Swift style guide](https://github.com/github/swift-style-guide).
- Respect community [Objective-C style guide](https://github.com/github/objective-c-style-guide).
- The code must be readable and self-explanatory - full variable names, meaningful methods, etc.
- **Don't leave** any commented-out code.


- Use `// NGRFixme:`, `// NGRHack:` or `// NGRTemp:` flags to indicate hacky, temporary, buggy code to repair and `// NGRTodo:` to point out job to do.


### Workflow

- Always hit `⌘U` (Product → Test) before committing.
- Always create PRs.
- Wait for Bitrise build to succeed before delivering a JIRA ticket.


### Related repositories
