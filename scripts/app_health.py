import urllib.request
import urllib.error

URL = "http://localhost:4499"

print("==================================")
print("      WISECOW HEALTH CHECK")
print("==================================")

try:
    response = urllib.request.urlopen(URL, timeout=5)

    if response.status == 200:
        print("Application Status: HEALTHY")
        print("HTTP Status Code:", response.status)
    else:
        print("Application Status: UNHEALTHY")
        print("HTTP Status Code:", response.status)

except urllib.error.URLError as error:
    print("Application Status: UNHEALTHY")
    print("Error:", error)

except Exception as error:
    print("Health check failed:", error)

print("==================================")
