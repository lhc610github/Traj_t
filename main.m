%% main
clear all; close all;
lc = lcm.lcm.LCM('udpm://239.255.76.67:7667?ttl=1');
%pause(2);
lc.getSingleton();
aggregator = lcm.lcm.MessageAggregator();
name_status_topic = 'uav_status_3'
name_traject_topic = 'uav_traject_3'
real_expirent_flag = true;
if(real_expirent_flag)
    lc.subscribe(name_status_topic,aggregator);
    while true
        disp waiting
        millis_to_wait = 1000;
        lcm_uav_status = aggregator.getNextMessage(millis_to_wait);
        if length(lcm_uav_status) > 0
         break
        end
    end
    get_uav_status = uav_status.uav_status_t(lcm_uav_status.data);
    [initial_roll,initial_pitch,initial_yaw] = get_euler_from_q(get_uav_status.orientation(1),get_uav_status.orientation(2),get_uav_status.orientation(3),get_uav_status.orientation(4))
    initial_uav_status = [get_uav_status.position(1);
                          get_uav_status.position(2);
                          get_uav_status.position(3);initial_yaw];  

else
    initial_uav_status = zeros(4,1);
    initial_uav_status(3,1) = -0.7;
end
parameters;                      %parameters initialization
keyframe_selection_flag = true;
if(keyframe_selection_flag)
    keyframe_selection;
else
    %load('keyframe.mat','keyframe');
    keyframe = [0 0 0 0;
                2 3 5 1;
                1 2 3 2;
                1 4 2 3;
                7 3 2 4;
                0 0 0 0]'
end
[t,total_time] = generate_ts(keyframe(1:3,:)');
t
total_time
keyframe_selection_flag = true;
QP_trajec_generation;
%C_result*A*C_result'
drawSolution;

msg = uav_traject.uav_traject_t();
msg.timestamp = get_unix_timestamp(now)*1000000;
msg.num_keyframe = temp_m;
msg.order_p_1 = order+1;
msg.t = t(2:end);
for i = 1:temp_m
    for j = 1:msg.order_p_1
        msg.traject(i,j,1) = solution((i-1)*(order+1)*4 + j);
        msg.traject(i,j,2) = solution((i-1)*(order+1)*4 + order+1 + j);
        msg.traject(i,j,3) = solution((i-1)*(order+1)*4 + 2*(order+1) + j);
        msg.traject(i,j,4) = solution((i-1)*(order+1)*4 + 3*(order+1) + j);
    end
end

if(real_expirent_flag)
disp start_sending
% if get_uav_status.mode == 3
%    disp('uav has a trajectory,but we will still send a new one for 10 times in a second')
%    for i = 1:10
%             lc.publish(name_traject_topic, msg);
%             pause(0.2)
%    end
% else
%    disp('uav has no trajectory, sending one untill the uav has one traject')
%    aggregator1 = lcm.lcm.MessageAggregator();
%    lc.subscribe(name_status_topic,aggregator1);
%    while get_uav_status.mode ~= 3
%     lc.publish(name_traject_topic, msg);
%     pause(1)
%     while true
%         disp waiting
%         millis_to_wait = 1000;
%         lcm_uav_status = aggregator1.getNextMessage(millis_to_wait);
%         if length(lcm_uav_status) > 0
%          break
%         end
%     end
%     get_uav_status = uav_status.uav_status_t(lcm_uav_status.data);
%    end
% end
% 
% disp send_done
while 1
if (get_unix_timestamp(now)*1000000 - msg.timestamp) > (t(end)*1000000 + 1000000)
    msg.timestamp = get_unix_timestamp(now)*1000000;
end
lc.publish(name_traject_topic, msg);
pause(0.2)
end
%    for i = 1:20
%              lc.publish(name_traject_topic, msg);
%              pause(0.2)
%    end
end
%msg.traject