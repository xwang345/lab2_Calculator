//
//  Caculator_brain.m
//  lab2_Calculator
//
//  Created by Xiaochen Wang on 2018-10-04.
//  Copyright © 2018 Xiaochen Wang. All rights reserved.
//

#import "Calculator_brain.h"
@interface Caculator_brain()
@property (nonatomic, strong)NSMutableArray *items;
@end

@implementation Caculator_brain

- (void) pushItem:(double)number{
    if(_items==nil){
        _items = [[NSMutableArray alloc]init];
        [self.items addObject:[NSNumber numberWithDouble:number]];
    }else{
        [self.items addObject:[NSNumber numberWithDouble:number]];
    }
}

-(double) calculate:(NSString *)operand{
    double tmp;
    if ([operand isEqualToString: @"+"]) {
        tmp = [self popItem] + [self popItem];
        return tmp;
    }else if([operand isEqualToString: @"-"]){
        tmp = [self popItem] - [self popItem];
        return tmp;
    }else if([operand isEqualToString: @"/"]) {
        tmp = [self popItem] / [self popItem];
        return tmp;
    }else if([operand isEqualToString: @"*"]){
        tmp = [self popItem] * [self popItem];
        return tmp;
    } else {
        return 0;
    }
}

-(double) popItem{
    NSNumber *nsLastNum = [self.items lastObject];
    NSLog(@"%@",_items);
    [self.items removeLastObject];
    return [nsLastNum doubleValue];
}
@end
