This is a simple animated circle view.

Sample code:

```
KMKCircleView *newCircle = [[KMKCircleView alloc] initWithFrame:self.view.frame Color:[UIColor blackColor]];
[newCircle drawCircleLayerDirection:Counterclockwise Frame:CGRectMake(self.view.frame.size.width/1.5, 310, self.view.frame.size.height/8, self.view.frame.size.height/8) Radius:20];
[self.view addSubview:newCircle];
```
