USERNAME = "rishighan"
PASSWORD = "rishi984"
API_KEY = '38f5b5a0ff9e6238d11433dc5b4d172e'
API_SECRET  ='2567aade6db63deb1ca8def41682bc06'


def similarArtists artist
  url = URI.parse("http://ws.audioscrobbler.com/2.0/?method=artist.getSimilar&artist=#{artist}&format=json&api_key=#{API_KEY}")
  result = Yajl::HttpStream.get(url) #makes a HTTP GET request on the URL
end

def getLovedTracks username
  url = URI.parse("http://ws.audioscrobbler.com/2.0/?method=user.getlovedtracks&user=#{username}&format=json&api_key=#{API_KEY}")
  result = Yajl::HttpStream.get(url)
  
end