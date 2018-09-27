State ST;


HashMap load_year(int year, StringList stateNames, HashMap colorMap, float scaleFactor){
    String iyear = str(year);
    HashMap<String, State> stateObjs = new HashMap<String, State>();
    for(int i = 0; i < stateNames.size() ; i += 1){
        TableRow rowi = loadTable(iyear + "_" + stateNames.get(i) + ".csv", "header").getRow(0);
        ST = new State(rowi, colorMap, scaleFactor);
        stateObjs.put(stateNames.get(i), ST);
        }
    return stateObjs;
  }

//int year = 1995;


//Table this_year = loadTable(year + ".csv", "header");
//  for (TableRow row : this_year.rows()){
//         println(row.getString("state"));
//  }

// Sketch prints:
// 3 total rows in table
// Goat (Capra hircus) has an ID of 0
// Leopard (Panthera pardus) has an ID of 1
// Zebra (Equus zebra) has an ID of 2

//State grab_sate_data(year, idx){
  
  
  
  
//  }

//table = loadTable("1990.csv", "header");




//AK (5.10573511E11) has an ID of 3.4662608E7
//AL (5.3658117E13) has an ID of 1.02071429E12
//AR (1.92079358E12) has an ID of 3.5785728E7
//AZ (3.19156105E13) has an ID of 2.3339E7
//CA (2.63767762E13) has an ID of 7.4168307E14
//CO (2.98149845E12) has an ID of 1.290092E7
//CT (3.594646E13) has an ID of 1.2514794E7
//DC (361043.0) has an ID of 0.0
//DE (5.113479E13) has an ID of 7.6301913E11
//FL (6.0100256E15) has an ID of 1.86426832E8
//GA (6.8545694E13) has an ID of 8301800.0
//HI (2.38187356E10) has an ID of 16163.0
//IA (2.57519413E12) has an ID of 3333900.0
//ID (4.4371992E7) has an ID of 557140.0
//IL (5.4966018E13) has an ID of 1.41989144E12
//IN (9.6925559E13) has an ID of 1.47083714E13
//KS (2.37202597E12) has an ID of 2.502807E7
//KY (7.0500462E13) has an ID of 277960.0
//LA (1.78566872E13) has an ID of 3.9474868E13
//MA (1.13658928E15) has an ID of 6.1327027E9
//MD (2.35098624E14) has an ID of 1.52244349E12
//ME (4.532183E12) has an ID of 507860.0
//MI (6.7066871E13) has an ID of 7.8379562E12
//MN (2.81762794E13) has an ID of 5398390.0
//MO (4.8796795E12) has an ID of 3121090.0
//MS (9.5265279E12) has an ID of 5.919664E7
//MT (1.51196192E12) has an ID of 552550.0
//NC (4.9821595E13) has an ID of 2034650.0
//ND (2.51890028E12) has an ID of 515630.0
//NE (1.26611502E12) has an ID of 3080650.0
//NH (2.95920332E13) has an ID of 0.0
//NJ (7.0578199E13) has an ID of 6.9143248E7
//NM (2.58269276E12) has an ID of 2.738087E7
//NV (1.50532774E13) has an ID of 2.217027E7
//NY (2.59130463E15) has an ID of 2.27243354E12
//OH (1.15832651E14) has an ID of 2.41585644E10
//OK (2.56553465E12) has an ID of 1.82367669E12
//OR (1.3173443E11) has an ID of 8193280.0
//PA (1.06677156E15) has an ID of 2.83388281E12
//RI (185671.0) has an ID of 8769430.0
//SC (2.34118667E13) has an ID of 7875350.0
//SD (2.47251476E10) has an ID of 124080.0
//TN (5.1825605E13) has an ID of 2.24146432E9
//TX (1.20921395E15) has an ID of 1.36234323E15
//UT (3.15229261E12) has an ID of 1.46488181E11
//VA (2.38999025E14) has an ID of 1.134809E7
//VT (2543.0) has an ID of 652810.0
//WA (7.3902791E11) has an ID of 2.88058854E9
//WI (3.31689419E13) has an ID of 3472040.0
//WV (7.764337E13) has an ID of 9.0063176E10
//WY (3.89084663E12) has an ID of 2.68202854E9
