//
//  CollectionUIController.h
//  MapTest
//
//  Created by students@deti on 11/05/18.
//  Copyright © 2018 pikachua@ua.pt. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import <CoreData/CoreData.h>
#import "Pokemon+CoreDataClass.h"
#import "CollectionViewCell.h"
@import Firebase;

@interface CollectionUIController : UIViewController<UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) AppDelegate *appDelegate;
@property (weak, nonatomic) IBOutlet UILabel *totalPokemon;
@property (weak, nonatomic) IBOutlet UILabel *selectedPokemon;
@property (retain,nonatomic) NSMutableArray *employeeCollection;

@property (strong,nonatomic) FIRDatabaseReference *ref;

@property (weak, nonatomic) IBOutlet UICollectionView *collection;

@end
