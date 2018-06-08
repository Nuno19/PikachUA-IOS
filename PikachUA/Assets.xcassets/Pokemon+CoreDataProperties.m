//
//  Pokemon+CoreDataProperties.m
//  MapTest
//
//  Created by students@deti on 01/06/18.
//  Copyright © 2018 pikachua@ua.pt. All rights reserved.
//

#import "Pokemon+CoreDataProperties.h"

@implementation Pokemon (CoreDataProperties)

+ (NSFetchRequest<Pokemon *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"Pokemon"];
}

@dynamic catchRate;
@dynamic fleeRate;
@dynamic heigth;
@dynamic id;
@dynamic image;
@dynamic name;
@dynamic nickname;
@dynamic pokedex;
@dynamic spawnRate;
@dynamic weigth;
@dynamic relationship;
@dynamic relationship1;

@end
