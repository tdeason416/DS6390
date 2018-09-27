void checkInterferance(State nextState, HashMap<String, State> stateMap, StringList stateNames, int latest){
    int i = 0;
    float dist;
    float theta;
    float cN_x;
    float cN_y;
    float rN;
    float c0_x = nextState.center_x;
    float c0_y = nextState.center_y;
    float r0 = nextState.diameter / 2;
    if(c0_x + r0 > width){
        c0_y -= 150;
        c0_x = r0;
        }
    else if(c0_x - r0 < 0){
        c0_x = r0 + random(0, 5);
    }
    if(c0_y + r0 > height){
        c0_y = height - r0 - random(0,10);
        }
    else if(c0_y + r0 < 0){
        c0_y = r0 + random(0, r0 * 2); 
    }
    while(i < latest){
        //Load ith state
        cN_x = stateMap.get(stateNames.get(i)).center_x;
        cN_y = stateMap.get(stateNames.get(i)).center_y;
        rN = stateMap.get(stateNames.get(i)).diameter / 2;
        //Measure Distance
        dist = checkDistance(c0_x, c0_y, r0, cN_x, cN_y, rN);
        i += 1;
        if(dist < 0){
            theta = atan((c0_y - cN_y) / (.1 + (c0_x - cN_x)));

            if(cN_x > c0_x){
              c0_x += random(0,3) +  random(1, 1.25) * ((cN_x - c0_x) + dist * abs(cos(theta))); 
            }
            else{
                c0_x += random(0,3) + random(1, 1.5)*abs(dist * cos(theta));
            }
            dist = checkDistance(c0_x, c0_y, r0, cN_x, cN_y, rN);
            if(dist < 0){
                c0_y -=  random(1.5,3) * abs(dist * (sin(theta))) - random(0,3);
                }
            if(c0_x + r0 > width){
                c0_y -= 50;
                c0_x = r0;
                }
            else if(c0_x - r0 < 0){
                c0_x = r0 + random(0, 10);
            }
            if(c0_y + r0 > height){
                c0_y -= ((c0_y + r0) - height) -  - random(0, r0 * 2);
                c0_x += random(0, r0 * 2);
                }
            else if(c0_y - r0 < 0){
                c0_y = height - r0;
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
