# Logic Operators Program in Ruby

# Print header for first--unary operators--table
puts "p ownNot(p)"
#       0

# Function to convert input to a Boolean
def ownNot(p)
  if p==1 
    return '0'
  else
    return '1'
  end
end

for p in 0..1
  puts p.to_s + ' ' + ownNot(p)
end

# ".to_s" 'hard types' a character string to a String; p in "p.to_s" is the VAR.

#PARMs
#Boolean Truth Table (BTT) CHECK:= [[0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1], [0,0,0,0,1,1,1,1,0,0,0,0,1,1,1,1], [0,0,1,1,0,0,1,1,0,0,1,1,0,0,1,1], [0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1]]
#  Declare BTT cell locations
$BTT = Array.new(2)    #p (1st) ROWS/width index:           Possible values {0,1} => dim = 2.
$BTT[0]=Array.new(2)     #q (2nd) COLUMNS/height index {p=0}: Possible values {0,1} => dim = 2.
$BTT[1]=Array.new(2)       #q (2nd) DEPTH index {p=1}:          
for p in 0..1                #cube: 2x2x16 (0..1)(0..1)(0,..15).
  for q in 0..1
    $BTT[p][q]=Array.new(16)   #Return value at [p,q]: to be an Operator.
  end
end

#  Set BTT cell location indices
$zero=0; $and=1; $andNot=2; $first=3; $rImpl=4; $second=5; $xor=6; $or=7
$nor=8; $eq=9; $not2nd=10; $Impl=11; $not1st=12; $notAnd=13; $Nand=14; $One=15

#  Set BTT value at each cell location
$BTT[0][0][$zero]=0   #00 1
$BTT[0][1][$zero]=0   #00 2
$BTT[1][0][$zero]=0   #00 3
$BTT[1][1][$zero]=0   #00 4
$BTT[0][0][$and]=0    #01 1
$BTT[0][1][$and]=0    #01 2
$BTT[1][0][$and]=0    #01 3
$BTT[1][1][$and]=1    #01 4
$BTT[0][0][$andNot]=0 #02 1
$BTT[0][1][$andNot]=0 #02 2
$BTT[1][0][$andNot]=1 #02 3
$BTT[1][1][$andNot]=0 #02 4
$BTT[0][0][$first]=0  #03 1
$BTT[0][1][$first]=0  #03 2
$BTT[1][0][$first]=1  #03 3
$BTT[1][1][$first]=1  #03 4
$BTT[0][0][$rImpl]=0  #04 1
$BTT[0][1][$rImpl]=1  #04 2
$BTT[1][0][$rImpl]=0  #04 3
$BTT[1][1][$rImpl]=0  #04 4
$BTT[0][0][$second]=0 #05 1
$BTT[0][1][$second]=1 #05 2
$BTT[1][0][$second]=0 #05 3
$BTT[1][1][$second]=1 #05 4
$BTT[0][0][$xor]=0    #06 1
$BTT[0][1][$xor]=1    #06 2
$BTT[1][0][$xor]=1    #06 3
$BTT[1][1][$xor]=0    #06 4
$BTT[0][0][$or]=1     #07 1
$BTT[0][1][$or]=0     #07 2
$BTT[1][0][$or]=0     #07 3
$BTT[1][1][$or]=1     #07 4
$BTT[0][0][$nor]=1    #08 1
$BTT[0][1][$nor]=0    #08 2
$BTT[1][0][$nor]=0    #08 3
$BTT[1][1][$nor]=0    #08 4
$BTT[0][0][$eq]=1     #09 1
$BTT[0][1][$eq]=0     #09 2
$BTT[1][0][$eq]=0     #09 3
$BTT[1][1][$eq]=1     #09 4
$BTT[0][0][$not2nd]=1 #10 1
$BTT[0][1][$not2nd]=0 #10 2
$BTT[1][0][$not2nd]=1 #10 3
$BTT[1][1][$not2nd]=0 #10 4
$BTT[0][0][$Impl]=1   #11 1
$BTT[0][1][$Impl]=0   #11 2
$BTT[1][0][$Impl]=1   #11 3
$BTT[1][1][$Impl]=1   #11 4
$BTT[0][0][$not1st]=1 #12 1
$BTT[0][1][$not1st]=1 #12 2
$BTT[1][0][$not1st]=0 #12 3
$BTT[1][1][$not1st]=0 #12 4
$BTT[0][0][$notAnd]=1 #13 1
$BTT[0][1][$notAnd]=1 #13 2
$BTT[1][0][$notAnd]=0 #13 3
$BTT[1][1][$notAnd]=1 #13 4
$BTT[0][0][$Nand]=1   #14 1
$BTT[0][1][$Nand]=1   #14 2
$BTT[1][0][$Nand]=1   #14 3
$BTT[1][1][$Nand]=0   #14 4
$BTT[0][0][$One]=1    #15 1
$BTT[0][1][$One]=1    #15 2
$BTT[1][0][$One]=1    #15 3
$BTT[1][1][$One]=1    #15 4

# Construct output per row
def buildString(p,q)
  someVar = ''
  for i in 0..15
    someVar += ' ' + $BTT[p][q][i].to_s #Note: introduces leading space, added before each entry except last one.
  end
  return someVar
end

# Print Header for second--binary operators--table
puts "p q Zero And andNot first rImpl second Xor Or Nor Eq not2nd Impl not1st notAnd Nand One";
#         0    1   2      3     4     5      6   7  8   9  10     11   12     13     14   15
# <no>.chr produces the ASCII character with <no> index (e,g., 65.chr = "A")

# Print BTT output (rows under Header, previously printed)
#    Calls buildString(p,q)
for p in 0..1
  for q in 0..1
    puts p.to_s + ' ' + q.to_s + buildString(p,q) #Note: omits trailing space.
  end               #next p
end               #next q


# Output: 
# p ownNot(p)                                                                                                                                                                                       
# 0 1                                                                                                                                                                                          
# 1 0                                                                                                                                                                                          
# p q Zero And andNot first rImpl second Xor Or Nor Eq not2nd Impl not1st notAnd Nand One                                                                                                      
# 0 0 0 0 0 0 0 0 0 1 1 1 1 1 1 1 1 1                                                                                                                                                          
# 0 1 0 0 0 0 1 1 1 0 0 0 0 0 1 1 1 1                                                                                                                                                          
# 1 0 0 0 1 1 0 0 1 0 0 0 1 1 0 0 1 1                                                                                                                                                          
# 1 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1  

