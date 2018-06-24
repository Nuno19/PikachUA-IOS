//
//  BagViewController.h
//  MapTest
//
//  Created by students@deti on 11/05/18.
//  Copyright © 2018 pikachua@ua.pt. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import <CoreData/CoreData.h>
#import "ItemInst+CoreDataClass.h"
#import "TableCell.h"
#import "RemoveItemsViewController.h"
@import Firebase;

@interface BagViewController : UIViewController <UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) AppDelegate *appDelegate;
@property (weak, nonatomic) IBOutlet UILabel *totalItems;
@property (weak, nonatomic) IBOutlet UILabel *selectedItem;
@property (retain,nonatomic) NSMutableArray *employeeTable;
@property (nonatomic) NSInteger selectedRow;

@property (strong,nonatomic) FIRDatabaseReference *ref;

@property (weak, nonatomic) IBOutlet UITableView *table;

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender;

@end
