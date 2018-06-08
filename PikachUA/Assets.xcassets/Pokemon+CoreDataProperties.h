//
//  Pokemon+CoreDataProperties.h
//  MapTest
//
//  Created by students@deti on 01/06/18.
//  Copyright © 2018 pikachua@ua.pt. All rights reserved.
//

#import ".Pokemon+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface Pokemon (CoreDataProperties)

+ (NSFetchRequest<Pokemon *> *)fetchRequest;

@property (nonatomic) double catchRate;
@property (nonatomic) double fleeRate;
@property (nonatomic) double heigth;
@property (nonatomic) int32_t id;
@property (nullable, nonatomic, copy) NSString *image;
@property (nullable, nonatomic, copy) NSString *name;
@property (nullable, nonatomic, copy) NSString *nickname;
@property (nullable, nonatomic, copy) NSString *pokedex;
@property (nonatomic) double spawnRate;
@property (nonatomic) double weigth;
@property (nullable, nonatomic, retain) PokemonDex *relationship;
@property (nullable, nonatomic, retain) NSSet<PokemonInst *> *relationship1;

@end

@interface Pokemon (CoreDataGeneratedAccessors)

- (void)addRelationship1Object:(PokemonInst *)value;
- (void)removeRelationship1Object:(PokemonInst *)value;
- (void)addRelationship1:(NSSet<PokemonInst *> *)values;
- (void)removeRelationship1:(NSSet<PokemonInst *> *)values;

@end

NS_ASSUME_NONNULL_END
