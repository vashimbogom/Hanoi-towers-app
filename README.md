# Tower of Hanoi App
A cool app to visualize how to solve the Tower of Hanoi Puzzle.

# Features

## Puzzle Solution
The app can solve the Tower of hanoi Puzzzle from 1 and up to 13 disks. It was limited by the number of steps since they grow exponentially O(2^n), so with 13 disks we have 8,192 steps to perform, hence the limitation to have less than 10 thousand steps shown for the sake of memory usage in mobile devices and also, since the steps are showing praphically, it is very unlikely that a user will stay looking at the app for such number of movements.

In order to provide a better experience for the user, the velocity of the movements can be adjusted, it is 2.0 seconds by default, but can be modified in the user interface.

Each step is displayed bellow the rods, expalining the movement and after showing such instruction, the history of steps is displayed below, addig up each of these steps as they are happening. 

## Puzzle API
In order to solve the puzzle and get the steps of each movement, the App consumes a custom API: `https://hanoi-towers-api.fly.dev` providing the `algorithm` to solve the puzzle and the `number of disks`. For more information please review the BE solution at: https://github.com/vashimbogom/hanoi-towers-api

## Security Parameters Verification
The user text fields to collect the number of disks and velocity have custom formatters so that the main view model only receives integer and double values accordingly and avoid bad casting issues.

## Localization
The app has enabled localization for `English` and `Spanish` languages.

![app_en](https://github.com/user-attachments/assets/7f823e4c-b78c-40c2-bcc7-0bc3e6229f50)

![app_es](https://github.com/user-attachments/assets/65c975f8-563e-4099-aab1-12851ad7a93a)

## Dark Mode Support
Highly common in these days, the User interface of the app adjusts automatically to the prefferences of the device if Dark Mode is enabled.

![app_es_dark](https://github.com/user-attachments/assets/3994e9d2-6077-4bc9-8fea-adbda396e91e)


# App Architecture

The app was built using Clean Architecture and MVVM in SwiftUI, with Clean architecture we aim for the separation of concerns among components and as for MVVM, along with TCA, are ones of the most viable options to use for SwiftUI app architecture, hence MVVM was selected since it is a more traditional and widely adopted pattern, separating concerns between UI, presentation logic, and data/business logic.

High Level Design of the App:
<img width="1255" alt="arq" src="https://github.com/user-attachments/assets/da615ea7-68e0-4bd5-8663-66ea6aa874d7">


# Usage
This iOS application contains only Swift native code and the UI is built with SwiftUI, no external libraries are needed to run the project.






