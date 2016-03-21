function [forwBackVel, leftRightVel, rotVel, finish] = solution0a(pts, contacts, position, orientation, varargin)
% The control loop callback function - the example solution for task 0A

    if length(varargin) ~= 1,
         error('Wrong number of additional arguments: %d\n', length(varargin));
    end
    dest_x = varargin{1};

    % declare the persistent variable that keeps the state of the Finite
    % State Machine (FSM)
    persistent state;
    if isempty(state),
        % the initial state of the FSM is 'init'
        state = 'init';
    end

    % initialize the robot control variables (returned by this function)
    finish = false;
    forwBackVel = 0;
    leftRightVel = 0;
    rotVel = 0;

    % persistent variables used in FSM
    persistent stop_wait
    persistent init_pos;

    % manage the states of FSM
    if strcmp(state, 'init'),
        state = 'move_forward';
        fprintf('changing FSM state to %s\n', state);
        % save the initial position
        init_pos = position;
    elseif strcmp(state, 'move_forward'),
        forwBackVel = -1;
        leftRightVel = 0;
        rotVel = 0;
        if position(2) < init_pos(2)-dest_x,
            state = 'stop';
            stop_wait = 0;
            fprintf('changing FSM state to %s\n', state);
        end
    elseif strcmp(state, 'stop'),
        forwBackVel = 0;
        leftRightVel = 0;
        rotVel = 0;
        stop_wait = stop_wait + 1;
        if stop_wait > 200,
            state = 'move_backward';
            fprintf('changing FSM state to %s\n', state);
        end
    elseif strcmp(state, 'move_backward'),
        forwBackVel = 1;
        leftRightVel = 0;
        rotVel = 0;
        if position(2) > init_pos(2),
            state = 'finish';
            fprintf('changing FSM state to %s\n', state);
        end
    elseif strcmp(state, 'finish'),
        finish = true;
        disp('finished');
    else
        error('Unknown state %s.\n', state);
    end
end
