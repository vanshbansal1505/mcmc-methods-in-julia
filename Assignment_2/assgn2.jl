using Random, Plots, Distributions
function sphere(p)
	x=AbstractFloat[]
	su=0
	for i in 1:p
		t = rand()
		push!(x, t)
		su+= (t)^2
	end
	if su<=1
		return su
	end
	sphere(p)
end
scatter([sphere(2) for x in 1:1000])

function trunorm(a)
  U = rand()
  Y = rand(Normal())
  if ((-a<Y)&&(Y<a))
    return Y
  else
    trunorm()
  end
end
