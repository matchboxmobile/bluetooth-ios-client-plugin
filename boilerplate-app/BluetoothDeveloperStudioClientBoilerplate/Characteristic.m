//
//  Characteristic.m
//  BLE_Application
//

#import <Foundation/Foundation.h>
#import "Characteristic.h"

@implementation Characteristic

- (id)initWithName:(NSString *)name ReadProperty:(NSString *)readProperty NotifyProperty:(NSString *)notifyProperty IndicateProperty:(NSString *)indicateProperty {
    
    self = [super init];
    if (self) {
        self.Name = name;
        self.ReadProperty = readProperty;
        self.NotifyProperty = notifyProperty;
        self.IndicateProperty = indicateProperty;
    }
    
    return self;
    
}

@end
