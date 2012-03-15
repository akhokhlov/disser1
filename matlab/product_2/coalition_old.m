% Returns intersection set of 'set1' and 'set2'.
% 'set1' and 'set2' need to be even.
function result = coalition(set1, set2)

% Check for the even lenth.
if mod(length(set1), 2) == 1 || mod(length(set2), 2) == 1
	error('Input arrays ''set1'' and ''set2'' must has the even length!');
end

% Simple checking for empty set.
if isempty(set1)
	result = set2;
	return;
elseif isempty (set2) 
    result = set1;
    return;
end


% Perform simple checking of two intervals.
if length(set1)==2 && length(set2)==2
    % Check for start <= end.
    if set1(1) > set1(end)
        error ('Set1 is incorrect interval: start should be >= then end.') ;
    end
    % Check for start <= end.
    if set2(1) > set2(end)
        error ('Set2 is incorrect interval: start should be >= then end.') ;
    end
    if set2(1) < set1(1)
        temp = set1;
        set1 = set2;
        set2 = temp;
    end
    if set2(1) <= set1(end)
        % |----------------|    set1
        % |------|              set2
        if set2(end) <= set1(end)
            result = set1;
            return;
        % |----------------|        set1
        % |----------------------|  set2
        else
            result = [set1(1), set2(end)];
            return;
        end
    else
        % |----------------|                set1
        %                       |-------|   set2
        result =[set1, set2];
        return;
    end
else
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % A comlecated set.
    complexSet = [];
    set = [];
    if length (set1) == 2
        complexSet = set2;
        set = set1;
    elseif length (set2) == 2;
        complexSet = set1;
        set = set2;
    end

    if isempty (complexSet) 
        result = set1;
        for n=1:2:length (set2)
            result = coalition(result, set2(n:n+1)) ;
        end
    else
        % Perform complex coalition.    
        first = 0;
        last = 0;
        for n=1:2:length (complexSet)
            if set (0) > complexSet (n+1) 
            % |--------|                complexSet
            %               |-------|   set
            continue;
            
            elseif set(0)>complexSet(n) && set(0)<=complexSet(n+1)
            % |--------|       complexSet
            %      |-------|   set
            
            elseif set(0)<complexSet(n) && set(0)<=complexSet(n+1)
            %          |--------|  complexSet
            % |-----------|        set

            else 
            %          |--------|  complexSet
            % |-----|              set
                
            end
        end
        
    end

end



% intersection([0 2 4 7], [1,4 4 6])


