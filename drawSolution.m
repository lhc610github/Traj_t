x_trajec   = [];
y_trajec   = [];
z_trajec   = [];
psi_trajec = [];
time = [];

x_trajec_corridor   = [];
y_trajec_corridor   = [];
z_trajec_corridor   = [];
psi_trajec_corridor = [];

for i=1:m
    x_trajec   = [x_trajec   polyval(solution((i-1)*n*(order+1)+1+0*(order+1):(i-1)*n*(order+1)+(order+1)+0*(order+1)),t(i):0.01:t(i+1))];
    y_trajec   = [y_trajec   polyval(solution((i-1)*n*(order+1)+1+1*(order+1):(i-1)*n*(order+1)+(order+1)+1*(order+1)),t(i):0.01:t(i+1))];
    z_trajec   = [z_trajec   polyval(solution((i-1)*n*(order+1)+1+2*(order+1):(i-1)*n*(order+1)+(order+1)+2*(order+1)),t(i):0.01:t(i+1))];
    psi_trajec = [psi_trajec polyval(solution((i-1)*n*(order+1)+1+3*(order+1):(i-1)*n*(order+1)+(order+1)+3*(order+1)),t(i):0.01:t(i+1))];
    time       = [time t(i):0.01:t(i+1)];
%     x_trajec1   = [x_trajec1   polyval(C_result((i-1)*n*(order+1)+1+0*(order+1):(i-1)*n*(order+1)+(order+1)+0*(order+1)),t(i):0.01:t(i+1))];
%     y_trajec1   = [y_trajec1   polyval(C_result((i-1)*n*(order+1)+1+1*(order+1):(i-1)*n*(order+1)+(order+1)+1*(order+1)),t(i):0.01:t(i+1))];
%     z_trajec1   = [z_trajec1   polyval(C_result((i-1)*n*(order+1)+1+2*(order+1):(i-1)*n*(order+1)+(order+1)+2*(order+1)),t(i):0.01:t(i+1))];
%     psi_trajec1 = [psi_trajec1 polyval(C_result((i-1)*n*(order+1)+1+3*(order+1):(i-1)*n*(order+1)+(order+1)+3*(order+1)),t(i):0.01:t(i+1))];

%     x_trajec_corridor   = [x_trajec_corridor   polyval(solution_corridor((i-1)*n*(order+1)+1+0*(order+1):(i-1)*n*(order+1)+(order+1)+0*(order+1)),t(i):0.01:t(i+1))];
%     y_trajec_corridor   = [y_trajec_corridor   polyval(solution_corridor((i-1)*n*(order+1)+1+1*(order+1):(i-1)*n*(order+1)+(order+1)+1*(order+1)),t(i):0.01:t(i+1))];
%     z_trajec_corridor   = [z_trajec_corridor   polyval(solution_corridor((i-1)*n*(order+1)+1+2*(order+1):(i-1)*n*(order+1)+(order+1)+2*(order+1)),t(i):0.01:t(i+1))];
%     psi_trajec_corridor = [psi_trajec_corridor polyval(solution_corridor((i-1)*n*(order+1)+1+3*(order+1):(i-1)*n*(order+1)+(order+1)+3*(order+1)),t(i):0.01:t(i+1))];
end

figure(1);
subplot(2,4,1);
plot(x_trajec,y_trajec,'-k');
hold on
% plot(x_trajec1,y_trajec1,'-b');
%plot(x_trajec_corridor,y_trajec_corridor,'-r');
hold on
plot(keyframe(1,:),keyframe(2,:),'or','MarkerFaceColor','r');
hold off
%subplot(2,2,[3 4]);
subplot(2,4,4);
plot3(x_trajec,y_trajec,-z_trajec,'-k');
hold on
% plot3(x_trajec1,y_trajec1,z_trajec1,'-b');
hold on
plot3(keyframe(1,:),keyframe(2,:),-keyframe(3,:),'or','MarkerFaceColor','r');
hold off
%plot3(x_trajec_corridor,y_trajec_corridor,z_trajec_corridor,'-r');

%figure(2);
subplot(2,4,5); plot(time,x_trajec,'-k'); ylabel('x'); hold on;
axis([min(time) max(time) min(x_trajec) max(x_trajec)]);
%plot(time, x_trajec_corridor,'-r');
subplot(2,4,6); plot(time,y_trajec,'-k'); ylabel('y'); hold on;
axis([min(time) max(time) min(y_trajec) max(y_trajec)]);
%plot(time, y_trajec_corridor,'-r');
subplot(2,4,7); plot(time,z_trajec,'-k'); ylabel('z'); hold on;
axis([min(time) max(time) min(z_trajec) max(z_trajec)]);
%plot(time, z_trajec_corridor,'-r');
subplot(2,4,8); plot(time,psi_trajec,'-k'); xlabel('time'); ylabel('\psi'); hold on;
axis([min(time) max(time) min(psi_trajec) max(psi_trajec)]);
%plot(time, psi_trajec_corridor,'-r');

for i=1:size(keyframe,2)
    subplot(2,4,5); plot(t(i),keyframe(1,i),'or','MarkerFaceColor','r');
    subplot(2,4,6); plot(t(i),keyframe(2,i),'or','MarkerFaceColor','r');
    subplot(2,4,7); plot(t(i),keyframe(3,i),'or','MarkerFaceColor','r');
    subplot(2,4,8); plot(t(i),keyframe(4,i),'or','MarkerFaceColor','r');
end