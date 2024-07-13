# Weatheri App

Weatheri is a Flutter-based weather application that allows users to get weather reports based on their current location or by entering a city or place name. This app utilizes local location services and securely manages API keys using environment variables (`dotenv`).

## Features

- **Current Weather**: View the current weather conditions including temperature, humidity, wind speed, and more.
- **Location-based Weather**: Automatically fetch weather based on your device's current location.
- **City Search**: Enter a city or place name to get weather information for that location.
- **Secure API Key Management**: Uses environment variables (`dotenv`) to securely store API keys.

## Getting Started

To get started with Weatheri, follow these steps:

1. **Clone the Repository:**

   ```bash
   git clone https://github.com/vidya-hub/weatheri.git
   cd weatheri
   ```

2. **Set Up Environment Variables:**

   - Create a `.env` file in the root directory based on `.env.example`.
   - Replace `YOUR_API_KEY` with your actual API key from your weather service provider.

     Example `.env` file:

     ```
     OPEN_WEATHER_API_KEY=YOUR_API_KEY
     ```

3. **Install Dependencies:**

   ```bash
   flutter pub get
   ```

4. **Run the Application:**

   ```bash
   flutter run
   ```

5. **Usage:**
   - Upon launching, the app will attempt to fetch weather data based on your current location.
   - Enter a city or place name in the search bar to fetch weather information for that location.

## Dependencies

- `flutter_bloc`: State management library for Flutter.
- `geolocator`: Plugin for accessing device location.
- `http`: Package for making HTTP requests.
- `flutter_dotenv`: Plugin for managing environment variables securely.
