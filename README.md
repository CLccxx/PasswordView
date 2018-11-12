# PasswordView
密码或验证码输入控件


```
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
```


使用方法

```
InputPasswordView *passwordView = [[InputPasswordView alloc] initWithPasswordCount: 6];
passwordView.frame = CGRectMake(10, 200, 0, 0);
passwordView.dotSize = CGSizeMake(50.0, 50.0);
passwordView.dotInsets = UIEdgeInsetsMake(10, 20, 10, 20);
passwordView.secureEntry = YES;
passwordView.emptyBackImage = [UIImage imageNamed: @"empth_imageName"];
passwordView.fillBackImage = [UIImage imageNamed: @"fill_imageName"];
passwordView.dotTextColor = [UIColor purpleColor];

// 需要设置完毕之后添加控件到view
[self.view addSubview: passwordView];
    
```
