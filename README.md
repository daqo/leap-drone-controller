# Leap Drone Controller v1.0

This is a gesture based controller for navigating [Parrot Bebop Drone](http://www.parrot.com/products/bebop-drone/) written in Objective-C.

It was part of [my master thesis work](http://www.slideshare.net/daqo/masters-thesis-proposal-david-qorashi) focused on using hand gestures to navigate drones.

The system uses a $P Point-Cloud Recognizer for geometric template matching.

You can define any kind of gesture in the application, but in the UI I just show the labels for Right, Left, Up, Down, Forward, Back and Hover gestures.

## Usage
First you need to define gestures and train the system about them. After the training is completed, the system can categorize the new gestures based on the training set. After defining the gestures you can initialize drone (you need to be connected to the drone via Wi-Fi) and send it the appropriate command


## Author
David Qorashi

Contact: qorashis AT mail.gvsu.edu