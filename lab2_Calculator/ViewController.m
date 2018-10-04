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
}

- (void) pushItem:(double)number{
    if(_items==nil){
        _items = [[NSMutableArray alloc]init];
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

- (IBAction)Oprator_pressed:(id)sender {
    UIButton *someButton = (UIButton*)sender;
    NSLog(@"The button title is %@ ", [someButton titleForState:UIControlStateNormal]);
    NSString *operandString =[someButton titleForState:UIControlStateNormal];
    NSString *mainLabelString = _Display.text;
    //show the opreation result to the lable.
    _Display.text = [mainLabelString stringByAppendingFormat:@"%f", [self calculate:operandString]];
}

- (IBAction)DigitPressed:(id)sender {
    NSString *numString = ((UIButton*)sender).titleLabel.text;
    NSString *mainLabelString = _Display.text;
    
    _Display.text = [mainLabelString stringByAppendingFormat:@"%@", numString];
}

- (IBAction)Enter_Pressed:(id)sender {
    
    NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
    [numberFormatter setNumberStyle:NSNumberFormatterDecimalStyle];
    NSNumber *numTemp = [numberFormatter numberFromString: _Display.text];
    NSLog(@"++++++++++++++%@", numTemp);
    [self pushItem:[numTemp doubleValue]];
    _Display.text = @"";
}

-(double) popItem{
    NSNumber *nsLastNum = [self.items lastObject];
    NSLog(@"--------%@",_items);
    [self.items removeLastObject];
    return [nsLastNum doubleValue];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
