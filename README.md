# songgpt

SongGPT is a Flutter-based mobile application designed to help users create and explore songs using AI-generated suggestions and a rich library of predefined content.
## Video Demo
-You can [download the demo video](images/screen-20241027-084239.mp4) to see the app in action.
## Test Apk
-You can [download the Test Apk](https://file.io/DbxwL5wAxc9d) to see the app in action.


## Features

- **Home Screen**: Browse and search for songs.
- <img src="images/homepage_dark.png" alt="Main Page Screenshot" width="350">
- <img src="images/homepage_light.png" alt="Gallery Screenshot" width="350">
- **AI Chat**: Interact with an AI to generate song ideas.
 <img src="images/chat_darkmode.png" alt="Main Page Screenshot" width="350">
<img src="images/ai_generated.png" alt="Gallery Screenshot" width="350">


- **Song Detail Screen**: View detailed information about songs, including cover art, basic information, and lyrics.
 
 <img src="images/ai_generated_darkMode.png" alt="Gallery Screenshot" width="350">
- **Profile Screen**: Manage user profiles, liked songs, and user-generated songs.
 <img src="images/profile_darkmode.png" alt="Gallery Screenshot" width="350">
 <img src="images/profile_lightmode.png" alt="Gallery Screenshot" width="350">
## Installation

1. **Clone the repository**:
    git clone https://github.com/yourusername/SongGPT.git
     cd SongGPT
2. **Install dependencies**:
    flutter pub get
3. **Run the app**:
    ```sh
    flutter run
    ```

## Folder Structure

lib/ |- core/ | |- theme/ | | |- app_colors.dart | | |- app_fonts.dart | | |- theme.dart | | |- theme_notifier.dart | |- widgets/ | |- custom_app_bar.dart |- data/ | |- models/ | | |- song_model.dart | |- providers/ | |- auth_provider.dart | |- chat_provider.dart | |- navigation_provider.dart | |- repositories/ | |- song_repository.dart |- presentation/ | |- screens/ | | |- home_screen.dart | | |- chat_screen.dart | | |- song_detail_screen.dart | | |- profile_screen.dart | |- widgets/ | |- custom_textfield.dart | || |- main.dart
