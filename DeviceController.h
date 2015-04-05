#import <Foundation/Foundation.h>
#import <libARSAL/ARSAL.h>
#import <libARDiscovery/ARDiscovery.h>
#import <libARDiscovery/ARDISCOVERY_BonjourDiscovery.h>
#import <libARCommands/ARCommands.h>
#import <libARNetwork/ARNetwork.h>
#import <libARNetworkAL/ARNetworkAL.h>

typedef struct
{
    uint8_t flag; // [0;1] flag to activate roll/pitch movement
    int8_t roll;  // [-100;100]
    int8_t pitch; // [-100;100]
    int8_t yaw;   // [-100;100]
    int8_t gaz;   // [-100;100]
    float psi;    // not used
}BD_PCMD_t;

typedef struct
{
    void *deviceController;
    int readerBufferId;
}READER_THREAD_DATA_t;


@class DeviceController;

@protocol DeviceControllerDelegate <NSObject>
- (void)onDisconnectNetwork:(DeviceController *)deviceController;
- (void)onUpdateBattery:(DeviceController *)deviceController batteryLevel:(uint8_t)percent;
- (void)onFlyingStateChanged:(DeviceController *)deviceController flyingState:(eARCOMMANDS_ARDRONE3_PILOTINGSTATE_FLYINGSTATECHANGED_STATE)state;
@end


@interface DeviceController : NSObject

@property (nonatomic, weak) id <DeviceControllerDelegate> delegate;
/** Get the ARService instance associated with this controller. */
@property (readonly, nonatomic, strong) ARService* service;

- (id)initWithARService:(ARService*)service;
- (BOOL)start;
- (void)stop;

- (void) setRoll:(int8_t)roll;
- (void) setPitch:(int8_t)pitch;
- (void) setYaw:(int8_t)yaw;
- (void) setGaz:(int8_t)gaz;
- (void) setFlag:(uint8_t)flag;

- (BOOL) sendEmergency;
- (BOOL) sendTakeoff;
- (BOOL) sendLanding;

@end

