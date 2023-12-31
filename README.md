# Smart Home Control App

This is a smart home control app developed using Flutter and MQTT for communication with IoT devices. The app allows users to control two lamps and a door while also fetching temperature and humidity data. Additionally, the app detects gas levels to ensure safety within the home.

## Features

- Control of two lamps (lampes1 and lampes2).
- Control of the main door (portail).
- Fetching temperature data from sensors (maison/capteurs/temperature).
- Fetching humidity data from sensors (maison/capteurs/humidite).
- Gas detection (maison/capteurs/gaz).

## Screenshots

<body>
    <table>
        <tr>
            <th>Image 1</th>
            <th>Image 2</th>
            <th>Image 3</th>
        </tr>
        <tr>
            <td><img src="https://github.com/aymendevflutter/smarthome_mqtt_iot/assets/132212405/dd1a6108-89f1-42cb-ba54-ba96fd70f4c4" alt="smarthome1"></td>
            <td><img src="https://github.com/aymendevflutter/smarthome_mqtt_iot/assets/132212405/5182e524-7b26-4866-bb2a-a32c6e7ffde0" alt="home5"></td>
            <td><img src="https://github.com/aymendevflutter/smarthome_mqtt_iot/assets/132212405/cce0047e-659a-4b71-a279-f3c3e729efb3" alt="home6"></td>
        </tr>
        <tr>
            <td><img src="https://github.com/aymendevflutter/smarthome_mqtt_iot/assets/132212405/85e19e7d-f6c4-4d0d-9d07-7becf4f749e4" alt="smar3"></td>
            <td><img src="https://github.com/aymendevflutter/smarthome_mqtt_iot/assets/132212405/ff2172e4-2a6a-4cf8-8d90-568df6d2068a" alt="smarhome2"></td>
            <td></td> <!-- Empty cell if you have fewer than three images in the last row -->
        </tr>
    </table>
</body>



## Prerequisites

Before running the app, you need to set up the following:

1. [Flutter](https://flutter.dev/) environment setup.
2. MQTT broker - We are using [EMQX](https://www.emqx.com/en) as our MQTT broker.
3. Firebase project for user authentication (signup and signin).

## Setup and Installation

1. Clone the repository:

```bash
git clone https://github.com/yourusername/your-repo.git
```

2. Open the project in your preferred Flutter development environment.

3. Install the required dependencies:

```bash
flutter pub get
```

4. Configure Firebase:

   - Follow the Firebase setup instructions to set up your project and obtain the required configuration files (google-services.json and GoogleService-Info.plist) for Android and iOS, respectively.

5. Set up MQTT:

   - Ensure you have the correct MQTT broker settings in the app code. Look for configurations related to MQTT, such as the broker URL, username, and password, in the app's source code.

6. Run the app:

```bash
flutter run
```

## Usage

The app is designed to control smart home devices using a smart cart (e.g., ESP32 or Arduino with a GSM module). The smart cart acts as a bridge between the app and the actual devices.

1. Install the smart cart with appropriate firmware and GSM module.
2. Configure the smart cart to communicate with the MQTT broker and subscribe/publish to the relevant topics for lamps, door, temperature, humidity, and gas.
3. Ensure that the smart cart is connected to the same MQTT broker as configured in the app.
4. Open the app and sign in using your Firebase account.
5. Once signed in, the app will automatically connect to the MQTT broker.
6. Use the app to control lamps and the door, fetch temperature and humidity data, and detect gas levels in your smart home.

## Contributors

- [(Aymen Fridhi)](https://github.com/aymendevflutter)

## Contact

For any questions or feedback, feel free to reach out to me at aymenfrid@gmail.com.

## License

This project is licensed under the [MIT License](https://opensource.org/licenses/MIT) - see the [LICENSE](LICENSE) file for details.


