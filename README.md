# DrunkenPassanger
Simulation of the Drunken Passanger Problem in R
The problem:
A line of 100 airline passengers is waiting to board a plane. They each hold a ticket to one of the 100 seats on that flight. For convenience, let's say that the $n^{th}$ passenger in line has a ticket for seat number $n$. Being drunk, the first person in line picks a random seat (equally likely for each seat). All of the other passengers are sober, and will go to their assigned seats unless it is already occupied; If it is occupied, they will then find a free seat to sit in, at random. What is the probability that the last (100th) person to board the plane will sit in their own seat?
It is known, and it can be proven by a recursive argument (since in essence if a person has their seat occupied when they enter they will behave "drunk"), that the probability is 1/2. In this R script we generate random samples of the problem and compute the observed probabilities (Which by appealing to LLN converges to 1/2)
