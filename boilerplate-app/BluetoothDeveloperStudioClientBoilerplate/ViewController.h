//
//  ViewController.h
//  BLE_Application
//

#import <UIKit/UIKit.h>
#import <CoreBluetooth/CoreBluetooth.h>
#import "CharacteristicHelper.h"

@interface ViewController : UIViewController<UITableViewDelegate, UITableViewDataSource, CBCentralManagerDelegate, CBPeripheralDelegate>

@property (strong, nonatomic) CBCentralManager* centralManager;

@property (weak, nonatomic) IBOutlet UIButton *btn_scan;

@property (weak, nonatomic) IBOutlet UITableView *tbl_data;

@property (strong, nonatomic) CBPeripheral* selected;

@property (strong, nonatomic) NSMutableArray *peripherals;

- (IBAction)btn_scan:(id)sender;

@end