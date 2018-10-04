//
//  Calculator_brain.h
//  lab2_Calculator
//
//  Created by Xiaochen Wang on 2018-10-04.
//  Copyright © 2018 Xiaochen Wang. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Calculator_brain : NSObject

-(void)pushItem:(double) number;
-(double) calculate: (NSString*) oparation;

@end

NS_ASSUME_NONNULL_END
