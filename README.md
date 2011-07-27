#Iron Horse

##Elements

* 1 game board (consisting of cities connected by routes)
* 50 train cards per player
* route markers for each player
* 5 dice

##Objective

Iron Horse combines the gameplay of train games like TtR with the strategy and competition of army games like Risk.

The objective is to control the greatest number of cities when the game ends. Cities are controlled by whoever owns the most routes connected to that city. Gameplay ends when any player runs out of trains.

##Gameplay

At the beginning of the game, players choose a home city and write it down; players only disclose their choice when everyone has written theirs down. Players then take turns building or stealing routes to control cities.

##Building Routes

To build a route, a player uses a turn. The player places gives up the designated number of train cards, and claims the route by placing their marker on the route. 

Players may only claim one route per turn.
Players may only claim a route if it's connected to a city they currently control.

##Stealing Routes

A player may also elect to try and steal a route. To steal a route, the route must be connected to a city they control. The player and the current owner of the route must then 'battle' to decide who gets the route.

To battle, both players roll dice, the player whose dice add up to the largest number wins the route. The 'stealing' player rolls two dice, and the defending player rolls three. (Ultimately, I'd like to change this to where the stealing player rolls 1 die for each route he/she owns that is adjacent to the route in question, and the defender gets the same + 1, but I'm not sure I can implement that yet.)

If the attacker wins, he/she claims the route by replacing the current marker with their own. They use no trains cards stealing a route, and the loser does not get his/her train cards back.

If the attacker looses, he/she gives up one train card.

##End

Players take turns either building or stealing routes until any player runs out of train cards. At that point, the winner is the player who controls the largest number of cities.
