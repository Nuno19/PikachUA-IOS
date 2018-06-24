//
//  RestockStationViewController.m
//  MapTest
//
//  Created by students@deti on 11/05/18.
//  Copyright © 2018 pikachua@ua.pt. All rights reserved.
//

#import "RestockStationViewController.h"

@interface RestockStationViewController ()

@end

@implementation RestockStationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)doAction:(id)sender {
    _appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    NSFetchRequest *fetchRequest= [[NSFetchRequest alloc] initWithEntityName:@"ItemInst"];
    
    NSInteger chance;
    NSString *itemName;
    
    for (int i = 0; i < 3; i++)
    {
        chance = arc4random() % 5;
        NSLog(@"%ld",(long)chance);
        if(chance == 0){
            itemName = @"Pokeball";
        }
        else if(chance == 1){
            itemName = @"Great Ball";
        }
        else if(chance == 2){
            itemName = @"Ultra Ball";
        }
        else if(chance == 3){
            itemName = @"Razz Berry";
        }
        else if(chance == 4){
            itemName = @"Golden Razz Berry";
        }
        [fetchRequest setPredicate:[NSPredicate predicateWithFormat:@"name == %@",itemName] ];
        
        _item = [[_appDelegate.managedObjectContext executeFetchRequest:fetchRequest error:nil ] mutableCopy][0];
        
        _item.amount=_item.amount+1;
        
        if (i == 0){
            _itemName1.text = itemName;
            _itemImage1.image = [UIImage imageNamed:itemName];
        }
        else if (i == 1){
            _itemName2.text = itemName;
            _itemImage2.image = [UIImage imageNamed:itemName];
        }
        else if (i == 2){
            _itemName3.text = itemName;
            _itemImage3.image = [UIImage imageNamed:itemName];
        }
        
    }
    
    _click.hidden=YES;
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
