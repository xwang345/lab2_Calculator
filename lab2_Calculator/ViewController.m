//
//  ViewController.m
//  lab2_Calculator
//
//  Created by Xiaochen Wang on 2018-10-01.
//  Copyright © 2018 Xiaochen Wang. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, strong)NSMutableArray *items;
@end

@implementation ViewController

-(void)viewDidLoad{
    [super viewDidLoad];
//    operatorPressed = FALSE;
//    firstEntry = NULL;
}

- (void) pushItem:(double)number{
    if(_items==nil){
        _items = [[NSMutableArray alloc]init];
    }else{
        [self.items addObject:[NSNumber numberWithDouble:number]];
    }
}

-(double) calculate{
    if ([operand isEqualToString: @"+"]) {
        return [self popItem] + [self popItem];
    }else if([operand isEqualToString: @"-"]){
        return [self popItem] - [self popItem];
    }else if([operand isEqualToString: @"/"]) {
        return [self popItem] / [self popItem];
    }else if([operand isEqualToString: @"*"]){
        return [self popItem] * [self popItem];
    } else {
        return 0;
    }
}

- (IBAction)Oprator_Pressed:(id)sender {
    operand = ((UIButton*)sender).titleLabel.text;
    [self calculate];
    
}

- (IBAction)DigitPressed:(id)sender {
    NSString *numString = ((UIButton*)sender).titleLabel.text;
    NSString *mainLabelString = Display.text;
    
    Display.text = [mainLabelString stringByAppendingFormat:@"%@", numString];
    numString.numberStyle = NSNumberFormatterDecimalStyle;
    [self.pushItem:@"%d", numString];
    
}

- (IBAction)Enter_Pressed:(id)sender {
    operand = @"";
    [self calculate];
}

-(double) popItem{
    NSNumber *nsLastNum = [self.items lastObject];
    [self.items removeLastObject];
    
    return [nsLastNum doubleValue];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
