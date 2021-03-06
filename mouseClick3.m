function mouseClick3(object, eventdata)
    global count m keyframe;

    if(count < m)
        count = count + 1;
        C = get(gca, 'CurrentPoint');
        keyframe(4,count) = C(1,2);               %z
        if(count == m)
            keyframe(:,count+1) = keyframe(:,1);  %Return to the original position
        end
        plot([-1 1],[keyframe(4,count) keyframe(4,count)], 'r-', 'LineWidth',2);
        text(0.6, keyframe(4,count)+0.05, num2str(count));
    end
end