//
//  RemoveItemsViewController.m
//  MapTest
//
//  Created by students@deti on 11/05/18.
//  Copyright © 2018 pikachua@ua.pt. All rights reserved.
//

#import "RemoveItemsViewController.h"

@interface RemoveItemsViewController ()

@end

@implementation RemoveItemsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    NSFetchRequest *fetchRequest= [[NSFetchRequest alloc] initWithEntityName:@"ItemInst"];
    
    [fetchRequest setPredicate:[NSPredicate predicateWithFormat:@"name == %@",_item.name] ];
    
    _item = [[_appDelegate.managedObjectContext executeFetchRequest:fetchRequest error:nil ] mutableCopy][0];
    
    _imageItem.image = [UIImage imageNamed:_item.name];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)deleteAction:(id)sender {
    
    _appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    NSFetchRequest *fetchRequest= [[NSFetchRequest alloc] initWithEntityName:@"ItemInst"];
    
    [fetchRequest setPredicate:[NSPredicate predicateWithFormat:@"name == %@",_item.name] ];
    
    _item = [[_appDelegate.managedObjectContext executeFetchRequest:fetchRequest error:nil ] mutableCopy][0];
    
    if ([_amount.text intValue] <= _item.amount && [_amount.text intValue] > 0){
        _item.amount=_item.amount-[_amount.text intValue];
        [_appDelegate saveContext];
        UINavigationController *navigationController = self.navigationController;
        [navigationController popViewControllerAnimated:NO];
        [navigationController popViewControllerAnimated:NO];
        [navigationController popViewControllerAnimated:YES];
    }
}
@end
