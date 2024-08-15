 

# Currency Converter App

## Description

This Flutter application is a simple yet powerful currency converter that converts USD (United States Dollar) to INR (Indian Rupee) using live exchange rates. The app integrates with the [CurrencyLayer API](https://currencylayer.com/) to fetch real-time USD to INR conversion rates.

## Features

- **Real-time Conversion**: Get up-to-date conversion rates for USD to INR.
- **User-Friendly Interface**: Clean and intuitive design for seamless user experience.
- **Responsive Design**: Optimized for both mobile and tablet devices.
- **Easy to Use**: Simple input and output fields to enter USD and view INR.

## Getting Started

To get started with this project, follow these instructions to set up the development environment and run the app locally.

### Prerequisites

- [Flutter](https://flutter.dev/docs/get-started/install) (Make sure to have Flutter installed on your machine.)
- [Dart](https://dart.dev/get-dart) (Comes with Flutter, but ensure it's up-to-date.)
- A valid [CurrencyLayer API key](https://currencylayer.com/) (For accessing live exchange rates.)

### Installation

1. **Clone the Repository**

   ```bash
   git clone https://github.com/yourusername/convertor.git
   ```

2. **Navigate to the Project Directory**

   ```bash
   cd convertor
   ```

3. **Install Dependencies**

   ```bash
   flutter pub get
   ```

4. **Configure API Key**

   - Open `lib/constants.dart` and replace `YOUR_API_KEY` with your actual CurrencyLayer API key.

     ```dart
     const String apiKey = 'YOUR_API_KEY';
     ```

5. **Run the App**

   ```bash
   flutter run
   ```

### Usage

1. Open the app on your device or emulator.
2. Enter the amount in USD that you want to convert.
3. The app will display the equivalent amount in INR.
 

## Contributing

If you would like to contribute to this project, please follow these guidelines:

1. Fork the repository.
2. Create a new branch (`git checkout -b feature/YourFeature`).
3. Make your changes and commit them (`git commit -am 'Add new feature'`).
4. Push to the branch (`git push origin feature/YourFeature`).
5. Create a new Pull Request.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Acknowledgements

- [CurrencyLayer](https://currencylayer.com/) for providing the API for exchange rates.
- [Flutter](https://flutter.dev/) for the framework used in this project.

---

Feel free to adjust the sections as needed to better fit your project specifics. This template provides a solid foundation for documenting your Flutter currency converter app.
