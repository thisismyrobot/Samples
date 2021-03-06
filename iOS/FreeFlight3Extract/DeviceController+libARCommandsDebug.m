/*
    Copyright (C) 2014 Parrot SA

    Redistribution and use in source and binary forms, with or without
    modification, are permitted provided that the following conditions
    are met:
    * Redistributions of source code must retain the above copyright
      notice, this list of conditions and the following disclaimer.
    * Redistributions in binary form must reproduce the above copyright
      notice, this list of conditions and the following disclaimer in
      the documentation and/or other materials provided with the 
      distribution.
    * Neither the name of Parrot nor the names
      of its contributors may be used to endorse or promote products
      derived from this software without specific prior written
      permission.

    THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
    "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
    LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS
    FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE
    COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,
    INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING,
    BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS
    OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED 
    AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
    OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT
    OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
    SUCH DAMAGE.
*/
/**********************************************************
 *            AUTOGENERATED FILE                          *
 *             DO NOT MODIFY IT                           *
 *                                                        *
 * To add new commands :                                  *
 *  - Modify ../Xml/commands.xml file                     *
 *  - Re-run generateDeviceControllerCategories.py script *
 *                                                        *
 **********************************************************/
#import <libARSAL/ARSAL.h>
#import "DeviceControllerProtected.h"
#import "DeviceController+libARCommandsDebug.h"
#ifdef ARCOMMANDS_HAS_DEBUG_COMMANDS

NSString *const DeviceControllerStatsEventSendPacketNotification = @"DeviceControllerStatsEventSendPacketNotification";
NSString *const DeviceControllerStatsEventSendPacketNotificationPacketKey = @"DeviceControllerStatsEventSendPacketNotificationPacketKey";

@implementation DeviceController (libARCommandsDebug)
const char *DeviceControllerDebug_TAG = " DeviceController";

#pragma mark static C callback
static void commondebug_statsevent_sendpacket_callback(char * packet, void *custom)
{
    DeviceController *self = (__bridge DeviceController*)custom;
    NSDictionary* dict = [NSDictionary dictionaryWithObjects:@[[NSString stringWithCString:packet encoding:NSUTF8StringEncoding]] forKeys:@[DeviceControllerStatsEventSendPacketNotificationPacketKey]];
    [[NSNotificationCenter defaultCenter] postNotificationName:DeviceControllerStatsEventSendPacketNotification object:self userInfo:dict];
}


- (void)registerCommonDebugARCommandsCallbacks
{
    // Command class StatsEvent
    ARCOMMANDS_Decoder_SetCommonDebugStatsEventSendPacketCallback(commondebug_statsevent_sendpacket_callback, (__bridge void *)(self));
}

- (void)unregisterCommonDebugARCommandsCallbacks
{
    // Command class StatsEvent
    ARCOMMANDS_Decoder_SetCommonDebugStatsEventSendPacketCallback(NULL, NULL);
}

#pragma mark ARCommands sending function 
    // Command class Stats
- (BOOL)DeviceController_SendStatsSendPacket:(int)bufferId withSendPolicy:(eARNETWORK_SEND_POLICY)policy withCompletionBlock:(DeviceControllerCompletionBlock)completionBlock withPacket:(char *)packet
{
    u_int8_t cmdbuf[128];
    int32_t actualSize = 0;
    eARCOMMANDS_GENERATOR_ERROR cmdError;
    BOOL sentStatus;

    // Send SendPacket command
    sentStatus = NO;
    cmdError = ARCOMMANDS_Generator_GenerateCommonDebugStatsSendPacket(cmdbuf, sizeof(cmdbuf), &actualSize, packet);
    if (cmdError == ARCOMMANDS_GENERATOR_OK)
    {
        sentStatus = [self sendData:cmdbuf withSize:actualSize onBufferWithId:bufferId withSendPolicy:policy withCompletionBlock:completionBlock];
    }
    if (!sentStatus)
    {
        ARSAL_PRINT(ARSAL_PRINT_ERROR, DeviceControllerDebug_TAG, "Failed to send SendPacket command.");
    }

    return sentStatus;
}
- (BOOL)DeviceController_SendStatsStartSendingPacketFromDrone:(int)bufferId withSendPolicy:(eARNETWORK_SEND_POLICY)policy withCompletionBlock:(DeviceControllerCompletionBlock)completionBlock withFrequency:(uint8_t)frequency withPacketSize:(uint8_t)packetSize withDate:(uint32_t)date
{
    u_int8_t cmdbuf[128];
    int32_t actualSize = 0;
    eARCOMMANDS_GENERATOR_ERROR cmdError;
    BOOL sentStatus;

    // Send StartSendingPacketFromDrone command
    sentStatus = NO;
    cmdError = ARCOMMANDS_Generator_GenerateCommonDebugStatsStartSendingPacketFromDrone(cmdbuf, sizeof(cmdbuf), &actualSize, frequency, packetSize, date);
    if (cmdError == ARCOMMANDS_GENERATOR_OK)
    {
        sentStatus = [self sendData:cmdbuf withSize:actualSize onBufferWithId:bufferId withSendPolicy:policy withCompletionBlock:completionBlock];
    }
    if (!sentStatus)
    {
        ARSAL_PRINT(ARSAL_PRINT_ERROR, DeviceControllerDebug_TAG, "Failed to send StartSendingPacketFromDrone command.");
    }

    return sentStatus;
}
- (BOOL)DeviceController_SendStatsStopSendingPacketFromDrone:(int)bufferId withSendPolicy:(eARNETWORK_SEND_POLICY)policy withCompletionBlock:(DeviceControllerCompletionBlock)completionBlock
{
    u_int8_t cmdbuf[128];
    int32_t actualSize = 0;
    eARCOMMANDS_GENERATOR_ERROR cmdError;
    BOOL sentStatus;

    // Send StopSendingPacketFromDrone command
    sentStatus = NO;
    cmdError = ARCOMMANDS_Generator_GenerateCommonDebugStatsStopSendingPacketFromDrone(cmdbuf, sizeof(cmdbuf), &actualSize);
    if (cmdError == ARCOMMANDS_GENERATOR_OK)
    {
        sentStatus = [self sendData:cmdbuf withSize:actualSize onBufferWithId:bufferId withSendPolicy:policy withCompletionBlock:completionBlock];
    }
    if (!sentStatus)
    {
        ARSAL_PRINT(ARSAL_PRINT_ERROR, DeviceControllerDebug_TAG, "Failed to send StopSendingPacketFromDrone command.");
    }

    return sentStatus;
}
@end

#endif // ARCOMMANDS_HAS_DEBUG_COMMANDS
// END GENERATED CODE
