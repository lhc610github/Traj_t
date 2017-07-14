function mouseMove3(object, eventdata)
    global count m;
    if(count~=m)
        C = get(gca, 'CurrentPoint');
        title(gca,['Yaw = (', num2str(C(1,2),2), ')']);
    end
end