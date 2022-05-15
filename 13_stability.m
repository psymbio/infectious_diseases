[t, x] = meshgrid(0:1:10, -1.5:0.3:1.5);
s = x.*(1-x);
figure(1);
quiver(t, x, 1, s);
title('unormalized');

L = sqrt(1 + s.^2)
figure(2);
quiver(t, x, 1./L, s./L);
title('normalized');
