
# Flutter Focus Application

The basic task of this focus application is to help the user to stay focused on their ongoing task without getting distracted by their phone.

[App Logo](https://github.com/SKYHAWK993/Focus-Application/tree/main/images/logo.jpeg)

## Functionality and Features

The user can use the pomodoro timer in the application according to their flexible focus time and rest (short and long) time.
Also the user can switch the focus mode on or off. When the focus mode is off, they user can wander outside the application without any overlay or change in state of the app.
However when the focus mode is on, the user can go outside the application only when the rest time of the timer is on. Else an overlay window will pop up that will disable the user from accessing anything outside the application. 

### Homescreen
The homescreen basically consists of a main navigation bar that helps users navigate between the settings tab and the home tab.
The settings tab allows the user to select the focus time, rest time, long rest time and the focus mode (on or off). 
The timer will run according to your selected settings.
The home tab consists of the timer display card, the timer controls and the progress information - the controls of each of which is stored in a different widgets file.
When the timer is running, during focus- the screen colour will be red, and during rest- the screen colour will be green. Making it easier to differentiate between the two modes. 
This file also consists the logic behind the overlay that comes when the user tries to use the back button/ gesture or tries to go to the settings when the timer is running.

[Home Screen](https://github.com/SKYHAWK993/Focus-Application/tree/main/images/homescreen.jpeg)

[Home Screen during break](https://github.com/SKYHAWK993/Focus-Application/tree/main/images/break.jpeg)

### Timerservice
The timerservice file has all the logic of the running of the pomodoro timer. 
It consists of the functions- start, pause, reset, selecting focus/ rest/ long rest times and handling the rounds.

[Settings page adjust timer](https://github.com/SKYHAWK993/Focus-Application/tree/main/images/settings.jpeg)

### Timeroptions
There are 4 timeroptions files in the widgets folder. Each timeroption help select the time for the the focus/ rest/ long rest and even focus mode- on or off from the settings. 
Ontap of one of the settings, a function from timerservice is called and the value of the variable is changed, thus changing the functionality of the pomodoro timer accordingly.

### Timercontroller
This file allows the user to pause and start the timer according to the focus mode(on or off). It calls the pause and start functions from the timerservice files.

### Timercard
The timercard is the basic visual design of the pomodoro timer that will show the digits when the timer is running.

### Overlay widget
This file has the code for the overlay that will popup when the user tries to exit the app. The overlay has proceed and cancel options. Using the onpressed arguement, we can perform the necessary function accordingly.

[Overlay Blocking Exit](https://github.com/SKYHAWK993/Focus-Application/tree/main/images/overlay.jpeg)


## Made By

- [@Soham Haldankar](https://github.com/soham-haldankar)
- [@Tejas Joshi](https://github.com/SKYHAWK993)

