//
//  TableCell.m
//  MapTest
//
//  Created by students@deti on 06/06/18.
//  Copyright © 2018 pikachua@ua.pt. All rights reserved.
//

#import "TableCell.h"

@implementation TableCell
- (void)displayContent:(UIImage*)image : (NSString*) label1 : (NSString*) label2 : (NSString*) total{
    _itemName.text = label1;
    _itemAmount.text = total;
    _itemImage.image = image;
    _itemDescription.text = label2;
}



@end
