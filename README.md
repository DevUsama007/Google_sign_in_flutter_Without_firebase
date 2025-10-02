# google_sign_in_without_firebas

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
, which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## steps for the google sign in flutter without the firebase
1. Create the Flutter Project the most important part hehehe.
2. go to [Google Cloud Console](https://console.cloud.google.com/welcome?project=stellar-operand-473814-c1)
3. create your project here and select the project 
4. Go to Api and Services and then OAuthConcentScreen and click on GetStarted
    a. write the app name and supported email here
    b. select the external 
    c. then enter the email for contact the click on agree and complete it.
5. After that create the client by clicking of hte client on the left side bar
    a. click on create client 
    b. select the application type android
    c. enter the application name
    d. enter the package name from the app level build.gradle file . 
        ```bash
        android {
        namespace = "com.example.google_sign_in_without_firebas"
        ```
    e. get SHA1 certificate by running this command in the terminal or powershell and enter here
        ```bash
            keytool -list -v -alias androiddebugkey -keystore "$env:USERPROFILE\.android\debug.keystore"
        ```
        if that is not worked you can try this
        ```bash
            keytool -keystore path-to-debug-or-production-keystore -list -v
        ```
    f. then click on create and your android client is created 
6. After that go in androidMenifest file and in the <application/> enter that client id like that
            ```bash
            <meta-data
            android:name="com.google.android.gms.client_id"
            android:value="748847791063-001n1f0mpes6qtso98f84oufis66obj5.apps.googleusercontent.com" /> 
            ```
## that all for the android now if you want to setup the web application than follow these steps

1. go on client and in the Create OAuth client ID section select the application type web application
2. enter the web client 1
3. after you have to setup the Authorised JavaScript origins without google sign in does not work in web application for that ADD URI in Authorised JavaScript origins and enter your web application url that is in your chrome tab search where you run your web application in chrome.
    a. for the local host its like that
        ```bash
            http://localhost:55951/
        ```
    b. if you are not on local host then you can add your domain link here
        ```bash
        https://abc.com/
        ```
4. after that in that go in flutter project and in the web>index.html in the head tag add this 
meta tag with with your web client id
    ```bash
    <meta name="google-signin-client_id"
    content="748847791063-6t7ffi0v27f3295cudk9il12nfrcpq1u.apps.googleusercontent.com">
    ```