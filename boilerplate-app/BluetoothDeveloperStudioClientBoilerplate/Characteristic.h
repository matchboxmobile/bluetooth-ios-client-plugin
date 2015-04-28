//
//  Characteristic.h
//  BLE_Application
//

#import <Foundation/Foundation.h>

@interface Characteristic : NSObject {

}

@property NSString *Name;
@property NSString *ReadProperty;
@property NSString *NotifyProperty;
@property NSString *IndicateProperty;

- (id)initWithName:(NSString *)name ReadProperty:(NSString *)readProperty NotifyProperty:(NSString *)notifyProperty IndicateProperty:(NSString *)indicateProperty;

@end