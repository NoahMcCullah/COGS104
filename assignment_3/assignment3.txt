clear;

%%%%%%%%%%     Part 1      %%%%%%%%%%
% The 13x5 triangle is composed of an 8x3 and a 5x2 triangle.
% In one configuration it appears to be complete 13x5 triangle
% but, in another configuration it appears to be missing a 1x1
% hole.  This is because the two component triangles do not form
% a perfectly straight hypotenuse. 
% A 13x5 triangle would have an areaof 32.5. An 8x3 triangle has an
% area of 12 and a 5x2 triangle has an area of 5. The two other shapes
% have an area of 7 and 8.
% The configuration of these parts with the 5x2 triangle on top has an
% area of 32 units while the other configuration has an area of 33.

%%%%%%%%%%     Part 2      %%%%%%%%%%
clear;

num = 3;
people = [2, num];
%fill people[] with birthdays
for i = 1:num
    people(1,i) = randi(12);
    if people(1,i) == 1 | people(1,i) == 3 | people(1,i) == 5 | people(1,i) == 7 | people(1,i) == 8 | people(1,i) == 10 | people(1,i) == 12
        people(2,i) = randi(31);
    end
    if people(1,i) == 4 | people(1,i) == 6 | people(1,i) == 9 | people(1,i) == 11
        people(2,i) = randi(30);
    end
    if people(1,i) == 2
        people(2,i) = randi(28);
    end
end

same = [];
%search people[] for same birthdays without repeating matchups
for j = 1:num
    for k = j:num
        if people(:,j) == people(:,k)
            result = 1;
        end
        if people(:,j) ~= people(:,k)
            result = 0;
        end
        same = [same result];
    end    
end
%print odds of having the same birthday (should be around 5% at 40 and 50%
%at 3
disp(sum(same)/length(same))
%%%%%%%%%%     Part 3      %%%%%%%%%%
clear;
player = 1;
doors = [1, 2, 3];
res = [];

for i = 1:10000
    car = doors(randi(length(doors)));
    if car == player
        result = 1;
    end
    if car ~= player
        result = 0;
    end
    res = [res result];
end

res2 = [];
for j = 1:10000
    player = doors(randi(length(doors)));
    car2 = doors(randi(length(doors)));
    
    v = randi(find(doors~=player & doors~= car2));
    opened = doors(v);
    u = randi(find(doors~=player & doors~=opened));
    choice = doors(u);
    
    if car2 == choice
        result = 1;
    end
    if car2 ~= choice
        result = 0;
    end
    res2 = [res2 result];
end

disp(sum(res)/10000)
disp(sum(res2)/10000)