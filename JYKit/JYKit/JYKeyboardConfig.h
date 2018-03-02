//
//  JYKeyboardConfig.h
//  JYKit
//
//  Created by Jia Yang on 2018/3/2.
//  Copyright © 2018年 FALSESHEEP. All rights reserved.
//

#ifndef JYKeyboardConfig_h
#define JYKeyboardConfig_h

#define JYKB_SCREEN_WIDTH   UIScreen.mainScreen.bounds.size.width
#define JYKB_SCREEN_SCALE    (JYKB_SCREEN_WIDTH / 375.0)

#define JYKB_BTN_HEIGHT (42.0 * JYKB_SCREEN_SCALE)
#define JYKB_BTN_SHADOW (1.0 * JYKB_SCREEN_SCALE)

#define JYKB_HORIZONTAL_SPACING  (6.0 * JYKB_SCREEN_SCALE) // Cell间的水平距离
#define JYKB_VERTICAL_SPACING    (10.0 * JYKB_SCREEN_SCALE) // Cell间的垂直距离

#define JYKB_KeyboardEdgeInset   UIEdgeInsetsMake(8*JYKB_SCREEN_SCALE, 3*JYKB_SCREEN_SCALE, 3*JYKB_SCREEN_SCALE, 3*JYKB_SCREEN_SCALE) // Keyboard中CollectionView内容与边界距离

#endif /* JYKeyboardConfig_h */
