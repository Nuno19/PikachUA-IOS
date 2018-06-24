//
//  StorageViewController.m
//  MapTest
//
//  Created by students@deti on 11/05/18.
//  Copyright © 2018 pikachua@ua.pt. All rights reserved.
//

#import "StorageViewController.h"


@interface StorageViewController ()

@end

@implementation StorageViewController

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidLoad];
    
    _appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    self.ref = [[FIRDatabase database] reference];
    
    // Do any additional setup after loading the view.
    self.collection.delegate=self;
    self.collection.dataSource=self;
    
    //  [_collection registerClass:CollectionCell.class forCellWithReuseIdentifier:@"collectionCell"];
    
    
    
    NSFetchRequest *fetchRequest= [[NSFetchRequest alloc] initWithEntityName:@"PokemonInst"];
    
    NSSortDescriptor *sort = [[NSSortDescriptor alloc] initWithKey:@"id" ascending:YES];
    
    [fetchRequest setSortDescriptors:@[sort]];
    
    
    self.employeeCollection = [[_appDelegate.managedObjectContext executeFetchRequest:fetchRequest error:nil ] mutableCopy];
    
    NSLog(@"count=%ld", (unsigned long)self.employeeCollection.count);
    
    _totalPokemon.text = [NSString stringWithFormat:@"Total: %lu/200",(unsigned long)_employeeCollection.count];
    
    [_collection.collectionViewLayout invalidateLayout];
    [_collection reloadData];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    self.ref = [[FIRDatabase database] reference];
    
    // Do any additional setup after loading the view.
    self.collection.delegate=self;
    self.collection.dataSource=self;
    
  //  [_collection registerClass:CollectionCell.class forCellWithReuseIdentifier:@"collectionCell"];
    
    
    
    NSFetchRequest *fetchRequest= [[NSFetchRequest alloc] initWithEntityName:@"PokemonInst"];
    
    NSSortDescriptor *sort = [[NSSortDescriptor alloc] initWithKey:@"id" ascending:YES];
    
    [fetchRequest setSortDescriptors:@[sort]];
    
    
    self.employeeCollection = [[_appDelegate.managedObjectContext executeFetchRequest:fetchRequest error:nil ] mutableCopy];
    
    NSLog(@"count=%ld", (unsigned long)self.employeeCollection.count);
    
    _totalPokemon.text = [NSString stringWithFormat:@"Total: %lu/200",(unsigned long)_employeeCollection.count];
    
    [_collection.collectionViewLayout invalidateLayout];
    [_collection reloadData];

    }

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated./Users/studentsdeti/Documents/MapTest/NSManagedObject+Pokemon.h
}


-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return self.employeeCollection.count;
}


-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{

    CollectionCell *cell = [_collection dequeueReusableCellWithReuseIdentifier:@"collectionCell" forIndexPath:indexPath];
    
    NSLog(@"%@", indexPath);
    PokemonInst *poke = self.employeeCollection[indexPath.row];
    NSString *name = poke.nickname;
    NSString *cp = poke.value;
    UIImage *image = [UIImage imageNamed:name];
    
    [cell displayContent:image: name: cp];
    //cell.pokemonName.text = name;
    //cell.pokemonImage.image = image;
    
    NSLog(@"%@", name);
    return cell;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    _selectedRow = indexPath.row;
    NSLog(@"SR: %ld", (long)_selectedRow);
    
    //[self performSegueWithIdentifier:@"showDetailSegue" sender:self];
}



-(void)prepareForSegue :(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqualToString:@"showDetailSegue"]){
        _selectedRow = [_collection indexPathsForSelectedItems][0].row;
        MonsterBioController *controller = (MonsterBioController *)segue.destinationViewController;
        controller.pokemon = _employeeCollection[_selectedRow];
        NSLog(@"PFS");
    }
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
