function [res] = get_unix_timestamp(time)
   unixEpoch = datenum(1970,1,1,8,0,0); %Matlab is CTS
    res = (time - unixEpoch)*86400;
end