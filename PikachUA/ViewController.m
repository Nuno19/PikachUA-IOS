//
//  ViewController.m
//  MapTest
//
//  Created by students@deti on 09/05/18.
//  Copyright © 2018 pikachua@ua.pt. All rights reserved.
//

#import "ViewController.h"
@import CoreData;

@interface ViewController ()

@end

@implementation ViewController
CLLocationManager *locationManager;

- (void)viewDidLoad {
    [super viewDidLoad];
    _ref = [[FIRDatabase database] reference];
    // Do any additional setup after loading the view, typically from a nib.
    locationManager = [[CLLocationManager alloc] init];
    [self getLocation];
    MKCoordinateSpan span = MKCoordinateSpanMake(0.005, 0.005);
    CLLocationCoordinate2D location = CLLocationCoordinate2DMake(40.625421, -8.647336);
    MKCoordinateRegion region = MKCoordinateRegionMake(location, span);
    [_map setRegion:region animated:YES];
    
    _appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];

    
    [[ _ref child:@"pokemonsInst"] observeSingleEventOfType:FIRDataEventTypeValue withBlock:^(FIRDataSnapshot * _Nonnull snapshot) {
        
        // Get user value
        NSDictionary *dict = snapshot.value;
        //NSLog(@"%@", dict);
        for(id key in dict){
            NSLog(@"ENTERED");
            NSDictionary *pokeDict = [dict objectForKey:key];
            
            if([pokeDict[@"user_id"] isEqualToString:@"101545424584077913358"]){
            
                PokemonInst *poke = [NSEntityDescription insertNewObjectForEntityForName:@"PokemonInst" inManagedObjectContext:_appDelegate.managedObjectContext];
            
                poke.nickname = pokeDict[@"nickname"];
                poke.id = pokeDict[@"id"];
                poke.pokemon_id = pokeDict[@"pokemon_id"];
                poke.value = pokeDict[@"value"];
                poke.image = pokeDict[@"image"];
            
                [_appDelegate saveContext];
                NSLog(@"%@", poke);
            }
        }
        
    }withCancelBlock:^(NSError * _Nonnull error) {
        NSLog(@"%@", error.localizedDescription);
    }];
    
    [[ _ref child:@"pokedex"] observeSingleEventOfType:FIRDataEventTypeValue withBlock:^(FIRDataSnapshot * _Nonnull snapshot) {
        
        // Get user value
        NSDictionary *dict = snapshot.value;
        for(id key in dict){
            NSLog(@"ENTERED");
            NSDictionary *pokeDict = [dict objectForKey:key];
            if([pokeDict[@"user_id"] isEqualToString:@"101545424584077913358"]){
                //NSDictionary *pokeDict = [dict objectForKey:key];
            
                Pokemon *poke = [NSEntityDescription insertNewObjectForEntityForName:@"Pokemon" inManagedObjectContext:_appDelegate.managedObjectContext];
            
                
                poke.id = pokeDict[@"id"];
                poke.image = pokeDict[@"image"];
                poke.name = pokeDict[@"name"];
            
                [_appDelegate saveContext];
                NSLog(@"%@", poke);
            }
        }
        
    }withCancelBlock:^(NSError * _Nonnull error) {
        NSLog(@"%@", error.localizedDescription);
    }];
    
    [[ _ref child:@"pokemons"] observeSingleEventOfType:FIRDataEventTypeValue withBlock:^(FIRDataSnapshot * _Nonnull snapshot) {
        
        // Get user value
        NSMutableArray *dict = snapshot.value;
        //NSLog(@"%@", dict);
        for(NSDictionary *pokeDict in dict){
            NSLog(@"ENTERED");
            //NSDictionary *pokeDict = [dict objectForKey:key];
                
            Pokedex *poke = [NSEntityDescription insertNewObjectForEntityForName:@"Pokedex" inManagedObjectContext:_appDelegate.managedObjectContext];
                
                
            poke.id = pokeDict[@"id"];
            poke.weight = pokeDict[@"weight"];
            poke.image = pokeDict[@"image"];
            poke.height = pokeDict[@"height"];
            poke.pokedex = pokeDict[@"pokedex"];
            poke.nickname = pokeDict[@"nickname"];
            poke.name = pokeDict[@"name"];
                
            [_appDelegate saveContext];
            NSLog(@"%@", poke);
        }
        
    }withCancelBlock:^(NSError * _Nonnull error) {
        NSLog(@"%@", error.localizedDescription);
    }];
    
    
    [[ _ref child:@"items_inst"] observeSingleEventOfType:FIRDataEventTypeValue withBlock:^(FIRDataSnapshot * _Nonnull snapshot) {
        
        // Get user value
        NSDictionary *dict = snapshot.value;
        //NSLog(@"%@", dict);
        for(id key in dict){

            NSLog(@"ENTERED");
            NSDictionary *itemDict = [dict objectForKey:key];
            if([itemDict[@"user_id"] isEqualToString:@"101545424584077913358"]){
                ItemInst *item = [NSEntityDescription insertNewObjectForEntityForName:@"ItemInst" inManagedObjectContext:_appDelegate.managedObjectContext];
            
                item.name = itemDict[@"name"];
                item.descriptions = itemDict[@"description"];
                item.amount = [[itemDict objectForKey:@"amount"] integerValue];
                item.id = itemDict[@"id"];
                item.image = itemDict[@"image"];
            
                [_appDelegate saveContext];
                NSLog(@"%@", item);
            }
        }
        
    }withCancelBlock:^(NSError * _Nonnull error) {
        NSLog(@"%@", error.localizedDescription);
    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)getLocation{
    
    if (nil == locationManager)
        locationManager = [[CLLocationManager alloc] init];
    
    NSLog(@"Started Location");
    locationManager.delegate = self;
    locationManager.desiredAccuracy = kCLLocationAccuracyKilometer;
    
//locationManager.distanceFilter = 1;
    [locationManager requestAlwaysAuthorization];
    [locationManager startUpdatingLocation];
}


- (void)locationManager:(CLLocationManager *)manager
     didUpdateLocations:(NSArray *)locations {
    // If it's a relatively recent event, turn off updates to save power.
    CLLocation* location = [locations lastObject];
    NSDate* eventDate = location.timestamp;
    NSTimeInterval howRecent = [eventDate timeIntervalSinceNow];
    if (fabs(howRecent) < 15.0) {
        
        // If the event is recent, do something with it.
        NSLog(@"latitude %+.6f, longitude %+.6f\n",
              location.coordinate.latitude,
              location.coordinate.longitude);
        
        
        
        [_map setCenterCoordinate:location.coordinate animated:YES ];
        
    }
}
- (IBAction)firebasebutton:(id)sender {
    NSLog(@"FIREBUTTON");
    
    [[ _ref child:@"pokemonsMap"] observeSingleEventOfType:FIRDataEventTypeValue withBlock:^(FIRDataSnapshot * _Nonnull snapshot) {
        NSLog(@"ENTERED");
        // Get user value
        NSDictionary *dict = snapshot.value;
        
        for(id key in dict){
            NSLog( @"%@", [dict objectForKey:key] );
        }
        
        NSLog(@"%@", dict);
    }withCancelBlock:^(NSError * _Nonnull error) {
        NSLog(@"%@", error.localizedDescription);
    }];
    
    NSLog(@"EXIT");
    
}
@end
