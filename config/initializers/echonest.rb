ECHONEST_API_KEY = "SKT9XNVNU4VQAJZEE"
ECHONEST_API_SHARED_SECRET =  "gPcisMekQEOC1Ux4sSB+JA"
ECHONEST_CONSUMER_KEY = "0360c63d76f6accd4a066539824d74c7"

# Rishi Ghan
# some basic ECHONEST API hooks
# Please give credit if you are using this.

#retrieves hotness ratings for an artist
def hotness artist
  url = URI.parse("http://developer.echonest.com/api/v4/artist/hotttnesss?api_key=#{ECHONEST_API_KEY}&name=#{artist}&format=json")
  json = Yajl::HttpStream.get(url)
  result = json["response"]["artist"]["hotttnesss"]
end

# retrieves familiarity for an artist
# Get our numerical estimation of how familiar an artist currently is to the world.
# todo:  limit results
def familiarity artist
  url = URI.parse("http://developer.echonest.com/api/v4/artist/familiarity?api_key=#{ECHONEST_API_KEY}&name=#{artist}&format=json")
  result = Yajl::HttpStream.get(url)
end

# retrieves all available biographies for an artist
# todo:  limit results
def biography artist
  url = URI.parse("http://developer.echonest.com/api/v4/artist/biographies?api_key=#{ECHONEST_API_KEY}&name=#{artist}&format=json")
  result = Yajl::HttpStream.get(url)
end

# Return similar artists given one or more artists for comparison. 
# The Echo Nest provides up-to-the-minute artist similarity and recommendations from their 
# real-time musical and cultural analysis of what people are saying across the Internet and what 
# the music sounds like.
def similar artist
  url = URI.parse("http://developer.echonest.com/api/v4/artist/similar?api_key=#{ECHONEST_API_KEY}&name=#{artist}&format=json&start=0")
  result = Yajl::HttpStream.get(url)
end


# Get a list of most descriptive terms for an artist
def terms artist
  url = URI.parse("http://developer.echonest.com/api/v4/artist/terms?api_key=#{ECHONEST_API_KEY}&name=#{artist}&format=json")
  result = Yajl::HttpStream.get(url)
end