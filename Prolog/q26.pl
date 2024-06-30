% Facts: Define the color of each fruit
fruit_color(apple, red).
fruit_color(banana, yellow).
fruit_color(grape, purple).
fruit_color(orange, orange).
fruit_color(lemon, yellow).
fruit_color(cherry, red).
fruit_color(blueberry, blue).
fruit_color(kiwi, green).
fruit_color(strawberry, red).
fruit_color(watermelon, green).

% Rule: Find all fruits of a specific color
fruits_of_color(Color, Fruits) :-
    findall(Fruit, fruit_color(Fruit, Color), Fruits).

% Rule: Find the color of a specific fruit
color_of_fruit(Fruit, Color) :-
    fruit_color(Fruit, Color).

% Query to find all fruits of a specific color
% ?- fruits_of_color(yellow, Fruits).

% Query to find the color of a specific fruit
% ?- color_of_fruit(apple, Color).
