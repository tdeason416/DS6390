# ws://stream.meetup.com/2/rsvps

import websocket
# from kafka import KafkaProducer
from datetime import timedelta, datetime, date
import time
import json

ws = websocket.create_connection("ws://stream.meetup.com/2/rsvps")


end_time = datetime.now() + timedelta(hours=1)
out_file = "data/meetups.txt"

while True:
    result_json = ws.recv()
    payload = json.loads(result_json)
    if "group_state" not in payload["group"]:
        payload["group"]["group_state"] = "N/A"

    # for key in payload.keys():
    #     print(key)
    #     print("\t", payload[key])
    #     print('\n\n')
    # print('=============')
    out_line = ""
    out_line += str(payload["event"]["event_name"]) + ": "
    out_line += str(payload['group']['group_name']) + " -- "
    out_line += str(payload["group"]["group_city"]) + ","
    out_line += str(payload["group"]["group_state"]) + ","
    out_line += str(payload["group"]["group_country"]).upper() + "\n"

    open(out_file, 'a').write(out_line)

    time.sleep(1)


    
ws.close()