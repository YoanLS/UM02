class Champ {
  String  year;
  String mvp;
  String mvpf;
  String dpoy;
  String sman;
  String mip;
  String coy;
  String roy;
  String champion;




  Champ(TableRow row) {

    
    //TableRow row pour appeler tout la lib de fonction utilisé a l'interieur
    year = row.getString("Years");
    mvp = row.getString("MVP");
    mvpf = row.getString("Finals MVP");
    dpoy = row.getString("DPOY");
    sman = row.getString("Sixth man");
    mip = row.getString("MIP");
    coy = row.getString("COY");
    roy = row.getString("ROY");
    champion = row.getString("Champions");
 
  }
}
