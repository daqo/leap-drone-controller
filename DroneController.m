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

@implementation DroneController

-(id) init:(DeviceController*)device {
    self = [super init];
    if (self) {
        _device = device;
    }
    return self;
}

-(void) processCommand:(NSString*)cmd {
    if (_device) {
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
    } else {
        NSLog(@"Device is nil");
    }
}

-(void) moveForward {
    [_device setFlag:1];
    [_device setPitch:50];
    
    [_device setRoll:0];
    [_device setYaw:0];
    [_device setGaz:0];
}

-(void) moveBackward {
    [_device setFlag:1];
    [_device setPitch:-50];
    
    [_device setRoll:0];
    [_device setYaw:0];
    [_device setGaz:0];
}

-(void) yawLeft {
    [_device setFlag:0];
    [_device setYaw:-50];
    
    [_device setRoll:0];
    [_device setPitch:0];
    [_device setGaz:0];
}

-(void) yawRight {
    [_device setFlag:0];
    [_device setYaw:50];
    
    [_device setRoll:0];
    [_device setPitch:0];
    [_device setGaz:0];
}

-(void) ascend {
    [_device setFlag:0];
    [_device setGaz:50];
    
    [_device setYaw:0];
    [_device setRoll:0];
    [_device setPitch:0];
}

-(void) descend {
    [_device setFlag:0];
    [_device setGaz:-50];
    
    [_device setYaw:0];
    [_device setRoll:0];
    [_device setPitch:0];
}

-(void) takeoff {
    [_device sendTakeoff];
}

-(void) land {
    [_device sendLanding];
}

-(void) emergency {
    [_device sendEmergency];
}

-(void) hover {
    [_device setFlag:0];
    [_device setRoll:0];
    [_device setYaw:0];
    [_device setPitch:0];
    [_device setGaz:0];
}

@end