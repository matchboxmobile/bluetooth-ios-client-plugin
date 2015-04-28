//
//  ViewController.m
//  BLE_Application
//

#import "ViewController.h"
#import "Characteristic.h"

@interface ViewController ()
@end

@implementation ViewController

@synthesize centralManager;
@synthesize selected;
@synthesize peripherals;

#pragma mark Characteristics

// This is the bit to focus on

// This method is called when a characteristic is discovered on a service, so this will be called for each characteristic
-(void)peripheral:(CBPeripheral *)peripheral didDiscoverCharacteristicsForService:(CBService *)service error:(NSError *)error
{
    
    for (CBCharacteristic *characteristic in service.characteristics) {
    
        // Pull out the characteristic
        
        
        NSDictionary *characteristicList = [CharacteristicHelper getCharacteristics];
        Characteristic *characteristicDetails = [characteristicList valueForKey:characteristic.UUID.UUIDString];
        
        if (characteristicDetails) {
            
            // 1. Write out the characteristic name to prove we know it
            NSLog(@"\n\nFound %@ characteristic\n\n", characteristicDetails.Name);
            
            // 2. Read the value if the characteristic property is Read, or subscribe if it is indicate
            
            
            if ([characteristicDetails.ReadProperty isEqualToString:@"Mandatory"]) {
                
                [peripheral readValueForCharacteristic:characteristic];

            } else if ([characteristicDetails.NotifyProperty isEqualToString:@"Mandatory"]
                       || [characteristicDetails.IndicateProperty isEqualToString:@"Mandatory"]) {
            
                [peripheral setNotifyValue:YES forCharacteristic:characteristic];
            
            }
            
        }

    }// end for

    
}

// This method is called when the characteristic property has been read
-(void)peripheral:(CBPeripheral *)peripheral didUpdateValueForCharacteristic:(CBCharacteristic *)characteristic error:(NSError *)error
{
    [self logTheValueForCharacteristic:characteristic error:error];
}

// This method is called when the characteristic has issued an update from a subscription
- (void)peripheral:(CBPeripheral *)peripheral didUpdateNotificationStateForCharacteristic:(CBCharacteristic *)characteristic error:(NSError *)error
{
    [self logTheValueForCharacteristic:characteristic error:error];
}

// Both methods above call this one to print out the value
- (void)logTheValueForCharacteristic:(CBCharacteristic *)characteristic error:(NSError *)error
{
    // Pull out the characteristic
    NSDictionary *characteristicList = [CharacteristicHelper getCharacteristics];
    Characteristic *characteristicDetails = [characteristicList valueForKey:characteristic.UUID.UUIDString];

    NSLog(@"\n\n%@\n%@\n\n", characteristicDetails.Name, characteristic.value);
    
}




// Boilerplate not relevant to this example

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.centralManager = [[CBCentralManager alloc] initWithDelegate:self queue:nil];
    
    [self.tbl_data setDelegate:self];
    [self.tbl_data setDataSource: self];
    
    [self.btn_scan setEnabled:false];
    
    self.peripherals = [[NSMutableArray alloc] init];


}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark Scanning

// Scanning for peripherals - this part is not relevant

- (IBAction)btn_scan:(id)sender {

    [self.btn_scan setEnabled:false];
    
    [self.centralManager scanForPeripheralsWithServices:nil options:nil];
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.peripherals count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if(cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    CBPeripheral * peripheral = (CBPeripheral *)[self.peripherals objectAtIndex:indexPath.row];
    if (peripheral.name != NULL) {
        cell.textLabel.text = peripheral.name;
    } else {
        cell.textLabel.text = @"NULL";
    }
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    CBPeripheral *peripheral = (CBPeripheral *)[self.peripherals objectAtIndex:indexPath.row];
    self.selected = peripheral;
    
    [self.centralManager stopScan];
    [self.btn_scan setEnabled:TRUE];
    
    [self.centralManager connectPeripheral:self.selected options:nil];
}
-(void)centralManagerDidUpdateState:(CBCentralManager *)central {
    if (central.state == CBCentralManagerStatePoweredOn) {
        [self.btn_scan setEnabled:TRUE];
    } else {
        [self.btn_scan setEnabled:FALSE];
    }
}
-(void)centralManager:(CBCentralManager *)central didDiscoverPeripheral:(CBPeripheral *)peripheral advertisementData:(NSDictionary *)advertisementData RSSI:(NSNumber *)RSSI
{
    //NSLog(@"Discovered %@", peripheral.name);
    
    for(int i = 0; i < self.peripherals.count; i++) {
        CBPeripheral *currentPeripheral = [self.peripherals objectAtIndex:i];
        if (currentPeripheral.name == peripheral.name) {
            [self.peripherals replaceObjectAtIndex:i withObject:peripheral];
            //NSLog(@"Duplicate, updating %@", peripheral.name);
            [self.tbl_data reloadData];
            return;
        }
    }
    [self.peripherals addObject:peripheral];
    //NSLog(@"Adding %@", peripheral.name);
    [self.tbl_data reloadData];
}
-(void)centralManager:(CBCentralManager *)central didConnectPeripheral:(CBPeripheral *)peripheral
{
    NSLog(@"Connected");
    [peripheral setDelegate:self];
    [peripheral discoverServices:nil];
}
-(void)centralManager:(CBCentralManager *)central didDisconnectPeripheral:(CBPeripheral *)peripheral error:(NSError *)error
{
    NSLog(@"%@", error);
}
-(void)centralManager:(CBCentralManager *)central didFailToConnectPeripheral:(CBPeripheral *)peripheral error:(NSError *)error
{
    NSLog(@"%@", error);
}

#pragma mark Services

// Not relevant
-(void)peripheral:(CBPeripheral *)peripheral didDiscoverServices:(NSError *)error
{
    for(int i = 0; i < peripheral.services.count; i++) {
        CBService * service = [peripheral.services objectAtIndex:i];
        [peripheral discoverCharacteristics:nil forService:service];
    }
}

@end
