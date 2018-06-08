//
//  StorageViewController.h
//  MapTest
//
//  Created by students@deti on 11/05/18.
//  Copyright © 2018 pikachua@ua.pt. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import <CoreData/CoreData.h>
#import "PokemonInst+CoreDataClass.h"
#import "CollectionCell.h"
#import "MonsterBioController.h"

@import Firebase;

@interface StorageViewController : UIViewController <UICollectionViewDelegate,UICollectionViewDataSource>

@property (nonatomic, strong) AppDelegate *appDelegate;
@property (weak, nonatomic) IBOutlet UITextField *search;
@property (weak, nonatomic) IBOutlet UILabel *totalPokemon;
@property (weak, nonatomic) IBOutlet UILabel *selectedPokemon;
@property (retain,nonatomic) NSMutableArray *employeeCollection;
@property (nonatomic) NSInteger selectedRow;


@property (strong,nonatomic) FIRDatabaseReference *ref;


@property (weak, nonatomic) IBOutlet UICollectionView *collection;

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender;
- (IBAction)transfer:(id)sender;
- (IBAction)trade:(id)sender;

@end
