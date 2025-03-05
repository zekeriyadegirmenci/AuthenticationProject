# Authentication App Using Firebase Authentication, MVVM Architecture, and Async/Await

In this project, I developed a basic Authentication app using Firebase Authentication with SwiftUI, following the MVVM architecture and using async/await.

### Key Features:
1. **User Registration**: 
   Users receive an email verification when they register to ensure valid email addresses.
   
2. **Login**: 
   Users can log in, and if already logged in, they will not be prompted again until they log out.
   
3. **User Session Management**: 
   The app tracks the user’s session and ensures they remain logged in until they log out.
   
4. **Firebase Integration**: 
   Firebase Authentication is used for user registration, login, and email verification.

### Architecture:
- **MVVM**: 
   The app follows the MVVM architecture, with the ViewModel managing authentication logic and the View presenting the UI.
   
- **Async/Await**: 
   Async/await is used for handling asynchronous operations like login, registration, and session verification.

### Screenshots:

Below are some screenshots from the app:

| ![Image](https://github.com/user-attachments/assets/59dfc4ab-7efc-4f52-be25-7a0d9358b65e) | ![Image](https://github.com/user-attachments/assets/cf140717-a42b-488e-9ebd-8d0786479bb9) | ![Image](https://github.com/user-attachments/assets/3218f2f2-4ca8-4871-96f5-48280a78f62b) | ![Image](https://github.com/user-attachments/assets/585b4fde-a933-42ae-aa6e-8f580e9a71d8) |
|:------------------------------------------------------------:|:------------------------------------------------------------:|:------------------------------------------------------------:|:------------------------------------------------------------:|

---

### Note:
For those interested in using Firebase Authentication in their own project, you can add your own `GoogleInfo.plist` file to the **Supporting Files** folder. Once you've added the `GoogleInfo.plist` from your Firebase project, you'll be able to run the app on your own server.
