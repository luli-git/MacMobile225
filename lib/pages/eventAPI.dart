import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as prefix0;
import 'package:googleapis/calendar/v3.dart';
import 'package:googleapis/calendar/v3.dart' as prefix1;
import 'package:googleapis_auth/auth_io.dart';
import 'package:flutter_multiselect/flutter_multiselect.dart';
import 'multiSelectChip.dart';
import 'events.dart';

final _credentials = new ServiceAccountCredentials.fromJson(r'''
{
 
  "private_key_id": "0245c094723b7e1e63d895469a529b7e1093ef79",
  "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQCrha9ZlrA1e//Z\npVbU/j2f9uXnf5Plu8PxgVNVjh9JGq8G1miISVVy5YTPK7sOhCu5LcbJdON2xza7\ncGI8mLGZkD29tP8oCdzNG6jrBtoRX/5eq/sDEm6mQCqqiMkTVb6pvFq6dhZ6Asr9\nCai1geu64orjOdx9/VqH26s/DNNu/X6q6GXyVJcsclsbpnkftxjjJGEE2gj7rAAw\nbrspQuLMD3amqe3chJpx3pZU6Fs4YN7dO5PWpmjA58cTFfpTEO9hez4QIkBYw4sl\n6Gym7xfhImQJCoz/5JabKScMc+PbRnUmkJj7xHg2d5dKnH4laKpofAKokwuoRwCI\nlfgj1FDHAgMBAAECggEAI1NNqXRdBy7qIy+nwgc4tuzZLcP7OFnjAabCfIDgVaSO\nvqhC8Cq2VAsMPsTBajxzatiQM+aEgG6ICbOcL+G81iU8aglQcbUSShXzxK/tEp4E\nHAhskpXlvwzBHM0+KGLE+V1HDFcMywUvPE0Ud4lx/NPyidjdXf9jeU6XJs2j8Bwj\n5DQP6GxIUgglc6kIwsJm5FUnPH4QPkuFPHwDBQ11VrnoxHEl+bbVaIea5etCmXci\nXNDv+MbdmKO/K5DMSqCluPN77GN6NG6hgCKgKBjQc+h7+9961BYaFNgaMwvM8+Xe\n9mXeK5Ua4sQZeBCULQy/VOgQKCG0HMRJ0lqinsBWyQKBgQDbyVTJnxa+CONwN7dM\n7o6VODH8WCBcau28cX8YshhHuJYOIAE/PItsGjtgxKzc3Netu416wHkdzTZej/Xh\nv/SxMWsulFzrTRWaYERsn612KSWjPCAXNmJem3oTgZ6UxZZTznuBTRwCO5PVgLyo\nd6gLbdJDoAMqhwizLdpAKwm2qQKBgQDHyI0czenD4/bdFiEadlhJuu9Keq+gehoK\n9cq5zXIB0s2oUpQdU0k6CaqFrWZbgwnkZ1QpucQPSIYGqu/FqgN04pv1p09s42D5\n0GH7VHXAKkfONmOdN5nULeH7RZsI0dRNTaKUxGEBWR/4mTviR42TMrOWsCSZs+Jy\nIx/X2N8h7wKBgQC3tUo8mNBOmWlZ9AgvsrrVOTp2vUaXWP1L5OYiQ0KOOFich93i\n+H1lJ2v4T4xZs/JHEhyIvPa/lTbbxaL1RhiGP1NihLpCJ5VmCw9GaBV6TZxbG7eL\nD3cbswNP6KkfmyQy+sU657QAncHM1KVcf1+j5fC5e7cJxgLcmffyaMbeuQKBgDEK\nKpFSfjpGf/dfEjsjp6JZj5lxqiCzOCdOlDetlXmbHD5gHtlf806axs/Pc5us+8Wk\nE4W2gsjZnYSPexHDHNwZL/1J13Y8DjbkDtkZr1m/Ryb4NNWHq2vo41rBiD/O+dUL\n5Iet+L3S+cUVIBz4QWlLfcfUbveHr2Mi+hMKuiLjAoGAMvjCSuQzQ+ig3u0y2OHO\nbVaU/REec05NVWdUTPlp4X7fM23ZZIfXezN0C99KqDEmO3JyJBV6snFIhtU8q5F3\nsRhMpQMcO2CT0FNI10ItgHnqS4ysQ2VwYMSz1VXnvFdCi+lOfagL3ZRRI33SP1Wy\nlqsJofHHXX/Chd7fGpsgEPY=\n-----END PRIVATE KEY-----\n",
  "client_email": "google-api@macmobile225.iam.gserviceaccount.com",
  "client_id": "113222077522136091308",
  "orderBy": "updated",
  "type": "service_account",
  "singleEvents": "true",

  "maxResults" : "2000"
 
  }''');

const _SCOPES = [CalendarApi.CalendarScope];

class EventApi {
  static List<EventCreate> _allEvents = [];

  static void initEvents() {
    // listOfEvents.add(new EventCreate(eventName: "event 1", eventStartTime: "7:00", eventEndTime: "8:00", eventLocation: "Olin Rice", eventDate: "November 12"));
    //listOfEvents.add(new EventCreate(eventName: "event 2", eventStartTime: "7:00", eventEndTime: "8:00", eventLocation: "Olin Rice", eventDate: "November 12"));
    //listOfEvents.add(new EventCreate(eventName: "event 3", eventStartTime: "7:00", eventEndTime: "8:00", eventLocation: "Olin Rice", eventDate: "November 12"));
    clientViaServiceAccount(_credentials, _SCOPES).then((client) {
      var calendar = new CalendarApi(client);
      calendar.events
          .list('22b3ifdsq64j7c3uvk17523lq8gts1ja@import.calendar.google.com')
          .then((events) {
        for (Event event in events.items) {
          // print(event.start.toJson());
          _allEvents.add(new EventCreate(
            eventName: event.summary,
            eventStartDate: event.start,
            eventEndDate: event.end,
            eventLocation: event.location,
            category: "NA",
          ));
        }
      });
    });
  }

  static List<EventCreate> getAllEvents() {
    //_allEvents.sort();
         //print(_allEvents[3].eventName.toString());

    return _allEvents;
  }
}
