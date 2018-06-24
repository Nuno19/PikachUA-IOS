//
//  RestockStationViewController.h
//  MapTest
//
//  Created by students@deti on 11/05/18.
//  Copyright © 2018 pikachua@ua.pt. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ItemInst+CoreDataClass.h"
#import "AppDelegate.h"

@interface RestockStationViewController : UIViewController

@property (nonatomic, strong) AppDelegate *appDelegate;
@property (weak, nonatomic) IBOutlet UIButton *click;

@property (strong,nonatomic) FIRDatabaseReference *ref;

@property (retain,nonatomic) ItemInst *item;

- (IBAction)doAction:(id)sender;

@end
