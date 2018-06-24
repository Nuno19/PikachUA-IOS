//
//  MonsterBioController.h
//  PikachUA
//
//  Created by students@deti on 07/06/18.
//  Copyright © 2018 pikachua@ua.pt. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Pokedex+CoreDataClass.h"
#import "PokemonInst+CoreDataClass.h"
#import "AppDelegate.h"
#import "TradeViewController.h"

@import Firebase;

@interface MonsterBioController : UIViewController
- (IBAction)trade:(id)sender;

@property (nonatomic, strong) AppDelegate *appDelegate;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *cp;
@property (weak, nonatomic) IBOutlet UIImageView *image;
@property (weak, nonatomic) IBOutlet UILabel *height;
@property (weak, nonatomic) IBOutlet UILabel *weight;
@property (weak, nonatomic) IBOutlet UILabel *pokedex;
@property (weak, nonatomic) IBOutlet UILabel *nickname;

@property (strong,nonatomic) FIRDatabaseReference *ref;


@property (retain,nonatomic) PokemonInst *pokemon;
@property (retain,nonatomic) Pokedex *poked;

@property (weak, nonatomic) IBOutlet UIButton *transfer;

- (IBAction)transferAction:(id)sender;
@end
