# Bluetooth Developer Studio iOS Client Plugin

Learn how to write a Bluetooth LE client application to connect to any hardware using our plugin. Update the application and use the plugin to handle any changes to the hardware profile.

The plugin is for the new tool by Bluetooth, [Bluetooth Developer Studio](http://www.bluetooth.com/SiteCollectionDocuments/developer-studio/bluetooth-developer-studio.aspx). This plugin allows you to read the profiles for a iOS client. The client we provide is basic and simply connects to a device, the device's profile and logs the characteristics to the terminal.

At the highest level, the plugin makes the code in the 'boilerplate-app' work with the profile you have built in Bluetooth Developer Studio. It operates on the CharacteristicHelper.m file which lists all characteristics for a given profile.

Here is CharacteristicHelper.m having been setup for a Health Thermometer (the default setting for the boilerplate).

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

Here is CharacteristicHelper after the plugin has run for Blood Pressure:

    #import "CharacteristicHelper.h"
    #import "Characteristic.h"

    @implementation CharacteristicHelper

    +(NSDictionary *)getCharacteristics
    {
        return @{
      
          @"2A35" : [[Characteristic alloc] initWithName:@"Blood Pressure Measurement"   
                                        ReadProperty:@"Excluded" 
                                        NotifyProperty:@"Excluded" 
                                        IndicateProperty:@"Mandatory"],
      
          @"2A36" : [[Characteristic alloc] initWithName:@"Intermediate Cuff Pressure"   
                                        ReadProperty:@"Excluded" 
                                        NotifyProperty:@"Mandatory" 
                                        IndicateProperty:@"Excluded"],
      
          @"2A49" : [[Characteristic alloc] initWithName:@"Blood Pressure Feature"   
                                        ReadProperty:@"Mandatory" 
                                        NotifyProperty:@"Excluded" 
                                        IndicateProperty:@"Excluded"],
      
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

# Tutorial

## Run and test the boilerplate

Identify a Bluetooth device you would like to test or install a simulator such as [BlueSim](https://github.com/AttackPattern/BlueSim). The boilerplate tests a Health Thermometer out of the box, and BlueSim has a Health Thermometer simulator which has been tested with our boilerplate. To test our app prior to using the plugin to update the profile, install BlueSim and turn on the Health Thermometer.

Open the xcode project inside './boilerplate-app'.

Run the app on a real device with Bluetooth LE available and enabled (you will need to update the Bundle Identifier to your own wildcard).

Press scan to view a list of available devices. 

Locate the device with the Health Thermometer if you have one and touch the item.

The Xcode console will print out the characteristics of the Health Thermometer.

To see how this works, view the files CharacteristicHelper.m and ViewController.m.

CharacteristicHelper contains all the UUIDs and properties ViewController needs to interpret the Health Thermometer profile. Now you can use Bluetooth Developer Studio to update CharacteristicHelper with your desired profile.

## Install the plugin

Download and install [Bluetooth Developer Studio](http://www.bluetooth.com/SiteCollectionDocuments/developer-studio/bluetooth-developer-studio.aspx).

The plugin folder is located inside './plugin' and is called 'mm-ios-client'. Follow the instructions on installing plugins with Bluetooth Developer Studio and install mm-ios-client.

## Run the plugin and update the boilerplate

Update your profile to one you would like to use. If you are just using this plugin to test Bluetooth Developer Studio, try Heart Rate Monitor. BlueSim has a Heart Rate Monitor simulator you can use which we have tested with our app.

Follow the instructions with Bluetooth Developer Studio to run the plugin and get the output CharacteristicHelper.m file.

CharacteristicHelper.m should now have all the details for a Heart Rate Monitor.

Copy CharacteristicHelper.m into '{location of boilerplate app}/BluetoothDeveloperStudioClientBoilerplate', overwriting the existing file.

Run the app on a real device with Bluetooth LE available and enabled.

Press scan to view a list of available devices. 

Locate the device with the Heart Rate Monitor if you are testing this profile and touch the item.

The Xcode console will now print out the characteristics of the Heart Rate Monitor.

## Next steps

Now you have a system in place that allows you to evolve the code in the boilerplate, providing you don't edit CharacteristicHelper.m. You can continue to use Bluetooth Developer Studio to edit your profile, and run the plugin to get those updates in your app.
