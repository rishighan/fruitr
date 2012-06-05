# Rishi Ghan
# rishighan.com
# some basic ECHONEST API hooks
# Please give credit if you are using this.

require 'net/http'
ECHONEST_API_KEY = "SKT9XNVNU4VQAJZEE"
ECHONEST_API_SHARED_SECRET =  "gPcisMekQEOC1Ux4sSB+JA"
ECHONEST_CONSUMER_KEY = "0360c63d76f6accd4a066539824d74c7"
RESULTS = 8


# From Wikipedia:

# In statistics, dependence refers to any statistical relationship between two random variables or two sets of data. 
# Correlation refers to any of a broad class of statistical relationships involving dependence.

# Formally, dependence refers to any situation in which random variables do not satisfy a mathematical 
# condition of probabilistic independence. In loose usage, correlation can refer to any departure of two or
# more random variables from independence, but technically it refers to any of several more specialized types 
# of relationship between mean values. There are several correlation coefficients, often denoted ρ or r, measuring 
# the degree of correlation. The most common of these is the Pearson correlation coefficient, which is sensitive only
# to a linear relationship between two variables (which may exist even if one is a nonlinear function of the other). 
# Other correlation coefficients have been developed to be more robust than the Pearson correlation – that is,
# more sensitive to nonlinear relationships.

# Correlation Co-efficient Definition:    
#  A measure of the strength of linear association between two variables. 
#  Correlation will always between -1.0 and +1.0. 
#  If the correlation is positive, we have a positive relationship. 
#  If it is negative, the relationship is negative.

# Matrix multiplication
def arrayMultiply arr1, arr2
  #arr1.inject(0) {|c,i| c + arr1[i]*arr2[i]}
  result = Array.new()
  result = arr1.zip(arr2).map {|x,y| x * y}
  result.reduce(:+)
end

# taken without modification from http://blog.chrislowis.co.uk/2008/11/24/ruby-gsl-pearson.html
# note the use of inject
def ruby_pearson(x,y)
  n=x.length

  sumx=x.inject(0) {|r,i| r + i}
  sumy=y.inject(0) {|r,i| r + i}

  sumxSq=x.inject(0) {|r,i| r + i**2}
  sumySq=y.inject(0) {|r,i| r + i**2}

  prods=[]; x.each_with_index{|this_x,i| prods << this_x*y[i]}
  pSum=prods.inject(0){|r,i| r + i}

  # Calculate Pearson score
  num=pSum-(sumx*sumy/n)
  den=((sumxSq-(sumx**2)/n)*(sumySq-(sumy**2)/n))**0.5
  if den==0
    return 0
  end
  r=num/den
  return r
end


def parseURL url
  purl = URI.parse(url) # parse the URL 
  response = Net::HTTP.get_response(purl)
  json = JSON.parse(response.body)
end

#retrieves hotness ratings for an artist
def hotness artist
  url = "http://developer.echonest.com/api/v4/artist/hotttnesss?api_key=#{ECHONEST_API_KEY}&name=#{artist}&format=json"
  result = parseURL url
  result["response"]["artist"]["hotttnesss"]
end

# retrieves familiarity for an artist
# Get our numerical estimation of how familiar an artist currently is to the world.
# todo:  limit results
def familiarity artist
  url = "http://developer.echonest.com/api/v4/artist/familiarity?api_key=#{ECHONEST_API_KEY}&name=#{artist}&format=json"
  result = parseURL url
  result["response"]["artist"]["familiarity"]
end

# retrieves all available biographies for an artist
# todo:  limit results
def biography artist
  url = "http://developer.echonest.com/api/v4/artist/biographies?api_key=#{ECHONEST_API_KEY}&name=#{artist}&format=json"
end

# Return similar artists given one or more artists for comparison. 
# The Echo Nest provides up-to-the-minute artist similarity and recommendations from their 
# real-time musical and cultural analysis of what people are saying across the Internet and what 
# the music sounds like.
def similar artist
  url = "http://developer.echonest.com/api/v4/artist/similar?api_key=#{ECHONEST_API_KEY}&name=#{artist}&format=json&start=0&results=#{RESULTS}"
  parseURL url
  #also get their hotness?
end


# Get a list of most descriptive terms for an artist
def terms artist
  url = URI.parse("http://developer.echonest.com/api/v4/artist/terms?api_key=#{ECHONEST_API_KEY}&name=#{artist}&format=json")
  
end
