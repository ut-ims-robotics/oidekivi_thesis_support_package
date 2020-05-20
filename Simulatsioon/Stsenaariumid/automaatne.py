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
state.transform.position = spawns[0].position+20*forward + 5.0 * right
state.transform.rotation = spawns[0].rotation

state.velocity = 5 * forward #Masina kiirus
a = sim.add_agent("Automaatne", lgsvl.AgentType.EGO, state) #masin

input("Press Enter to start driving") #Simu alustamiseks vajuta enter

sim.run(25)


