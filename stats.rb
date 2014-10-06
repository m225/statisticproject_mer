# put the data into a array in the file retailsalemd.dat

f = File.new("retailsalemd.dat" , "r")
rs_md = f.readlines
f.close

sum = 0
rs_md.each do |rsale|
	sum = sum + rsale.split(",")[1].to_f
end

mean = sum/301
puts "The mean of the data is: " + mean.to_s
# find the standard deviation
a = []
rs_md.each do |rsale|
	difference = rsale.to_f - mean
	absolute_dif = difference.abs
	a.push absolute_dif
end

b = []
a.each do |rsale|
	squared = rsale**2
	b.push squared
end

squaredtotal = 0
b.each do |rsale|
	squaredtotal = squaredtotal + rsale
end

oneless = 300
sqoneless = squaredtotal/oneless

# take the square root of sqoneless - this is the final standard deviation step

stndeviation = Math.sqrt(sqoneless)

puts "The standard deviation of the data is: " + stndeviation.to_s

# find zscores and store in a new data file
z = []
a.each do |zscore|
	zvalue = zscore/stndeviation
	z.push zvalue.round(3)
end

f = File.new("zvaluelist.csv" , "w")
f.puts z.join("\n")
f.close

# output one column of data points and one column of zscores

dpoints = [rs_md]
zscores = [zvalue]

zscores.each.width_index do |rs_md, i|
	zscores = zvalue[i]
end
