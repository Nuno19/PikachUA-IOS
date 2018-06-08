//
//  BagViewController.m
//  MapTest
//
//  Created by students@deti on 11/05/18.
//  Copyright © 2018 pikachua@ua.pt. All rights reserved.
//

#import "BagViewController.h"

@interface BagViewController ()

@end

@implementation BagViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    self.ref = [[FIRDatabase database] reference];
    
    // Do any additional setup after loading the view.
    self.table.delegate=self;
    self.table.dataSource=self;
    
    //  [_collection registerClass:CollectionCell.class forCellWithReuseIdentifier:@"collectionCell"];
    
    
    
    NSFetchRequest *fetchRequest= [[NSFetchRequest alloc] initWithEntityName:@"ItemInst"];
    
    NSSortDescriptor *sort = [[NSSortDescriptor alloc] initWithKey:@"id" ascending:YES];
    
    [fetchRequest setSortDescriptors:@[sort]];
    
    
    self.employeeTable = [[_appDelegate.managedObjectContext executeFetchRequest:fetchRequest error:nil] mutableCopy];
    
    NSLog(@"count=%ld", (unsigned long)self.employeeTable.count);
    
    _totalItems.text = [NSString stringWithFormat:@"Total: %lu/200",(unsigned long)_employeeTable.count];
    
    //[_table.tableViewLayout invalidateLayout];
    [_table reloadData];
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
        return self.employeeTable.count;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated./Users/studentsdeti/Documents/MapTest/NSManagedObject+Pokemon.h
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    TableCell *cell = [_table dequeueReusableCellWithIdentifier:@"tableCell" forIndexPath: indexPath];
    
    NSLog(@"%@", indexPath);
    ItemInst *item = self.employeeTable[indexPath.row];
    NSString *total = [NSString stringWithFormat:@"%d  ",item.amount];
    NSString *name = item.name;
    NSString *itemDescription = item.descriptions;
    UIImage *image = [UIImage imageNamed:name];
    
    
    [cell displayContent:image: name : itemDescription: total];
    //cell.pokemonName.text = name;
    //cell.pokemonImage.image = image;
    
    NSLog(@"%@", name);
    return cell;
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