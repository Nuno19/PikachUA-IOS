//
//  CollectionUIController.m
//  MapTest
//
//  Created by students@deti on 11/05/18.
//  Copyright © 2018 pikachua@ua.pt. All rights reserved.
//

#import "CollectionUIController.h"

@interface CollectionUIController ()

@end

@implementation CollectionUIController

- (void)viewDidLoad {
    [super viewDidLoad];
    _appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    self.ref = [[FIRDatabase database] reference];
    
    // Do any additional setup after loading the view.
    self.collection.delegate=self;
    self.collection.dataSource=self;
    
    //  [_collection registerClass:CollectionCell.class forCellWithReuseIdentifier:@"collectionCell"];
    
    
    
    NSFetchRequest *fetchRequest= [[NSFetchRequest alloc] initWithEntityName:@"Pokemon"];
    
    NSSortDescriptor *sort = [[NSSortDescriptor alloc] initWithKey:@"id" ascending:YES];
    
    [fetchRequest setSortDescriptors:@[sort]];
    
    
    self.employeeCollection = [[_appDelegate.managedObjectContext executeFetchRequest:fetchRequest error:nil] mutableCopy];
    
    NSLog(@"count=%ld", (unsigned long)self.employeeCollection.count);
    
    _totalPokemon.text = [NSString stringWithFormat:@"Total: %lu/12",(unsigned long)_employeeCollection.count];
    
    [_collection.collectionViewLayout invalidateLayout];
    [_collection reloadData];
    
}

-(void)viewDidAppear:(BOOL)animated{
    NSFetchRequest *fetchRequest= [[NSFetchRequest alloc] initWithEntityName:@"Pokemon"];
    
    NSSortDescriptor *sort = [[NSSortDescriptor alloc] initWithKey:@"id" ascending:YES];
    
    [fetchRequest setSortDescriptors:@[sort]];
    
    
    self.employeeCollection = [[_appDelegate.managedObjectContext executeFetchRequest:fetchRequest error:nil] mutableCopy];
    
    NSLog(@"count=%ld", (unsigned long)self.employeeCollection.count);
    
    _totalPokemon.text = [NSString stringWithFormat:@"Total: %lu/12",(unsigned long)_employeeCollection.count];
    
    [_collection.collectionViewLayout invalidateLayout];
    [_collection reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated./Users/studentsdeti/Documents/MapTest/NSManagedObject+Pokemon.h
}


-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return _employeeCollection.count;
}


-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    CollectionViewCell *cell = [_collection dequeueReusableCellWithReuseIdentifier:@"Pokedex" forIndexPath:indexPath];
    
    NSLog(@"%@", indexPath);
    Pokemon *poke = self.employeeCollection[indexPath.row];
    UIImage *image = [UIImage imageNamed:poke.name];
    
    [cell displayContent:image];
    //cell.pokemonName.text = name;
    //cell.pokemonImage.image = image;

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
