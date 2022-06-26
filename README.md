# Aaveg App

![Aaveg 22 - Mobile App](https://user-images.githubusercontent.com/71443682/161394464-c51ce11d-5857-406d-b43e-c0841ad113b6.png "Aaveg App")

Flutter Application for Aaveg Fest


## Screenshots
<img src="https://user-images.githubusercontent.com/83528327/175801258-18fa9e7f-fd0e-4502-8509-fd6d3206cf4a.jpg" width="150">&emsp;
<img src="https://user-images.githubusercontent.com/83528327/175801252-bee9d110-e12c-40ee-849b-eca956ce2934.jpg" width="150">&emsp;
<img src="https://user-images.githubusercontent.com/83528327/175801248-9bcc0c6b-f218-45dd-b542-b9df53b486d3.jpg" width="150">&emsp;
<img src="https://user-images.githubusercontent.com/83528327/175801255-6cd4de6d-fa4d-40c2-9cd7-508f0cb1a1ff.jpg" width="150">&emsp;
<img src="https://user-images.githubusercontent.com/83528327/175801261-162c2e27-53a2-4fb4-ae99-b7c2587ce250.jpg" width="150">&emsp;
<img src="https://user-images.githubusercontent.com/83528327/175801257-9c2f74b0-6d7b-4e40-a408-151f61bac311.jpg" width="150">&emsp;
## Flutter

### Requirements

- Java-Version - '17.x'
- Flutter-Version - '2.10.x'
- Dart-Version - '2.16' or above
- Android Studio

### Setup
* Fork and Clone the Repo
    ```
    git clone <YOUR_FORK_URL>
    ```
* Add remote upstream
    ```
    git remote add upstream <MAIN_REPO_URL>
    ```
* To get all the dependencies listed in the pubspec
    ```
    flutter pub get
    ```
* To run the App
    ```
    flutter run 
    ```

## Firebase

### Requirements
- [gnupg](https://gnupg.org/download/)

### Setup
* Add google-services.json file inside android/app/
* Add the file path in .gitignore(if not already)
* Copy and Paste the config.example.dart to config.dart and add your details

  ```
  cd lib/utlis
  cp config.example.dart config.dart 
  ```
* Add config.dart in gitignore(if not added already)
* Creating tar file [services.tar], Run the command below in your project's working directory to create the archive file:
    
    ``` 
    tar cvf services.tar android/app/google-services.json
    ```
* Add the services.tar in .gitignore(if not already)
* Run the command below to encrypt the services.tar file. 
    ``` 
    gpg -c services.tar
    ```
* During encryption, it will ask for password which will be used to decrypt the encrypted file. After running the command, there will be a new file in your project's working directory named `services.tar.gpg`.    
* Add the gpg password to github secrets    

## GithubActions

### Workflow
* on: [pull_request, push] to main: This workflow will work whenever someone push or, make a pull request main branch.
* In the steps we are:
   * if pull_request
        * Run Formatter
        * Run Analyzer
   * if push
        * Decryptes the services.tar.gpg by using the password stored in the secrets FIREBASE_SECRET.
        * Builds app-release.apk.
        * Stores the generated app-release.apk in artifacts
## GitHooks

### Configure git-hooks path
* Run the following command
    ```
    git config core.hooksPath .githooks
    ```
 ### Features 
* pre-commit
    * Runs Formatter
    * Runs Analyzer

* pre-push
    * Checks for un-committed files
    * Runs Test cases

## Contributing to Aaveg App

Here are the guidelines we'd like you to follow:

- [Coding Rules](#rules)
- [Commit Message Guidelines](#commit)

---

**NOTE:**

Never push directly to main repository (upstream). Only push to your forked repo (origin) and send a pull request to
the main repository

---

### <a id="rules"></a> Coding Rules

To ensure consistency throughout the source code, keep these rules in mind as you are working:

- The coding style to be followed along with instructions to use flutter_lint
- Enable Sound-Null-Safety

### <a id="commit"></a> Git Commit Guidelines

#### Commit Message Format

Each commit message consists of a **header**, a **body** and a **footer**. The header has a special
format that includes a **type**, a **scope** and a **subject**:

```bash
<type>(<scope>): <subject>
<BLANK LINE>
<body>
<BLANK LINE>
<footer>
```

Any line of the commit message cannot be longer 100 characters! This allows the message to be easier to read on github
as well as in various git tools.

#### Example Commit Message

```bash
feat(Profile): display QR code

fetch the qr code from API and display it on Profile page (profile_screen.dart)

fixes #1234
```

Please follow the conventions followed [here](http://karma-runner.github.io/latest/dev/git-commit-msg.html).

Also, refer [this page](https://chris.beams.io/posts/git-commit/) on how to write the body
