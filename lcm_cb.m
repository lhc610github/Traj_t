function lcm_cb(obj,event)
    temp_aggregator = obj.UserData;
        lcm_uav_status = temp_aggregator.getNextMessage(2);
        if length(lcm_uav_status) > 0
            disp(sprintf('channel of received message: %s', char(lcm_uav_status.channel)))
            %disp(sprintf('raw bytes of received message:'))
            %disp(sprintf('%d ', lcm_uav_status.data'))
            get_uav_status = uav_status.uav_status_t(lcm_uav_status.data);
    [initial_roll,initial_pitch,initial_yaw] = get_euler_from_q(get_uav_status.orientation(1),get_uav_status.orientation(2),get_uav_status.orientation(3),get_uav_status.orientation(4))  
        else
            disp('thread time out')%, char(obj.Name))
        end
end