# Event Management Flutter UI

A comprehensive event management application UI built with Flutter, implementing a clean folder architecture with Provider state management.

## 🎯 Overview

This is a **UI-only implementation** of an event management system designed to manage events, leads, clients, orders, quotations, and team members. The application features a responsive design that adapts to mobile, tablet, and desktop screen sizes.

## ✨ Features

### Implemented Modules

- **Authentication**
  - Splash screen with auto-navigation
  - Responsive login screen (split-screen for desktop, full-screen for mobile)
  - Provider-based authentication state management

- **Dashboard**
  - Key metrics display (Upcoming Orders, Unassigned Orders, Due Payments, Total Clients, Total Orders)
  - Responsive grid layout
  - Navigation drawer for desktop/tablet
  - Pull-to-refresh capability

- **Lead Management**
  - Lead list with responsive views (cards for mobile, data table for desktop)
  - Status badges and filtering
  - Search functionality
  - Provider-based state management with mock data

- **Client Management**
  - Client list with responsive layouts
  - Client details display
  - Add/Edit client functionality

- **Order Management**
  - Tab-based navigation (All, Upcoming, Unassigned, Payment Due, Completed)
  - Responsive order cards and data tables
  - Status tracking

- **Setup & Master Data**
  - Team Member management with CRUD operations
  - Form dialogs for add/edit
  - Status toggles

- **Common Components**
  - Custom text fields with validation
  - Status badges (colored chips)
  - Empty states
  - Loading indicators
  - Pagination controls
  - Responsive utilities

## 🏗️ Architecture

### Folder Structure

```
lib/
├── core/
│   ├── theme/          # Theme configuration, colors, dimensions, text styles
│   ├── constants/      # Routes, breakpoints
│   ├── utils/          # Responsive utilities, validators
│   └── widgets/        # Reusable widgets (buttons, cards, badges, etc.)
├── features/
│   ├── auth/           # Authentication screens and providers
│   ├── dashboard/      # Dashboard screen and widgets
│   ├── leads/          # Lead management
│   ├── clients/        # Client management
│   ├── orders/         # Order management
│   ├── setup/          # Master data screens
│   └── ...             # Other feature modules
├── models/             # Data models
└── main.dart           # App entry point
```

### Design System

- **Color Palette**: Material Design inspired with primary blue (#1976D2) and orange (#FFA726) secondary
- **Typography**: Material Design 3 text styles
- **Spacing**: 8px grid system (8, 16, 24, 32, 40, 48dp)
- **Responsive Breakpoints**:
  - Mobile: < 768px
  - Tablet: 768px - 1024px
  - Desktop: > 1024px

## 🚀 Getting Started

### Prerequisites

- Flutter SDK (3.9.2 or higher)
- Dart SDK (compatible with Flutter version)

### Installation

1. Clone the repository
```bash
cd ui_specification
```

2. Install dependencies
```bash
flutter pub get
```

3. Run the application
```bash
flutter run
```

For web:
```bash
flutter run -d chrome
```

For specific device:
```bash
flutter run -d <device_id>
```

## 📦 Dependencies

- `provider` (^6.1.1) - State management
- `go_router` (^14.6.2) - Advanced routing
- `table_calendar` (^3.1.2) - Calendar widget
- `intl` (^0.19.0) - Internationalization and date formatting
- `image_picker` (^1.1.2) - Image selection
- `file_picker` (^8.1.6) - File uploads

## 🎨 Key Screens

### Authentication
- `/` - Splash Screen
- `/login` - Login Screen

### Main Application
- `/dashboard` - Dashboard with metrics
- `/leads` - Lead management
- `/clients` - Client management
- `/orders` - Order management
- `/events` - Event management (placeholder)
- `/quotations` - Quotation management (placeholder)
- `/setup/team-members` - Team member management
- `/users` - User management (placeholder)
- `/messages` - Messages (placeholder)

## 🔧 Provider Structure

All providers are set up with placeholder methods for future logic implementation:

- `AuthProvider` - Authentication state and login/logout
- `LeadProvider` - Lead CRUD operations
- Additional providers can be added as needed

## 📱 Responsive Design

The app uses a `Responsive` utility class to adapt layouts:

```dart
Responsive(
  mobile: MobileLayout(),
  tablet: TabletLayout(),
  desktop: DesktopLayout(),
)
```

## 🎯 Future Implementation

The following areas are prepared for future logic implementation:

- [ ] API integration for all CRUD operations
- [ ] Complete form validation and submission
- [ ] File upload functionality
- [ ] Calendar integration for event management
- [ ] WhatsApp/SMS integration
- [ ] PDF generation for quotations
- [ ] Push notifications
- [ ] Role-based access control
- [ ] Search and filter implementations
- [ ] Data persistence

## 📝 Notes

- This is a **UI-only** implementation with mock data
- All API calls are simulated with delays
- Provider methods contain `TODO` comments for future implementation
- The app accepts any email/password combination for demo purposes
- Placeholder screens are used for unimplemented routes

## 👨‍💻 Development

To add a new feature module:

1. Create folder structure under `lib/features/<module_name>/`
2. Add screens in `screens/` folder
3. Add widgets in `widgets/` folder
4. Create provider in `providers/` folder
5. Add route in `main.dart`
6. Update navigation drawer if needed

## 📄 License

This project is private and not licensed for public use.

---

**Built with ❤️ using Flutter**
