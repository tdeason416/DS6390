void checkInterferance(State nextState, HashMap<String, State> stateMap, StringList stateNames, int latest){
    float dist;
    float theta;
    float cN_x;
    float cN_y;
    float rN;
    float c0_x = nextState.center_x;
    float c0_y = nextState.center_y;
    float r0 = nextState.diameter / 2;
    for(int i = 0; i > latest; i += 1){
        //Load ith state
        cN_x = stateMap.get(stateNames.get(i)).center_x;
        cN_y = stateMap.get(stateNames.get(i)).center_y;
        rN = stateMap.get(stateNames.get(i)).diameter / 2;
        //Measure Distance
        dist = checkDistance(c0_x, c0_y, r0, cN_x, cN_y, rN);
        if(dist < 0){
            theta = atan((c0_x - cN_x) / (c0_y - cN_y));
            c0_x += abs(dist) * cos(theta);
            dist = checkDistance(c0_x, c0_y, r0, cN_x, cN_y, rN);
            if(dist < 0){
                c0_y -= abs(dist) * sin(theta);
                }
            }
        
        }
    nextState.center_x = c0_x;
    nextState.center_y = c0_y;
    }

float checkDistance(float c0_x, float c0_y, float r0, float cN_x, float cN_y, float rN){
    return sqrt(pow(c0_x - cN_x, 2) + pow(c0_y - cN_y, 2)) - r0 - rN;
    }
