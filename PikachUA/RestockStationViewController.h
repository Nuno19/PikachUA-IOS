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
@property (weak, nonatomic) IBOutlet UILabel *itemName1;
@property (weak, nonatomic) IBOutlet UIImageView *itemImage1;
@property (weak, nonatomic) IBOutlet UILabel *itemName2;
@property (weak, nonatomic) IBOutlet UIImageView *itemImage2;
@property (weak, nonatomic) IBOutlet UILabel *itemName3;
@property (weak, nonatomic) IBOutlet UIImageView *itemImage3;

@property (strong,nonatomic) FIRDatabaseReference *ref;

@property (retain,nonatomic) ItemInst *item;

- (IBAction)doAction:(id)sender;

@end
