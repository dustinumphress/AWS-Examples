import redis
import ssl

HOST = "my-cache-ab-1463-chn3i5.serverless.use1.cache.amazonaws.com"
PORT = 6379

r = redis.Redis(
    host=HOST,
    port=PORT,
    ssl=True,                 # False if in-transit encryption is off
    ssl_cert_reqs=ssl.CERT_NONE,
    socket_connect_timeout=5,
)

print("PING ->", r.ping())
