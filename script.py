import urllib, json
from random import randint

# Get number
url = "http://xkcd.com/info.0.json"
response = urllib.urlopen(url)
data = json.load(response)
num = randint(0, data["num"])

# Get xkcd
url = "http://xkcd.com/" + str(num) +"/info.0.json"
response = urllib.urlopen(url)
data = json.load(response)

print json.dumps(data, indent=4)