# main_practice

Year 4 Semester 1 Flutter All Practice Ralated work here.

## Licence

All rights reserved © 2024 Sokla Lor (CoreLaZz). Visit [www.soklalor.me](http://www.soklalor.me) for more information.

## Our Project Struture

This Project Struture base on professional folder struture looking clean and easy to manage.

```text

lib/
├── main.dart                           # Entry point of the application
│
├── core/                               # Core functionalities and services
│   ├── config/                         # Configuration files (e.g., environment settings, constants)
│   │   ├── app_config.dart             # Contains global configuration settings
│   │   ├── environment.dart            # Environment-specific configurations (e.g., dev, staging, production)
│   │   └── app_settings.dart           # User settings that can change during runtime
│   │
│   ├── utils/                          # Utility functions and helpers
│   │   ├── date_utils.dart             # Methods for date manipulation and formatting
│   │   ├── string_utils.dart           # Utility methods for string operations (e.g., validation, formatting)
│   │   └── math_utils.dart             # Common mathematical utility functions used across the app
│   │
│   ├── errors/                         # Custom error handling and exceptions
│   │   ├── error_handler.dart          # Contains methods to handle errors and log them appropriately
│   │   ├── exceptions.dart             # Custom exception classes for better error management
│   │   └── failure.dart                # Classes to represent failures (e.g., in repository methods)
│   │
│   ├── services/                       # Shared services (e.g., API, authentication)
│   │   ├── api_service.dart            # Base service for making HTTP requests and handling responses
│   │   ├── auth_service.dart           # Service for managing user authentication (login, signup, etc.)
│   │   └── storage_service.dart        # Service for handling local data storage (e.g., Shared Preferences)
│   │
│   ├── theme/                          # Theme and styling configuration
│   │   ├── app_theme.dart              # Primary theme configuration, including dark/light modes
│   │   ├── colors.dart                 # Color palette definitions used throughout the app
│   │   └── text_styles.dart            # Text styles (fonts, sizes, weights) to maintain consistency
│   │
│   └── constants/                      # Static constants shared across the application
│       ├── api_constants.dart          # API endpoint URLs and constants
│       └── app_constants.dart          # Application specific constants (e.g., timeouts, limits)
│
├── features/                           # Feature-based architecture
│   ├── authentication/                 # Feature module for authentication-related functionalities
│   │   ├── data/
│   │   │   ├── models/
│   │   │   │   └── user_model.dart             # Defines the User data model
│   │   │   ├── repositories/
│   │   │   │   └── auth_repository.dart        # Repository for authentication operations
│   │   │   └── data_sources/
│   │   │       ├── remote_data_source.dart     # Handles remote data retrieval (e.g., API calls)
│   │   │       └── local_data_source.dart      # Manages local data storage and retrieval
│   │   ├── domain/
│   │   │   ├── entities/
│   │   │   │   └── user_entity.dart            # Business model that represents a user
│   │   │   ├── repositories/
│   │   │   │   └── i_auth_repository.dart      # Interface defining authentication repository methods
│   │   │   └── usecases/
│   │   │       ├── login_usecase.dart          # Use case for logging in
│   │   │       └── signup_usecase.dart         # Use case for signing up
│   │   └── presentation/
│   │       ├── screens/
│   │       │   ├── login_screen.dart           # UI for the login screen
│   │       │   └── signup_screen.dart          # UI for the signup screen
│   │       ├── widgets/
│   │       │   └── login_form.dart             # Reusable widget for login form
│   │       └── bloc/
│   │           └── auth_bloc.dart              # BLoC (Business Logic Component) for authentication
│   │
│   ├── products/                               # Feature module for managing products
│   │   ├── data/
│   │   │   ├── models/
│   │   │   │   └── product_model.dart                          # Defines the Product data model
│   │   │   ├── repositories/
│   │   │   │   └── product_repository.dart                     # Repository for product operations
│   │   │   └── data_sources/
│   │   │       ├── remote_data_source.dart                     # Handles remote data retrieval for products
│   │   │       └── local_data_source.dart                      # Manages local caching of product data
│   │   ├── domain/
│   │   │   ├── entities/
│   │   │   │   └── product_entity.dart                         # Business model that represents a product
│   │   │   ├── repositories/
│   │   │   │   └── i_product_repository.dart                   # Interface for product repository methods
│   │   │   └── usecases/
│   │   │       ├── fetch_products_usecase.dart                 # Use case for fetching products
│   │   │       └── fetch_product_details_usecase.dart          # Use case for product detail fetching
│   │   └── presentation/
│   │       ├── screens/
│   │       │   ├── product_list_screen.dart                    # UI for the product listing screen
│   │       │   └── product_detail_screen.dart                  # UI for the product detail screen
│   │       ├── widgets/
│   │       │   └── product_card.dart                           # Reusable widget for displaying product information
│   │       └── bloc/
│   │           └── product_bloc.dart                           # BLoC for product management
│   │
│   ├── cart/                                           # Feature module for managing the shopping cart
│   │   ├── data/
│   │   │   ├── models/
│   │   │   │   └── cart_item_model.dart                # Defines the Cart Item data model
│   │   │   ├── repositories/
│   │   │   │   └── cart_repository.dart                # Repository for cart operations
│   │   │   └── data_sources/
│   │   │       └── local_data_source.dart              # Manages local storage for cart items
│   │   ├── domain/
│   │   │   ├── entities/
│   │   │   │   └── cart_item_entity.dart               # Business model representing a cart item
│   │   │   ├── repositories/
│   │   │   │   └── i_cart_repository.dart              # Interface for cart repository methods
│   │   │   └── usecases/
│   │   │       └── checkout_usecase.dart               # Use case for handling the checkout process
│   │   └── presentation/
│   │       ├── screens/
│   │       │   ├── cart_screen.dart                    # UI for the shopping cart
│   │       │   └── checkout_screen.dart                # UI for the checkout process
│   │       ├── widgets/
│   │       │   └── cart_item_card.dart                 # Reusable widget for displaying cart item details
│   │       └── bloc/
│   │           └── cart_bloc.dart                      # BLoC for cart management
│   │
│   └── settings/                                       # Feature module for application settings
│       ├── data/
│       │   ├── models/
│       │   │   └── settings_model.dart                 # Defines the Settings data model
│       │   ├── repositories/
│       │   │   └── settings_repository.dart            # Repository for app settings
│       │   └── data_sources/
│       │       └── local_data_source.dart              # Manages local storage for app settings
│       ├── domain/
│       │   ├── entities/
│       │   │   └── settings_entity.dart                # Business model representing app settings
│       │   ├── repositories/
│       │   │   └── i_settings_repository.dart          # Interface for settings repository methods
│       │   └── usecases/
│       │       ├── get_settings_usecase.dart           # Use case for retrieving app settings
│       │       └── update_settings_usecase.dart        # Use case for updating app settings
│       └── presentation/
│           ├── screens/
│           │   └── settings_screen.dart                # UI for the settings screen
│           └── widgets/
│               └── settings_tile.dart                  # Reusable widget for individual settings
│
├── localization/                               # Localization (i18n) and internationalization
│   ├── app_localizations.dart                  # Central localization class to manage strings
│   └── lang/                                   # Directory to store language translation files
│       ├── localization_en.dart                # English translation strings
│       ├── localization_es.dart                # Spanish translation strings
│       ├── localization_fr.dart                # French translation strings
│       ├── localization_de.dart                # German translation strings
│       └── localization_xx.dart                # Placeholder for additional languages (like Chinese, etc.)

├── tests/                                      # Test files
│   ├── unit/                                   # Unit tests for isolated functionalities
│   ├── widget/                                 # Widget tests for testing UI components
│   ├── integration/                            # Integration tests that verify interactions between modules
│   └── mock/                                   # Mock data and stubs for testing purposes
│       ├── mock_user.dart                      # Mock data for user testing
│       ├── mock_product.dart                   # Mock data for product testing
│       └── mock_cart_item.dart                 # Mock data for cart item testing
│
└── assets/                                     # Static assets (images, fonts, etc.)
    ├── images/                                 # Directory for image assets
    │   ├── logo.png                            # Main logo of the application
    │   └── background.jpg                      # Background image used in the app
    │
    └── fonts/                                  # Directory for custom font files
        ├── OpenSans-Regular.ttf                # Regular font
        └── OpenSans-Bold.ttf                   # Bold font

```

### Additional details

1. `core/network/`: Contains base networking setup, which can be used across the app.

2. `data/models/response/`: Includes models for standardized API responses.

3. `domain/usecases/`: Organized by feature (user, product) for better scalability.

4. `presentation/pages/`: Each major screen has its own directory with page-specific widgets.

5. `config/app_config.dart`: Manages environment-specific settings (dev, staging, production).

6. `localization/app_localizations_delegate.dart`: Custom delegate for more control over localization.

This structure is designed for large-scale applications, emphasizing:

- Separation of concerns
- Testability
- Scalability
- Maintainability

It follows clean architecture principles, allowing for easy changes to data sources or UI without affecting core business logic.

## Key Components Breakdown

### `main.dart`

**Purpose**: This is the entry point of your application, containing the `main` function that calls `runApp()` to launch your app. It typically contains initialization logic, such as setting up providers, and can also handle theme settings and routing.

### `core/`

This directory encapsulates the essential functionalities that are used across the app. Following best practices helps avoid redundancy and improve maintainability.

- **config/**: Configuration files that separate constants that can easily change when deploying to different environments (e.g., development vs. production). `app_settings.dart` can hold user settings that affect features directly (such as app mode).
  
- **utils/**: Utility functions that reduce boilerplate in your codebase and improve clarity. These functions provide simple, reusable methods for common operations.

- **errors/**: Effective error handling is key to creating stable applications. Custom exception classes allow specific error types that can be caught and handled appropriately.

- **services/**: Contains classes that handle business logic and external interactions (e.g., APIs, local storage). Grouping services helps separate concerns and makes it easier to adapt parts of the application.

- **theme/**: Organizing themes within your app ensures consistency in UI. You can switch themes based on user preferences or times of the day (light/dark mode).

- **constants/**: Separates all static values into easily readable files, making your code cleaner and improving maintainability. This is crucial for managing API endpoints or recurring magic numbers.

### `features/`

Following a feature-based architecture promotes modularity. Each feature folder is self-contained with its data, domain, and presentation layers.

- **data/**: Contains models that represent the data structures used across various API responses. This layer is also responsible for fetching and storing data (via repositories).

- **repositories/**: Implements abstraction over the data source, allowing for changes without affecting the rest of the application. For example, if you switch the data source from a remote API to a local database, the rest of the application remains unaffected.

- **domain/**: Represents the core business logic. This layer defines entities (business models), repository interfaces, and use cases that encapsulate the business rules required for each feature.

- **presentation/**: This is the UI layer, which includes screens and widgets. When using Flutter's state management (like BLoC or Provider), you can manage the state while keeping your UI code modular and reusable.

### `localization/`

This directory is dedicated to managing multilingual support.

- **app_localizations.dart**: Serves as a bridge for accessing translation strings throughout your app.
  
- Each localization file (e.g., `localization_en.dart`) contains a map of keys to their corresponding translations, allowing easy addition of new languages by creating new files for each locale.

### `tests/`

Organized testing folders enable a comprehensive testing strategy.

- **unit/**: Contains unit tests targeting individual functions and classes.

- **widget/**: Focuses on widgets to test UI components in isolation.

- **integration/**: Verifies that different parts of the application work together as expected.

- **mock/**: Holds mock data structured similarly to production data for easier testing without dependencies on external services.

### `assets/`

Organizes static files such as images and fonts, keeping your app's assets structured and reducing the chances of hardcoding paths throughout your code.
