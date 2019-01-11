ArrayList<Champ> champs;

Table table;
Table tableHeader;

void setup() {
  size(800, 800);

  champs = new ArrayList<Champ>();
  table = loadTable("nba.csv", "header");
  tableHeader = loadTable("nba.csv");
  //frame.setResizable(true);
  println(table.getRowCount() + "total Rows in a table");

  //on stocke dans artists les artist de l'objet Artist
  for (TableRow row : table.rows()) {
    champs.add(new Champ(row));
    //la ligne du dessus fait les etapes suivantes:
    //String artist = row.getString("Artist");
    //float primaryWork = row.getFloat("Primary Work");
    //float sleep = row.getFloat("Sleep");
    //float socialMeals = row.getFloat("Social and Meals");
    //float exercice = row.getFloat("Exercise");
    //float OtherWorks = row.getFloat("Other works");
    //float MakingEndsMeet = row.getFloat("Making ends meet");
    //String Occupation = row.getString("Occupation");
    
  }
}
  
void draw(){
  background(255);
  int hMargin = 15; //marge à gauche
  int vMargin = 15; //marge dessus/dessous
  
  fill(254,178,76);
  rect(hMargin,vMargin,width - 2* hMargin,height/6 - 3*vMargin);
  
  textSize(20);
  textAlign(CENTER);
  fill(0);
  text("Who has dominated NBA ?", width/2, 5.5*hMargin);
 
  textSize(30);
  textAlign(CENTER);
  fill(0);
  text("Who has won NBA's titles since 83's ?", width/2, 3.5*hMargin);
  
  fill(255);
  rect(100, height/6-vMargin, width-150-2*vMargin, 5*height/6);
  
  fill(190);
  for (int i =0; i<8; i =i+1){
    rect(100, height/6-vMargin + i*5*height/(6*8), width-150-2*vMargin, 5*height/(6*2*8));   
  }
  
  int Cha = champs.size() ;
  int absrect = 100 + (width-100-2*vMargin)/2;
  int ordrect = height/6+vMargin;
  int pasrect = 5*height/48;
  
  //mise en forme des titres
  textSize(25);
  textAlign(CENTER);
  fill(0);
  text("Most Valuable Player", absrect, ordrect + 2*pasrect);
  text("Finals Most Valuable Player", absrect, ordrect + pasrect);
  text("Defensive Player of the Year", absrect, ordrect + 4*pasrect);
  text("Best Sixth Man", absrect, ordrect + 7*pasrect);
  text("Most Improved Player", absrect, ordrect + 5*pasrect);
  text("Rookie Of the Year", absrect, ordrect + 6*pasrect);
  text("Coach Of the Year", absrect, ordrect + 3*pasrect);
  text("NBA Champions Team", absrect, ordrect );

  textSize(12);
  textAlign(CENTER);
  fill(0);
  text("Most", width-40, +height/6);
  text("Important", width-40, 10+height/6);
  text("Less", width-40,  -35+height);
  text("Important", width-40,  -25+height);
  beginShape();
  noFill();
  vertex(width-25, 35+height/6);
  vertex(width-40, 25+height/6);
  vertex(width-55, 35+height/6);
  endShape();
  line(width-40, 25+height/6,width-40,-50+height);


  
  //ligne des années
  float i = 0;
  float pas = (height*5)/(6*(Cha -0.3));
  for (Champ champ : champs){
    textAlign(CENTER,CENTER);
    fill(0);
    if (mouseX<100-hMargin && mouseX>hMargin && mouseY>pas*i-10+height/6 && mouseY<pas*i+height/6 ) {
      textSize(20);
      if(mousePressed){
        textSize(25);
        text(champ.mvp, absrect, ordrect + 2.35*pasrect);
        text(champ.mvpf, absrect, ordrect + 1.35*pasrect);
        text(champ.dpoy, absrect, ordrect + 4.35*pasrect);
        text(champ.sman, absrect,ordrect + 7.35*pasrect);
        text(champ.mip, absrect,ordrect + 5.35*pasrect);
        text(champ.roy, absrect,ordrect + 6.35*pasrect);
        text(champ.coy, absrect,ordrect + 3.35*pasrect);
        text(champ.champion, absrect, ordrect + 0.35*pasrect);
      }
    }
    else {
      textSize(8);
    }
    
    if(mousePressed && mouseX<100-hMargin && mouseX>hMargin && mouseY>pas*i-10+height/6 && mouseY<pas*i+height/6 ){
      fill(0);
    }
    else{
      fill(120);
    }
    
    text(champ.year,50, pas*i-10+height/6);

    i=i+1;
  }
//année qui défilent sur le côté quand on clique ça affiche les champions les plus importants en gros si le joueur a gagné 
//il apparait différemment 
//Ajouter une légende

  strokeWeight(1);
  stroke(0); 
    
}
