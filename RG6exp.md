为了验证仿真程序写的没有问题，我把与论文中有关的图都画了出来。

左图为论文中的图，右图为仿真代码画出来的图，右图中添加了J0输入轴（从0到Js/100）

<figure class="half">
  <img src="/Users/lichen/Library/Application Support/typora-user-images/image-20200102171128607.png" width="270"/>
  <img src="/Users/lichen/Documents/Research/Light/Simulation/RG6/Jk:Js5.png" width="270"/>
</figure>

这两图图片是Jk/Js的曲线，参数与论文一致。

<figure class="half">   
  <img src="/Users/lichen/Library/Application Support/typora-user-images/image-20200102170309916.png" width="150"/>   
  <img src="/Users/lichen/Documents/Research/Light/Simulation/RG6/Jk:Js.png" width="200"/>
  <img src="/Users/lichen/Documents/Research/Light/Simulation/RG6/gk.png" width="200"/>
</figure>

这三幅图是Jk/Js与gk/g0，参数与论文一致，曲线与论文基本一致。

<figure class="half">   <img src="/Users/lichen/Library/Application Support/typora-user-images/image-20200102171741779.png" width="270"/>   <img src="/Users/lichen/Library/Application Support/typora-user-images/image-20200102171823752.png" width="270"/> </figure>

这两幅图为随着输入从0变化到Js/100，迭代18次与迭代30次的曲线，G取1.5，Js取0.9，p取1。

迭代部分代码如下所示，老师帮我看看上图中的曲线对不对。

~~~matlab
for i = 1:30      
	G = exp(g);     
	Ji = Jii;    
	k = log(G.* (exp(Ji/Js) - 1)+1);
  Jii = T*Js*k; 
  g = g - p * (Jii/T - Ji) / Js;
  G = exp(g); 
end
~~~

