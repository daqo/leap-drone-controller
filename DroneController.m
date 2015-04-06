//
//  DroneController.m
//  DroneGestureController
//
//  Created by Dave Qorashi on 4/6/15.
//  Copyright (c) 2015 Dave Qorashi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DroneController.h"

#define LEFT @"LEFT"
#define RIGHT @"RIGHT"
#define FORWARD @"FORWARD"
#define BACKWARD @"BACKWARD"
#define UP @"UP"
#define DOWN @"DOWN"
#define TAKEOFF @"TAKEOFF"
#define LAND @"LAND"
#define HOVER @"HOVER"
#define EMERGENCY @"EMERGENCY"

@implementation DroneController {
    DeviceController *_deviceController;
}

-(id) init:(DeviceController*)device {
    self = [super init];
    if (self) {
        _deviceController = device;
    }
    return self;
}

-(void) processCommand:(NSString*)cmd {
    if ([cmd isEqual: LEFT]) {
        [self yawLeft];
    } else if ([cmd isEqual: RIGHT]) {
        [self yawRight];
    } else if ([cmd isEqual: FORWARD]) {
        [self moveForward];
    } else if ([cmd isEqual: BACKWARD]) {
        [self moveBackward];
    } else if ([cmd isEqual: UP]) {
        [self ascend];
    } else if ([cmd isEqual: DOWN]) {
        [self descend];
    } else if ([cmd isEqual: TAKEOFF]) {
        [self takeoff];
    } else if ([cmd isEqual: LAND]) {
        [self land];
    } else if ([cmd isEqual: HOVER]) {
        [self hover];
    } else if ([cmd isEqual: EMERGENCY]) {
        [self emergency];
    } else {
        [self hover];
    }
}

-(void) moveForward {
    [_deviceController setFlag:1];
    [_deviceController setPitch:50];
}

-(void) moveBackward {
    [_deviceController setFlag:1];
    [_deviceController setPitch:-50];
}

-(void) yawLeft {
    [_deviceController setYaw:-50];
}

-(void) yawRight {
    [_deviceController setYaw:50];
}

-(void) ascend {
    [_deviceController setGaz:50];
}

-(void) descend {
    [_deviceController setGaz:-50];
}

-(void) takeoff {
    [_deviceController sendTakeoff];
}

-(void) land {
    [_deviceController sendLanding];
}

-(void) emergency {
    [_deviceController sendEmergency];
}

-(void) hover {
    [_deviceController setFlag:0];
    [_deviceController setRoll:0];
    [_deviceController setYaw:0];
    [_deviceController setPitch:0];
}

@end