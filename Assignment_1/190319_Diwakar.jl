using Distributions
A = Int64[]
m = readline()      #number of samples
m = parse(Int64, m) 
l = readline()      #value of lambda
l = parse(Float64, l) 


for i in 1:m
    x=0
    p=exp(-l)
    P_sum = p
    U = rand()     #uniform draw between 0 and 1
    while(1>0)
        if U<P_sum
            push!(A,x)   #collecting the random variables
            break
        else
            p = p*(l/(x+1))
            P_sum = P_sum + p
            x = x+1
            end
    end 
end


using Statistics
mean(A)

var(A)

using Plots

histogram(A)

len = length(A)

function binomial_draw(n,p)
    
    c_array = Float64[]
    for i in 0:n            #to find the c 
        temp = binomial(n,i)*(p^i)*(1-p)^(n-i)*factorial(i)*(l^(-i))*exp(l)   
        push!(c_array,temp)
    end
    c = findmax(c_array) + 0.001
    accept = 0
    while accept == 0
        U = rand()
        prop = A[rand(1,len)]
        
        bi_value = binomial(n,prop)*(p^prop)*(1-p)^(n-prop)
        poi_value = ((l^(prop))*exp(-l))/factorial(prop)
        ratio = bi_value/(c*poi_value)
        
        if U<ratio
            accept = 1
            value = prop
        end
    end
    return value
end


binomial_draw(10,0.5)


