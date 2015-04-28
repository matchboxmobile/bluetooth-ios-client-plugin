//
//  CharacteristicHelper.m
//  BLE_Application
//

#import "CharacteristicHelper.h"
#import "Characteristic.h"

@implementation CharacteristicHelper

+(NSDictionary *)getCharacteristics
{
    return @{
      
      @"2A1C" : [[Characteristic alloc] initWithName:@"Temperature Measurement"   
                                    ReadProperty:@"Excluded" 
                                    NotifyProperty:@"Excluded" 
                                    IndicateProperty:@"Mandatory"],
      
      @"2A1D" : [[Characteristic alloc] initWithName:@"Temperature Type"   
                                    ReadProperty:@"Mandatory" 
                                    NotifyProperty:@"Excluded" 
                                    IndicateProperty:@"Excluded"],
      
      @"2A1E" : [[Characteristic alloc] initWithName:@"Intermediate Temperature"   
                                    ReadProperty:@"Excluded" 
                                    NotifyProperty:@"Mandatory" 
                                    IndicateProperty:@"Excluded"],
      
      @"2A21" : [[Characteristic alloc] initWithName:@"Measurement Interval"   
                                    ReadProperty:@"Mandatory" 
                                    NotifyProperty:@"Excluded" 
                                    IndicateProperty:@"Optional"],
      
      @"2A29" : [[Characteristic alloc] initWithName:@"Manufacturer Name String"   
                                    ReadProperty:@"Mandatory" 
                                    NotifyProperty:@"Excluded" 
                                    IndicateProperty:@"Excluded"],
      
      @"2A24" : [[Characteristic alloc] initWithName:@"Model Number String"   
                                    ReadProperty:@"Mandatory" 
                                    NotifyProperty:@"Excluded" 
                                    IndicateProperty:@"Excluded"],
      
      @"2A25" : [[Characteristic alloc] initWithName:@"Serial Number String"   
                                    ReadProperty:@"Mandatory" 
                                    NotifyProperty:@"Excluded" 
                                    IndicateProperty:@"Excluded"],
      
      @"2A27" : [[Characteristic alloc] initWithName:@"Hardware Revision String"   
                                    ReadProperty:@"Mandatory" 
                                    NotifyProperty:@"Excluded" 
                                    IndicateProperty:@"Excluded"],
      
      @"2A26" : [[Characteristic alloc] initWithName:@"Firmware Revision String"   
                                    ReadProperty:@"Mandatory" 
                                    NotifyProperty:@"Excluded" 
                                    IndicateProperty:@"Excluded"],
      
      @"2A28" : [[Characteristic alloc] initWithName:@"Software Revision String"   
                                    ReadProperty:@"Mandatory" 
                                    NotifyProperty:@"Excluded" 
                                    IndicateProperty:@"Excluded"],
      
      @"2A23" : [[Characteristic alloc] initWithName:@"System ID"   
                                    ReadProperty:@"Mandatory" 
                                    NotifyProperty:@"Excluded" 
                                    IndicateProperty:@"Excluded"],
      
      @"2A2A" : [[Characteristic alloc] initWithName:@"IEEE 11073-20601 Regulatory Certification Data List"   
                                    ReadProperty:@"Mandatory" 
                                    NotifyProperty:@"Excluded" 
                                    IndicateProperty:@"Excluded"],
      
      @"2A50" : [[Characteristic alloc] initWithName:@"PnP ID"   
                                    ReadProperty:@"Mandatory" 
                                    NotifyProperty:@"Excluded" 
                                    IndicateProperty:@"Excluded"],
    };
}

@end

  