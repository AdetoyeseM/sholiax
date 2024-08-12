# shopliax
# Flutter Template

ShopLiax - A simple TODO list app. This template provides simple UI and scalable project structure that goes beyond the simple counter example. 

The app has basic selection screens,task list, task creation, and an sample API list screen. 

It's configured with [BLoC] and [RxDart] for state management, [Navigation 2.0], [GetIt] as service locator, Repository Pattern, and util and convenience methods. 

<br />
<div>
  &emsp;&emsp;&emsp;
  <img src="https://github.com/AdetoyeseM/sholiax/blob/main/screenshots/flutter_01.png" alt="Light theme" width="330">
  &emsp;&emsp;
  <img src="https://github.com/AdetoyeseM/sholiax/blob/main/screenshots/flutter_02.png" alt="Dark theme" width="320">  
    &emsp;&emsp;
  <img src="https://github.com/AdetoyeseM/sholiax/blob/main/screenshots/flutter_03.png" alt="Dark theme" width="320">    &emsp;&emsp;
  <img src="https://github.com/AdetoyeseM/sholiax/blob/main/screenshots/flutter_04.png" alt="Dark theme" width="320">    &emsp;&emsp;
  <img src="https://github.com/AdetoyeseM/sholiax/blob/main/screenshots/flutter_05.png" alt="Dark theme" width="320">    &emsp;&emsp;
  <img src="https://github.com/AdetoyeseM/sholiax/blob/main/screenshots/flutter_06.png" alt="Dark theme" width="320">  
</div>
<br />

[Navigation 2.0]: https://medium.com/flutter/learning-flutters-new-navigation-and-routing-system-7c9068155ade

# First Run

The project is configured with mock data if you run the **MOCK** flavor. See the next section for configuring run configurations.

After installing the package dependencies with 

```
flutter pub get
```

run the code generation tool 




## Dependency Management

Dependencies are managed in the [`service_locator.dart`][service_locator] file. This sample uses [GetIt], a lightweight service locator. There are 2 scopes defined in this template global and user scope. For more information visit the [wiki service locator page].

[service_locator]: ./lib/di/service_locator.dart
[GetIt]: https://pub.dev/packages/get_it
[wiki service locator page]: https://github.com/webfactorymk/flutter-template/wiki/Service-Locator

  
## Tests

The test package contains unit tests for almost all components. Be sure to give it a look.
