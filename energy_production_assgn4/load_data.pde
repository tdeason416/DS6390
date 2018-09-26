HashMap load_year(String year){
    Table this_year = loadTable(year + ".csv", "header");
    HashMap<String,State> states = new HashMap<String, State>();
    for (TableRow row : this_year.rows()){
        states.put(row.getString("state"), new State(row));
        }
  }
