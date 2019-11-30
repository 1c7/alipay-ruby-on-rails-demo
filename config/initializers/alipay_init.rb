# require 'alipay'

# # setup the client to communicate with either production API or sandbox API
# # https://openapi.alipay.com/gateway.do (Production)
# # https://openapi.alipaydev.com/gateway.do (Sandbox)
# API_URL =  'https://openapi.alipaydev.com/gateway.do' # 沙箱

# # setup your own credentials and certificates
# APP_ID = '2016101600699094'
# APP_PRIVATE_KEY="-----BEGIN RSA PRIVATE KEY-----
# MIIEowIBAAKCAQEApc4bW+9rm584xskt9y1GX98WqRNNQTiWh6kstVQKja/TNW4Q
# wPFbShA+VdUgT67Je2HwS9fJ9YN1iklk/38lRKAMtQbDdC+W1tUmN8cUZ1dW6MkG
# nWUyRnPQXpoL/MezlZPc1fmJwKhcfly/3bv1XIzSAoonC0ypg8D4YJygCjim27yS
# j5RQcFhW0txlUnbo7XO9meILkzEXMMbl51PV779X9WK3KVg1R9OPXr5ZtFvdlrgZ
# bj75NAVjvKVCli+hj0GP+Fy6zPHHoux648r1VrHhhvP0WyDle9LCtvn7dcW7Pqvw
# 6hUICJOeKld2BON424lmwqrYoxPUY0ZnopjWFwIDAQABAoIBAHs3Ss+sghx5W9km
# Ynlg9P6ELDPjuzKv2fXg+++ZD+qxclUvgVXRR1Un8xsYMlXk/6goZUoHh/djBTOK
# TXstwsVX53mUGCY8w2zNpAQpdvlBR73gvoCzVoRSxtO2yRfGVKfg5WlCc2Nv+qSR
# Sqh+aN2pbNwkTNWx1/uoqSwq2SgeNTRUYiXdyDYb28cZbsH1TRxOoKYdU3WdKSZw
# biEx20r5NjUmPmqs4lCNMp8b2Bn/AwS8V1VHIwYdmfihPOyfwABjQTUXxfIiv0SQ
# /qgKnHSYKIZTL0KfGSNpcCbjuFyTKXfDA+OtUom4YsBJGtozgPc1Ey5sPnuyo53N
# 3GypSNECgYEA1nGjmo/Sk+TrVWmf8HWO+SAVrlu+agVev5TOYwhWSwcnZmkhG3xn
# UV8nWAV+1hyt5ggjIPvHXaI6FjQ+a0cZvAUcgDYDdcP1UNQDbnlEJm8IqgGn91ev
# tMXn4mak5db+YEJr5Tc+UKd9npb2CJjOyctG4Bq+nR/VEu5DmuIHcGkCgYEAxe+K
# 6ywYLpj0jTWMozokkCeL9qZN7Qe9SrJOo4aFVnzmFrgItzVvsHJppMS45H6ARKs/
# hzYrThA0wVry74U47qM8u6ffYUXPHDVJcYr3piAFiJTiKL9Otbr58B4v/TPzgNYz
# whh1aN7EAd/cePwLisvVHkiDNgqG9IvlAsjlQn8CgYAaij/0Th6CvU8+5+6qhPIn
# 9QeZ57LeTkHWtiUA7rQ3XvBKZXJ6g2AKGxu0ciGrgCspkBJA78hR11UXEGo1Prx5
# n6xSVd0BwznmQgcWsh10IEPTPpc6LnkJh4DWbVu1MnGTGkVePgMRWllaulZC5B6b
# rPPdopG6wojNaf2l+plvGQKBgEl8HFwhG705Bhni1prG/EoUlI72wRmN9QXlWvK0
# /43TguzOWFYEXbnpUDVe37HdESvtVAGT59HsjFl4tZadJDzcl7Cnq3QGodS8J88i
# o7ymSMejVq+ADu3DRAWUf4aGohGj9MVLpVNQ2P5FKSo1kOdvs2ixzRzkHaRux5AY
# G51rAoGBAJYMec3wf1X52PLUHSxw9LF9kIfDzQ1OiWe7LQipfNQ4hEj06qKV7pUV
# /Z3+wrQtvQmWSdkeQHt+D8GrmMIdp/0fhKaTC0vqrn3TfkY8mcQ2UZXSbRUYmFr2
# uTeyTsDYvpAQ+rDfR2WVy8K3f1isUvZSqdAC2jZxOIal6UVyYmc5
# -----END RSA PRIVATE KEY-----
# "
# ALIPAY_PUBLIC_KEY="MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAp7h72xx8N0lIF5TO8FzjKZZY0/vlyCvN/MfilHbBb9bb19qkqXtpPon9yB+InkTW8JXIVeaqCxAq8x2avpB+RXoxTludLwMksC/DTXtbRCc2UpIyGyoRpbdhKzOJ/wDPUfITl8CA2mc3u3E5Ise6N9GPFZgvGbHAC5ObIMMCWTyhRHx8HXoqreh32orDtJik8w4GgtLDfB3GbGBiEy0AAR/4kqPRCI7yXD1ONyBDrgOIys7laSFz5CUYoDDBttMKUdGnXN1V6ykMxz8Qi1lzh1A0tRvlXww9wzfI6W9GoUDPWmxr8V/6I/yVA1JlC8PJD2bJe7P/yNq7xgCkk7Zr3wIDAQAB"

# # initialize a client to communicate with the Alipay API
# @client = Alipay::Client.new(
#   url: API_URL,
#   app_id: APP_ID,
#   app_private_key: APP_PRIVATE_KEY,
#   alipay_public_key: ALIPAY_PUBLIC_KEY
# )

# @haha = '12312312'