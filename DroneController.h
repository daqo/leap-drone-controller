//
//  DroneController.h
//  DroneGestureController
//
//  Created by Dave Qorashi on 4/6/15.
//  Copyright (c) 2015 Dave Qorashi. All rights reserved.
//
#import "DeviceController.h"

@interface DroneController : NSObject

-(id) init:(DeviceController*)device;
-(void) processCommand:(NSString*)cmd;

@end