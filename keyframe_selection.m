%% Keyframe selection from mouse point

%Yaw is fixed to zero for all keyframes.


%Plots initialization
figure(1);
subplot(2,4,1);                 %x-y view
grid on; hold on;
xlabel('xy plane');
axis([-1 1 -1 1]);

subplot(2,4,2);                 %altitude view
set( gca, 'XTick', -1:1:1 );
set( gca, 'XTickLabel', {'','',''} );
grid on; hold on;
xlabel('altitude');
axis([-1 1 0.5 1.5]);

subplot(2,4,3);                 %altitude view
set( gca, 'XTick', -1:1:1 );
set( gca, 'XTickLabel', {'','',''} );
grid on; hold on;
xlabel('yaw');
axis([-1 1 -pi pi]);

%subplot(2,2,[3 4]);             %3-dimensional view
subplot(2,4,4);             %3-dimensional view
grid on; hold on;
xlabel('3D view');
axis([-1 1 -1 1 0 1.5]);

%Get data from mouse input
global count keyframe;
count = 1;
keyframe = zeros(4,m);
keyframe(:,1) = initial_uav_status;     %initial position and yaw

%xy selection
subplot(2,4,1);
plot(keyframe(1,count), keyframe(2,count), 'ro','MarkerFaceColor', 'r');
text(keyframe(1,count), keyframe(2,count), num2str(count));
set(gcf, 'WindowButtonMotionFcn', @mouseMove1);
set(gcf, 'WindowButtonDownFcn', @mouseClick1);
while(count~=m)
    drawnow;
end
title(gca,'Done. Select the desired altitudes');

%altitude selection
count = 1;
subplot(2,4,2);
plot([-1 1],[-keyframe(3,count) -keyframe(3,count)], 'r-', 'LineWidth', 2);
text(0, 0, num2str(count));
set(gcf, 'WindowButtonMotionFcn', @mouseMove2);
set(gcf, 'WindowButtonDownFcn', @mouseClick2);
while(count~=m)
   drawnow; 
end
title(gca,'Done. Select the desired yaw');
%title(gca,'All selections done');

%yaw selection
count = 1;
subplot(2,4,3);
plot([-1 1],[keyframe(4,count) keyframe(4,count)], 'r-', 'LineWidth', 2);
text(0, 0, num2str(count));
set(gcf, 'WindowButtonMotionFcn', @mouseMove3);
set(gcf, 'WindowButtonDownFcn', @mouseClick3);
while(count~=m)
   drawnow; 
end
title(gca,'Done. Select the desired yaw');
%title(gca,'All selections done');

%3D view
%subplot(2,2,[3 4]);
subplot(2,4,4);
for i=1:m
   plot3(keyframe(1,i),keyframe(2,i),-keyframe(3,i),'-ro','MarkerFaceColor','r');
   text(keyframe(1,i)+0.4, keyframe(2,i)+0.4, -keyframe(3,i)+0.4, num2str(i));
end
view([-30.4000 45.2000]);
drawnow;