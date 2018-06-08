//
//  MonsterBioViewController.h
//  MapTest
//
//  Created by students@deti on 11/05/18.
//  Copyright © 2018 pikachua@ua.pt. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MultipeerConnectivity/MultipeerConnectivity.h>
#import "AppDelegate.h"

@interface TradeViewController : UIViewController <MCBrowserViewControllerDelegate>



@property (nonatomic, strong) AppDelegate *appDelegate;
@property (weak, nonatomic) IBOutlet UISwitch *swVisible;
@property (weak, nonatomic) IBOutlet UITableView *tblConnectedDevices;
@property (weak, nonatomic) IBOutlet UIButton *btnDisconnect;
@property (weak, nonatomic) IBOutlet UILabel *testText;


- (IBAction)browseForDevices:(id)sender;
- (IBAction)disconnect:(id)sender;
- (IBAction)toggleVisibility:(id)sender;
- (IBAction)sendText:(id)sender;

@end
