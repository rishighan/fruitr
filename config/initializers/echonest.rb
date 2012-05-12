ECHONEST_API_KEY = "SKT9XNVNU4VQAJZEE"
ECHONEST_API_SHARED_SECRET =  "gPcisMekQEOC1Ux4sSB+JA"
ECHONEST_CONSUMER_KEY = "0360c63d76f6accd4a066539824d74c7"

# some basic API hooks

#retrieves hotness ratings for an artist
def hotness artist
  url = URI.parse("http://developer.echonest.com/api/v4/artist/hotttnesss?api_key=#{ECHONEST_API_KEY}&name=#{artist}&format=json")
  result = Yajl::HttpStream.get(url)
end

#retrieves all available biographies for an artist
#todo:  
def biography artist
  url = URI.parse("http://developer.echonest.com/api/v4/artist/biographies?api_key=#{ECHONEST_API_KEY}&name=#{artist}&format=json")
  result = Yajl::HttpStream.get(url)
end