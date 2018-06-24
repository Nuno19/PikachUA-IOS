//
//  ReceiveTradeViewController.h
//  FirebaseCore
//
//  Created by students@deti on 24/06/2018.
//

#import <UIKit/UIKit.h>
#import <MultipeerConnectivity/MultipeerConnectivity.h>
#import "AppDelegate.h"
#import "PokemonInst+CoreDataClass.h"

@interface ReceiveTradeViewController : UIViewController <MCBrowserViewControllerDelegate>

@property (nonatomic, strong) AppDelegate *appDelegate;

@property (retain,nonatomic) PokemonInst *pokemon;
@property (weak, nonatomic) IBOutlet UISwitch *swVisible;
@property (weak, nonatomic) IBOutlet UITableView *tblConnectedDevices;
@property (weak, nonatomic) IBOutlet UIButton *btnDisconnect;


- (IBAction)browseForDevices:(id)sender;
- (IBAction)disconnect:(id)sender;
- (IBAction)toggleVisibility:(id)sender;

@end
