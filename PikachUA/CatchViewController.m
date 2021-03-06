//
//  CatchViewController.m
//  MapTest
//
//  Created by students@deti on 11/05/18.
//  Copyright © 2018 pikachua@ua.pt. All rights reserved.
//

#import "CatchViewController.h"

@interface CatchViewController ()

@end

@implementation CatchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    NSFetchRequest *fetchRequest= [[NSFetchRequest alloc] initWithEntityName:@"Pokedex"];
    
    
    [fetchRequest setPredicate:[NSPredicate predicateWithFormat:@"name == %@",_pokemon_name] ];
    
    NSLog(@"%@", _pokemon_name);
    
    _pokemon = [[_appDelegate.managedObjectContext executeFetchRequest:fetchRequest error:nil ] mutableCopy][0];
    
    //Pokedex *poke = self.pokemon[_pokemon[@"id"]];
    _cp.text = [[NSString alloc] initWithFormat:@"%d", arc4random() % 2000];
    _name.text = _pokemon.name;
    _image.image = [UIImage imageNamed:_pokemon.name];
    
        
    
    NSLog(@"%@", _pokemon);
    //_poked = _pokemon.pokemon_id;
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)doAction:(id)sender {
    
    _appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    NSFetchRequest *fetchRequest= [[NSFetchRequest alloc] initWithEntityName:@"ItemInst"];
    
    [fetchRequest setPredicate:[NSPredicate predicateWithFormat:@"name == %@",@"Pokeball"] ];
    
    _item = [[_appDelegate.managedObjectContext executeFetchRequest:fetchRequest error:nil ] mutableCopy][0];
    NSLog(@"%@", _item);
    if (_item.amount>0){
    
        _item.amount=_item.amount-1;
        
        if(_pokemon.catchRate.floatValue*100 > arc4random() % 100){
            NSLog(@"Got it!");
            PokemonInst *poke = [NSEntityDescription insertNewObjectForEntityForName:@"PokemonInst" inManagedObjectContext:_appDelegate.managedObjectContext];
            
            poke.nickname = _name.text;
            poke.id = [NSString stringWithFormat:@"%@_%u", _appDelegate.userID, arc4random() % 100000];
            _id = poke.id;
            poke.pokemon_id = _pokemon.id;
            poke.value = _cp.text;
            poke.image = _pokemon.image;
            
            [_appDelegate saveContext];
            
            _message.text = @"Got it!";
            
            [self sincFirebase];
            
            [self performSegueWithIdentifier:@"caugthPokemon" sender:self];
            
        }
        else{
            if(_pokemon.fleeRate.floatValue*100 > arc4random() % 100){
                NSLog(@"Oh no! It ran away!");
                _message.text = @"Oh no! It ran away!";
                UINavigationController *navigationController = self.navigationController;
                [navigationController popViewControllerAnimated:YES];
                [self sincFirebase];
            }

        }
    }
    else{
        [sender setTitle:@"Out of Pokeballs!" forState:UIControlStateNormal];
    }
}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqualToString:@"caugthPokemon"]){
        
        
        NSFetchRequest *fetchRequest= [[NSFetchRequest alloc] initWithEntityName:@"PokemonInst"];
        
        [fetchRequest setPredicate:[NSPredicate predicateWithFormat:@"id == %@",_id] ];
        
        PokemonInst *poke = [[_appDelegate.managedObjectContext executeFetchRequest:fetchRequest error:nil ] mutableCopy][0];
        NSLog(@"NICK:   %@", poke);
        
        UINavigationController *navigationController = self.navigationController;
        [navigationController popViewControllerAnimated:YES];
        
        
        MonsterBioController *controller = (MonsterBioController *)segue.destinationViewController;
        controller.pokemon = poke;
        
        
        
    }
}

-(void) sincFirebase{
    
    [[ _ref child:@"items_inst"] observeSingleEventOfType:FIRDataEventTypeValue withBlock:^(FIRDataSnapshot * _Nonnull snapshot) {
        NSLog(@"ENTER");
        // Get user value
        NSDictionary *dict = snapshot.value;
        
        NSFetchRequest *fetchRequest= [[NSFetchRequest alloc] initWithEntityName:@"ItemInst"];
        
        NSMutableArray *itemArray = [[self->_appDelegate.managedObjectContext executeFetchRequest:fetchRequest error:nil ] mutableCopy];
        
        //NSLog(@"%@", dict);
        for(id key in dict){
            
            // NSLog(@"ENTERED");
            NSDictionary *itemDict = [dict objectForKey:key];
            
            if([itemDict[@"user_id"] isEqualToString:self->_appDelegate.userID]){
                
                // NSLog(@"%lu", (sizeof itemArray) / (sizeof itemArray[0]) );
                
                
                ItemInst *item = itemArray[[itemDict[@"item_id"] intValue]];
                NSLog(@"%@", item);
                [itemDict setValue:[NSString stringWithFormat:@"%d", item.amount]  forKey:@"amount"];
                
                NSString *itemUID = [NSString stringWithFormat:@"%@_%@",self->_appDelegate.userID,item.id ];
                NSLog(@"%@", itemUID);
                
                [[[[self->_ref child:@"items_inst"] child:item.id ] child:@"amount" ] setValue:[NSString stringWithFormat:@"%d", item.amount]];
                // NSLog(@"%@", item);
            }
        }
        
    }withCancelBlock:^(NSError * _Nonnull error) {
        NSLog(@"%@", error.localizedDescription);
    }];
    
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
