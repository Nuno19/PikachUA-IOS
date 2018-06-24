//
//  RemoveItemsViewController.h
//  MapTest
//
//  Created by students@deti on 11/05/18.
//  Copyright © 2018 pikachua@ua.pt. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ItemInst+CoreDataClass.h"
#import "AppDelegate.h"

@interface RemoveItemsViewController : UIViewController

@property (nonatomic, strong) AppDelegate *appDelegate;
@property (weak, nonatomic) IBOutlet UIImageView *imageItem;
@property (weak, nonatomic) IBOutlet UITextField *amount;
@property (weak, nonatomic) IBOutlet UIButton *deleteButton;

@property (strong,nonatomic) FIRDatabaseReference *ref;

@property (retain,nonatomic) ItemInst *item;

- (IBAction)deleteAction:(id)sender;

@end
