# KokyParallax
 cell视觉差滚动效果
![](TestParallax.gif)

添加偏移的约束：

```
imageView.sd_layout.leftEqualToView(self.contentView).offset(-centerOffSetY).rightEqualToView(self.contentView).offset(centerOffSetY).centerYIs(self.contentView.center.y + centerOffSetY).heightIs(self.contentView.bounds.size.height + 2 * kCenterOffset);
 
```
![](TestParallax1.gif)



