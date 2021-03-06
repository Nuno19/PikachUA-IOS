//
//  CatchViewController.h
//  MapTest
//
//  Created by students@deti on 11/05/18.
//  Copyright © 2018 pikachua@ua.pt. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Pokedex+CoreDataClass.h"
#import "PokemonInst+CoreDataClass.h"
#import "ItemInst+CoreDataClass.h"
#import "AppDelegate.h"
#import "MonsterBioController.h"

@interface CatchViewController : UIViewController

@property (nonatomic, strong) AppDelegate *appDelegate;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *cp;
@property (weak, nonatomic) IBOutlet UIImageView *image;
@property (weak, nonatomic) IBOutlet UIButton *catching;
@property (weak, nonatomic) IBOutlet UILabel *message;

@property (strong,nonatomic) FIRDatabaseReference *ref;

@property (nonnull) NSString *pokemon_name;
@property (nonnull) NSString *id;

@property (retain,nonatomic) Pokedex *pokemon;
@property (retain,nonatomic) ItemInst *item;

- (IBAction)doAction:(id)sender;

@end
