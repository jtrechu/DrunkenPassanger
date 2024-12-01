
#First, we'll define a function that takes an element at random from a vector
#and returns both the element, and the vector without the element
take_random_element <- function(vec) {
  # Check if the vector is not empty
  if(length(vec) == 0) {
    stop("The vector is empty")
  }
  
  # Generate a random index
  random_index <- sample(seq_along(vec), 1)
  
  # Get the random element
  random_element <- vec[random_index]
  
  # Remove the random element from the vector
  vec <- vec[-random_index]
  
  # Return both the element and the updated vector
  list(element = random_element, remaining_vector = vec)
}

##SIMULATION

prob <- c()
v <- c(10,50,100,500,1000,1500,2000,3000,5000,10000,15000,17500,20000,22500,25000,27500,30000,35000)
for (p in 1:length(v)) {
k<-v[p]
results <- c()

for (j in 1:k){

seats <- 1:100 #The available seats in the plane

#Now, the drunk passanger (suppoused to be seated at seat 1) will choose a seat randomly
l<-take_random_element(seats)
occupied <- c(l$element)
vacant <- l$remaining_vector

#Now for passangers 2 thru 100 if their seat is vacant they'll take it. 
for (i in 2:100){
  if (i %in% vacant) {
    occupied <-c(occupied,i)
    vacant <- vacant[vacant != i]
  } #If it isn't they'll act "drunk" and take a seat at random from the remaining ones 
  else{aux<- take_random_element(vacant)
    occupied <- c(occupied,aux$element)
    vacant <- aux$remaining_vector
  }
}
#We check wether the last passanger sat at seat #100
results<- c(results,occupied[100]==100)}
#And compute \hat{p} the estimated probability
prob[p] <- sum(results)/k}

##Graphical Representation
plot(v,prob,ylim = c(0.35,0.65), main = "Simulation for the Drunker Passanger Problem using LLN", ylab = "Estimated Probability", xlab = "Iteraions of the experiment")
abline(h = 0.5, col = "red", lty = 2, lwd = 2)
lines(v,prob, col = "blue", lwd = 2)
legend("topright",legend=c("Observed Probability","Actual Probability") ,col = c("blue", "red"),lty = c(1, 2),lwd = 2)
