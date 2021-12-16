# Aaveg App

Flutter Application for Aaveg Fest

<img src="https://user-images.githubusercontent.com/63253383/146262939-9f67040b-d334-4dbc-8c30-b395d3fb2b71.png" margin = auto >

## Screenshots

<img src="https://user-images.githubusercontent.com/63253383/146260460-b8648dd4-dec0-4f00-a246-5598fadc8594.jpeg" width="200">&emsp;
<img src="https://user-images.githubusercontent.com/63253383/146260517-fc0d97e0-58f6-4830-b99e-780d5feb553c.jpeg" width="200">&emsp;
<img src="https://user-images.githubusercontent.com/63253383/146261570-adb3aeb7-af93-406f-8aad-a2742b1496c1.jpeg" width="200">&emsp;
<img src="https://user-images.githubusercontent.com/63253383/146260542-bd3be63e-398d-4f83-be5f-80f57ea17d21.jpeg" width="200">&emsp;
<img src="https://user-images.githubusercontent.com/63253383/146260973-56575649-fb39-4249-b7bc-dde92be1895c.jpeg" width="200">&emsp;
<img src="https://user-images.githubusercontent.com/63253383/146261590-4221ca44-7999-4aa4-b76b-f9eae4bcc3e9.jpeg" width="200">&emsp;
<img src="https://user-images.githubusercontent.com/63253383/146260958-647f9f28-4d2c-4269-8276-42343cbeab95.jpeg" width="200">&emsp;
<img src="https://user-images.githubusercontent.com/63253383/146260567-7da8327f-d229-4fa8-a01a-b2ff3d011a7e.jpeg" width="200">&emsp;
<img src="https://user-images.githubusercontent.com/63253383/146260577-48e60f30-bcac-408e-87f4-3303aa0418d5.jpeg" width="800">&emsp;

## Flutter

### Requirements

- Java-Version - '12.x'
- Flutter-Version - '2.5.x'
- Dart-Version - '2.12' or above
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
