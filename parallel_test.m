clear all;close all;
lc = lcm.lcm.LCM('udpm://239.255.76.67:7667?ttl=1');
lc.getSingleton();

aggregator1= lcm.lcm.MessageAggregator();
aggregator1.setMaxMessages(1);
lc.subscribe('uav_status_2',aggregator1);

aggregator2 = lcm.lcm.MessageAggregator();
aggregator2.setMaxMessages(1);
lc.subscribe('uav_status_3',aggregator2);

%iter = 40;%'TasksToExecute',iter,...
interval = 0.1;% s
t1 = timer('TimerFcn',@lcm_cb,... %callback functions
    'Name','uav2_listener',...
    'Period',interval,...% interval(s)
    'BusyMode','queue',...
    'ExecutionMode','fixedDelay',...
    'UserData',aggregator1); % times of caputure

t2 = timer('TimerFcn',@lcm_cb,... %callback functions
    'Name','uav3_listener',...
    'Period',interval,...% interval(s)
    'BusyMode','queue',...
    'ExecutionMode','fixedDelay',...
    'UserData',aggregator2); % times of caputure

%start(t1);
start(t2);
pause(10);
while 1
    tf=timerfind;
    if length(tf)>0
        stop(tf);
        delete(tf);
    else
        break
    end
end