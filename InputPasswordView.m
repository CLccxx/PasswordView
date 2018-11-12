//
//  InputPasswordView.m
//  passwordView
//
//  Created by xx_Cc on 2018/10/23.
//  Copyright © 2018 xx_cc. All rights reserved.
//

#import "InputPasswordView.h"

#define kNum @"^[0-9]*$"
#define kDefaultSpace 10

@interface InputPasswordView () <UITextFieldDelegate>

@property (nonatomic, assign) int dotCount;
@property (nonatomic, strong) NSMutableArray *btnArray;
@property (nonatomic, strong) UITextField *textField;

@end

@implementation InputPasswordView

- (instancetype)initWithPasswordCount:(int)count {
    if (self = [super init]) {
        self.dotCount = count;
        self.dotSize = CGSizeMake(45.0, 45.0);
        self.dotInsets = UIEdgeInsetsMake(0, 0, 0, 0);
        self.dotSpace = 10;
        self.secureEntry = NO;
        self.dotTextColor = [UIColor blackColor];
        [self addSubview: self.textField];
        for (int i = 0; i < count; i ++) {
            UIButton *dotButton = [UIButton buttonWithType: UIButtonTypeCustom];
            [dotButton addTarget: self action:@selector(dotBtnClick) forControlEvents: UIControlEventTouchUpInside];
            [self addSubview: dotButton];
            [self.btnArray addObject: dotButton];
        }
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    CGFloat viewWidth = ((self.dotCount * self.dotSize.width) + ((self.dotCount - 1) * self.dotSpace) + self.dotInsets.left + self.dotInsets.right);
    CGFloat viewHeight = (self.dotSize.height + self.dotInsets.top + self.dotInsets.bottom);
    
    CGRect frame = self.frame;
    frame.size = CGSizeMake(viewWidth, viewHeight);
    self.frame = frame;
    self.textField.frame = frame;
    
    for (int i = 0 ; i < self.btnArray.count; i ++) {
        UIButton *dotButton = self.btnArray[i];
        dotButton.frame = CGRectMake(self.dotInsets.left + (i * (self.dotSize.width + self.dotSpace)), self.dotInsets.top, self.dotSize.width, self.dotSize.height);
    }
    
    if (!_emptyBackImage && !_fillBackImage) {
        for (UIButton *dotButton in self.btnArray) {
            dotButton.backgroundColor = [UIColor grayColor];
        }
    }
}

- (void) dotBtnClick {
    [self.textField becomeFirstResponder];
}

- (void) textFieldChanged:(UITextField *)textField {
    NSString *x = textField.text;
    for (UIButton *button in self.btnArray) {
        [button setTitle:@"" forState: UIControlStateNormal];
        [button setTitle:@"" forState: UIControlStateSelected];
    }
    for (int i = 0; (i < x.length)&&(i < self.btnArray.count); i++) {
        NSString *string = [x substringWithRange: NSMakeRange(i, 1)];
        [self.btnArray[i] setSelected: YES];
        if (self.secureEntry) {
            [self.btnArray[i] setTitle:@"●" forState: UIControlStateSelected];
        }else {
            [self.btnArray[i] setTitle:string forState: UIControlStateSelected];
        }
    }
    self.contentStr = textField.text;
}

#pragma mark ---- lazy method ----
- (UITextField *)textField {
    if (!_textField) {
        _textField = [[UITextField alloc] init];
        _textField.delegate = self;
        _textField.keyboardType = UIKeyboardTypeNumberPad;
        _textField.borderStyle = UITextBorderStyleRoundedRect;
        _textField.textAlignment = NSTextAlignmentCenter;
        _textField.hidden = YES;
        [_textField addTarget:self action:@selector(textFieldChanged:) forControlEvents:UIControlEventEditingChanged];
    }
    return _textField;
}

- (NSMutableArray *)btnArray {
    if (!_btnArray) {
        _btnArray = [NSMutableArray arrayWithCapacity: self.dotCount];
    }
    return _btnArray;
}


#pragma mark ---- get set method ----
- (void)setDotSize:(CGSize)dotSize {
    if (dotSize.width > 0 && dotSize.height > 0) {
        _dotSize = dotSize;
    }else{
        _dotSize = CGSizeMake(45.0, 45.0);
    }
}

- (void)setEmptyBackImage:(UIImage *)emptyBackImage {
    _emptyBackImage = emptyBackImage;
    for (UIButton *dotButton in self.btnArray) {
        [dotButton setBackgroundImage: emptyBackImage forState: UIControlStateNormal];
    }
}

- (void)setFillBackImage:(UIImage *)fillBackImage {
    _fillBackImage = fillBackImage;
    for (UIButton *dotButton in self.btnArray) {
        [dotButton setBackgroundImage: fillBackImage forState: UIControlStateSelected];
    }
}



- (void)setDotTextColor:(UIColor *)dotTextColor {
    _dotTextColor = dotTextColor;
    for (UIButton *dotButton in self.btnArray) {
        [dotButton setTitleColor:dotTextColor forState: UIControlStateNormal];
        [dotButton setTitleColor:dotTextColor forState: UIControlStateSelected];
    }
}

#pragma mark ---- textField delegate ----
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    NSString *numberLimit = kNum;
    
    NSPredicate *numberPre = [NSPredicate predicateWithFormat: @"SELF MATCHES %@", numberLimit];
    if (string.length == 0) {
        return YES;
    }else if (textField.text.length >= self.dotCount){
        return NO;
    }
    return [numberPre evaluateWithObject: string];
}

@end
