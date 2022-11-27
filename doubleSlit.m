clc; close all; clear;

figure(1)
s1 = subplot(1,2,1);
s2 = subplot(1,2,2);

hold on;
view(2);

lambda_ = 0.3; %파장
k = 1; % 파동생성원의 Y좌표
xk = 4; % 전체적인 x축 사이즈
yk = 2; % y축 사이즈    
dxk = 0.01; % 점들의 간격 (데이터 개수와 연관)
dyk = 0.01; % 점들의 간격 (데이터 개수와 연관)
A = 1; % 진폭
t = 0; % 처음 시간
v = 1; % 속도
dt = 0.05; % 시간 차이 (프레임수와 연관)

[X, Y] = meshgrid(0:dxk:xk, -2*yk:dyk:2*yk);
distance1 = sqrt((X).^2 + (Y-k).^2);
distance2 = sqrt((X).^2 + (Y+k).^2);

while t < 10
    Z = A * returnZ(X,Y,distance1,t,v,lambda_);
    Zp = A * returnZ(X,Y,distance2,t,v,lambda_);
    Z = Zp+Z;
    f = find(X == xk & distance1 <= v*t & distance2 <= v*t);
    Zt = Z(f);
    Yt = Y(f);
    t = t + dt;

    subplot(1,2,1);
    hold on
    temp_mesh = mesh(X,Y,abs(Z));
    colorbar;
    drawnow;
    title(sprintf('시간 : %f 초',t), 'FontSize',32)

    subplot(1,2,2)
    hold on
    temp_plot = plot(Yt, abs(Zt),'-b');
    axis([-2*yk,2*yk,0,2*A])
    drawnow;
    title(sprintf('시간 : %f 초',t), 'FontSize',32)
    
    
    pause(dt);
    delete(temp_mesh);
end

subplot(1,2,1);
mesh(X,Y,Z)
subplot(1,2,2)
plot(Yt, abs(Zt),'Color','b');