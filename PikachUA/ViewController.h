//
//  ViewController.h
//  MapTest
//
//  Created by students@deti on 09/05/18.
//  Copyright © 2018 pikachua@ua.pt. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import <CoreLocation/CoreLocation.h>
#import <MapKit/Mapkit.h>
#import "PokemonInst+CoreDataClass.h"
#import "Pokemon+CoreDataClass.h"
#import "ItemInst+CoreDataClass.h"
#import "Pokedex+CoreDataClass.h"
#import "CatchViewController.h"
#import "RestockStationViewController.h"
@import Firebase;


@interface ViewController : UIViewController <CLLocationManagerDelegate,MKMapViewDelegate>


@property (weak, nonatomic) IBOutlet UILabel *longitudeLabel;
@property (weak, nonatomic) IBOutlet UILabel *latitudeLabel;
@property (weak, nonatomic) IBOutlet UILabel *steps;

@property (nonatomic, strong) AppDelegate *appDelegate;

@property (weak, nonatomic) IBOutlet UILabel *fireLabel;
@property (strong,nonatomic) FIRDatabaseReference *ref;
@property(strong, nonatomic) FIRFunctions *functions;

@property(strong, nonatomic) CLLocation *lastLoc;

@property(strong,nonnull)  NSMutableArray* pokemonAnotations;
@property(strong,nonnull)  NSMutableArray* pokestopAnotations;

@property (weak, nonatomic) IBOutlet MKMapView *map;

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender;

-(void) spawnPokemons;
@end
