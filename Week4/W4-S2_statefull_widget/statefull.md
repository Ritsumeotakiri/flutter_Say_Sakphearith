Answer:
1. Why do we have a distinction between stateless and stateful widgets?
The distinction exists to manage UI performance and behavior effectively. Stateless widgets are immutable and efficient for static content, while stateful widgets can maintain and manage dynamic state changes. This separation allows developers to optimize their applications by choosing the appropriate widget type based on whether the UI needs to reflect changing data or remain constant.

2. When do I need to use a stateless widget?
Use a stateless widget when:
- The UI is static and does not change over time.
- You are displaying fixed content, such as text, images, or icons.
- You want to enhance performance by avoiding unnecessary state management.
- Your widget does not depend on user interactions or external data changes.

3. When do I need to use a stateful widget?
Use a stateful widget when:
- The UI needs to change in response to user interactions (e.g., button presses, text input).
- You are managing dynamic data that may update over time (e.g., fetching data from an API).
- You require complex UI interactions, such as animations or transitions.
- You need to manage the lifecycle of the widget (initialization, updates, and disposal of resources).