# zwift
Zwift hassio addon

Installation:
- Create a folder under hassio addon folder.
- Copy all files to the new folder.
- Reload hassio addons
- Now you should find the addon "Zwift App" under local store
- Click install
- Configure the addon with username, password etc and then start the addon.

If you are not logged in to Zwift with any device the addon will stop after 60s.
So add a switch that call addon to start when you are connected to Zwift.

More info: https://www.portabit.se/hassio-addon-zwift-app/

To control light I use Node-Red to control the light. Import this for an example. 

[{"id":"54a3f96a.1043","type":"server-state-changed","z":"1290a59c.c75732","name":"Zwift Zoner","server":"9e40a9b0.10865","version":1,"entityidfilter":"sensor.zwift_sensor_power","entityidfiltertype":"exact","outputinitially":false,"state_type":"num","haltifstate":"","halt_if_type":"str","halt_if_compare":"is","outputs":1,"output_only_on_state_change":true,"x":110,"y":140,"wires":[["97e10d83.18f05"]]},{"id":"cddd8e63.85525","type":"api-call-service","z":"1290a59c.c75732","name":"ZON1","server":"9e40a9b0.10865","service_domain":"light","service":"turn_on","data":"{\"entity_id\":\"light.hue\",\"color_name\":\"orange\"}","mergecontext":"","output_location":"","output_location_type":"none","mustacheAltTags":false,"x":610,"y":96,"wires":[[]]},{"id":"8430851f.914ae8","type":"api-call-service","z":"1290a59c.c75732","name":"ZON2","server":"9e40a9b0.10865","service_domain":"light","service":"turn_on","data":"{\"entity_id\":\"light.hue\",\"color_name\":\"blue\"}","mergecontext":"","output_location":"","output_location_type":"none","mustacheAltTags":false,"x":730,"y":118,"wires":[[]]},{"id":"955327de.56fa6","type":"api-call-service","z":"1290a59c.c75732","name":"ZON3","server":"9e40a9b0.10865","service_domain":"light","service":"turn_on","data":"{\"entity_id\":\"light.hue\",\"color_name\":\"green\"}","mergecontext":"","output_location":"","output_location_type":"none","mustacheAltTags":false,"x":610,"y":140,"wires":[[]]},{"id":"be7c3c56.002ce8","type":"api-call-service","z":"1290a59c.c75732","name":"ZON4","server":"9e40a9b0.10865","service_domain":"light","service":"turn_on","data":"{\"entity_id\":\"light.hue\",\"color_name\":\"yellow\"}","mergecontext":"","output_location":"","output_location_type":"none","mustacheAltTags":false,"x":730,"y":161,"wires":[[]]},{"id":"b9062e4a.b2c71","type":"api-call-service","z":"1290a59c.c75732","name":"ZON5","server":"9e40a9b0.10865","service_domain":"light","service":"turn_on","data":"{\"entity_id\":\"light.hue\",\"color_name\":\"orangered\"}","mergecontext":"","output_location":"","output_location_type":"none","mustacheAltTags":false,"x":610,"y":184,"wires":[[]]},{"id":"5b330059.6ef4d8","type":"api-call-service","z":"1290a59c.c75732","name":"ZON6","server":"9e40a9b0.10865","service_domain":"light","service":"turn_on","data":"{\"entity_id\":\"light.hue\",\"color_name\":\"red\"}","mergecontext":"","output_location":"","output_location_type":"none","mustacheAltTags":false,"x":730,"y":201,"wires":[[]]},{"id":"7a8ee7bd.0a1258","type":"comment","z":"1290a59c.c75732","name":"Zwift styrning av zoner","info":"","x":140,"y":76,"wires":[]},{"id":"97e10d83.18f05","type":"function","z":"1290a59c.c75732","name":"FTP-ZON","func":"var ftp=255;\nvar zon;\nvar watt=msg.payload;\nvar zon1=ftp*0.55;\nvar zon2=ftp*0.74;\nvar zon3=ftp*0.89;\nvar zon4=ftp*1.04;\nvar zon5=ftp*1.2;\n\nif (watt < zon1) {\n        zon= 'a';\n    }  \nif (watt > zon1 & watt < zon2) {\n        zon= 'b';\n    }  \nif (watt > zon2 & watt < zon3) {\n        zon= 'c';\n    }\nif (watt > zon3 & watt < zon4) {\n        zon= 'd';\n    }\nif (watt > zon4 & watt < zon5) {\n        zon= 'e';\n    }\nif (watt > zon5) {\n        zon= 'f';\n    }  \nmsg.payload = zon;\nreturn msg;","outputs":1,"noerr":0,"x":280,"y":140,"wires":[["1f9ef59.2aa298a"]]},{"id":"1f9ef59.2aa298a","type":"switch","z":"1290a59c.c75732","name":"Switch","property":"payload","propertyType":"msg","rules":[{"t":"eq","v":"a","vt":"str"},{"t":"eq","v":"b","vt":"str"},{"t":"eq","v":"c","vt":"str"},{"t":"eq","v":"d","vt":"str"},{"t":"eq","v":"e","vt":"str"},{"t":"eq","v":"f","vt":"str"}],"checkall":"true","repair":false,"outputs":6,"x":430,"y":140,"wires":[["cddd8e63.85525"],["8430851f.914ae8"],["955327de.56fa6"],["be7c3c56.002ce8"],["b9062e4a.b2c71"],["5b330059.6ef4d8"]]},{"id":"9e40a9b0.10865","type":"server","z":"","name":"Home Assistant","legacy":false,"hassio":true,"rejectUnauthorizedCerts":true,"ha_boolean":"y|yes|true|on|home|open"}]

