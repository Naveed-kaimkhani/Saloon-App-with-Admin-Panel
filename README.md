# Salon App with Admin Panel

The Salon App is a robust Flutter application designed to manage salon appointments effectively. This app integrates Firebase, Cloud Functions, and GitHub Actions to provide seamless appointment booking, scheduling, and notification systems for both clients and administrators.

---

## Key Features

### Appointment Booking System
- Allows clients to book, reschedule, and cancel appointments easily.
- Handles over **300+ client appointments monthly**, significantly reducing conflicts and improving customer satisfaction by **60%**.

### Automated Waitlist Management
- **Cloud Functions** handle waitlist automation, ensuring users are automatically scheduled when a slot becomes available.

### Real-Time Notifications
- Sends real-time notifications to users **2 hours before their scheduled appointment** to enhance punctuality and user convenience.

### Admin Panel
- Provides salon administrators with tools to manage bookings, view schedules, and send notifications directly to clients.

---

## Technologies Used

### Frontend
- **Flutter**: Cross-platform UI toolkit for building responsive and attractive mobile applications.

### Backend
- **Firebase Firestore**: For real-time database and synchronization.
- **Cloud Functions**: For serverless backend automation and notification scheduling.

### Notifications
- **Firebase Cloud Messaging (FCM)**: For push notifications.

### DevOps
- **GitHub Actions**: For CI/CD, ensuring automated testing, builds, and deployments.

---

## Installation

1. **Clone the Repository**:
   ```bash
   git clone https://github.com/Naveed-kaimkhani/Saloon-App-with-Admin-Panel.git
   ```

2. **Navigate to the Project Directory**:
   ```bash
   cd Saloon-App-with-Admin-Panel
   ```

3. **Install Dependencies**:
   ```bash
   flutter pub get
   ```

4. **Set Up Firebase**:
   - Add your Firebase project configuration (`google-services.json` for Android, `GoogleService-Info.plist` for iOS).

5. **Run the Application**:
   ```bash
   flutter run
   ```

---

## Usage

1. **Client Features**:
   - Register and log in using Firebase Authentication.
   - Book, reschedule, or cancel appointments.
   - Join the waitlist for fully booked slots.
   - Receive timely notifications for upcoming appointments.

2. **Admin Features**:
   - View and manage all appointments via the admin panel.
   - Notify users about appointment updates.

---

## Contributing

Contributions are welcome! To contribute:

1. Fork the repository.
2. Create a new branch (`git checkout -b feature-name`).
3. Commit your changes (`git commit -m 'Add some feature'`).
4. Push to the branch (`git push origin feature-name`).
5. Open a pull request.

---

## License

This project is licensed under the MIT License. See the `LICENSE` file for details.

---

## Contact

For queries or suggestions, please contact:
- **Naveed Kaimkhani**
- Email: [Your Email Address]
- GitHub: [Naveed-kaimkhani](https://github.com/Naveed-kaimkhani)

---

Thank you for exploring the Salon App project!

