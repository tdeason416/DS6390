void checkInterferance(State nextState, HashMap<String, State> stateMap, StringList stateNames, int latest){
    float dist;
    float theta;
    float cN_x;
    float cN_y;
    float rN;
    float c0_x = nextState.center_x;
    float c0_y = nextState.center_y;
    float r0 = nextState.diameter / 2;
    if(c0_y + r0 > height){
      c0_y = height - 20 - r0;    
    }
    else if(c0_y - r0 < 0){
       c0_y += 500; 
    }
    if(c0_x + r0 > width){
      c0_x = r0;    
    }
    else if(c0_x - r0 < 0){
      c0_x = r0;
    }
    for(int i = 0; i < latest; i += 1){
        //println("poop");
        //Load ith state
        cN_x = stateMap.get(stateNames.get(i)).center_x;
        cN_y = stateMap.get(stateNames.get(i)).center_y;
        rN = stateMap.get(stateNames.get(i)).diameter / 2;
        //Measure Distance
        dist = checkDistance(c0_x, c0_y, r0, cN_x, cN_y, rN);
        if(dist < -1){
            theta = atan((c0_x - cN_x) / (c0_y - cN_y));
            //c0_x += 5 + (abs(dist) * abs(cos(theta)));
            c0_x += 1 + (abs(c0_x - cN_x) - r0*cos(theta) - rN*cos(theta));
            if(c0_x + r0 > width){
                c0_x = r0;
            }
            println(str(dist) + "::" + str(PI * theta / 180)); 
            dist = checkDistance(c0_x, c0_y, r0, cN_x, cN_y, rN);
            if(dist < -1){
                theta = atan((c0_x - cN_x) / (c0_y - cN_y));
                println(str(dist) + "=::=" + str(PI * theta / 180)); 
                //c0_y -= 5 + (abs(dist) * abs(sin(theta)));
                c0_y -= 1 + abs((abs(c0_y - cN_y) - r0*sin(theta) - rN*sin(theta)));
                if(c0_y - r0 < 0){
                   c0_y += 500;
                }
                println(str(checkDistance(c0_x, c0_y, r0, cN_x, cN_y, rN)) + "~=::=~" + str(PI * theta / 180));
                }
            i = 0;
            }
        
        }
    nextState.center_x = c0_x;
    nextState.center_y = c0_y;
    }

float checkDistance(float c0_x, float c0_y, float r0, float cN_x, float cN_y, float rN){
    return sqrt(pow(c0_x - cN_x, 2) + pow(c0_y - cN_y, 2)) - r0 - rN;
    }
