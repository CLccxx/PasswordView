//
//  InputPasswordView.h
//  passwordView
//
//  Created by xx_Cc on 2018/10/23.
//  Copyright © 2018 xx_cc. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface InputPasswordView : UIView

/**
 * 密码框的大小
 */
@property (nonatomic, assign) CGSize dotSize;
/**
 * 每个密码框之间的间距
 */
@property (nonatomic, assign) CGFloat dotSpace;
/**
 * 密码框整体对InputPasswordView的内间距，默认值为 (0,0,0,0)
 */
@property (nonatomic, assign) UIEdgeInsets dotInsets;
/**
 * 是否隐藏输入内容 默认为NO
 */
@property (nonatomic, assign) BOOL secureEntry;
/**
 * 未输入数字时的背景图片，如果不需要背景图片变化，则只设置此背景即可
 */
@property (nonatomic, strong) UIImage *emptyBackImage;
/**
 * 输入数字后背景图片，如果设置此背景，则必须设置emptyBackImage
 */
@property (nonatomic, strong) UIImage *fillBackImage;
/**
 * 数字的颜色默认为黑色
 */
@property (nonatomic, strong) UIColor *dotTextColor;
/**
 * 输入内容
 */
@property (nonatomic, strong) NSString *contentStr;

- (instancetype)initWithPasswordCount:(int)count;

@end

NS_ASSUME_NONNULL_END
