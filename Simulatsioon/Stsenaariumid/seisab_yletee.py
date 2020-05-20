#Koodi aluseks on võetud LGSVL simulaatori dokumentatsioon (https://www.lgsvlsimulator.com/docs/python-api/) ning LGSVL simulaatori githubis asuvad õpetuskriptid (https://github.com/lgsvl/PythonAPI/tree/master/quickstart)


import os
import lgsvl
import random
import time

sim = lgsvl.Simulator(os.environ.get("SIMULATOR_HOST", "127.0.0.1"), 8181)
if sim.current_scene == "Shalun":
  sim.reset()
else:
  sim.load("Shalun")


sim.set_time_of_day(16, fixed=True)

spawns = sim.get_spawn()
forward = lgsvl.utils.transform_to_forward(spawns[0])
right = lgsvl.utils.transform_to_right(spawns[0])

sx = spawns[0].position.x
sy = spawns[0].position.y
ry = spawns[0].rotation.y

state = lgsvl.AgentState()
state.transform.position = spawns[0].position+49*forward + 5.0 * right
state.transform.rotation = spawns[0].rotation

#state.velocity = 5 * forward #Masina kiirus
a = sim.add_agent("AnnabTeed", lgsvl.AgentType.EGO, state) #masin


start = spawns[0].position + 54.0 * forward #+ 7.0 * right
end = spawns[0].position + 59.0 * forward #- 17.0* right
wp = [ lgsvl.WalkWaypoint(start, 10 ),
         lgsvl.WalkWaypoint(end, 0),
       ]

state2 = lgsvl.AgentState()
state2.transform.position = spawns[0].position + 54.0 * forward + 30.0 * right
#state2.transform.rotation.y = spawns[0].rotation.y-90.0

p = sim.add_agent("Pamela", lgsvl.AgentType.PEDESTRIAN, state2)

p.follow(wp,True)
sim.run()

a.state.velocity=0#Masina kiirus
input("Press Enter to start driving") #Simu alustamiseks vajuta enter

sim.run()


