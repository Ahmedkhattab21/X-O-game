import 'dart:math';

import 'package:flutter/material.dart';

class Player{
  static const  x="X";
  static const o="O";

  static const empty=[];

  static List<int> Playerx=[];
  static List<int> Playero=[];

}

extension Containall on List{
  bool ConntainAll(int x,int y,[z]){
    if(z==null){
      return (contains(x) && contains(y));
    }else{
    return (contains(x) && contains(y) && contains(z));
    }
  }
}

class Game{
  void playgame(int index, String activeplayer) {
    if(activeplayer=="X"){
      Player.Playerx.add(index);
    }else if(activeplayer=="O"){
      Player.Playero.add(index);
    }
  }
  String checkwinner(){
    String Winner="";
     if(Player.Playerx.ConntainAll(0, 1, 2) ||
        Player.Playerx.ConntainAll(3, 4, 5) ||
        Player.Playerx.ConntainAll(6, 7, 8) ||
        Player.Playerx.ConntainAll(0, 3, 6) ||
        Player.Playerx.ConntainAll(1, 4, 7) ||
        Player.Playerx.ConntainAll(2, 5, 8) ||
        Player.Playerx.ConntainAll(0, 4, 8) ||
        Player.Playerx.ConntainAll(2, 4, 6)){
       Winner="X";
    }else if(Player.Playero.ConntainAll(0, 1, 2) ||
         Player.Playero.ConntainAll(3, 4, 5) ||
         Player.Playero.ConntainAll(6, 7, 8) ||
         Player.Playero.ConntainAll(0, 3, 6) ||
         Player.Playero.ConntainAll(1, 4, 7) ||
         Player.Playero.ConntainAll(2, 5, 8) ||
         Player.Playero.ConntainAll(0, 4, 8) ||
         Player.Playero.ConntainAll(2, 4, 6)){
       Winner="O";
     }else{
       Winner=" ";
     }
    return Winner;
  }

  autoplay(activeplayer){
    int index=0;
    List<int> emptycells=[];

    for(int i=0 ;i<9 ; i++){
      if(!Player.Playerx.contains(i) && !Player.Playero.contains(i)){
        emptycells.add(i);
      }
    }

    //.....................start   center
    if(Player.Playero.ConntainAll(0, 1) && emptycells.contains(2)){
      index=2;
    }
    else if( Player.Playero.ConntainAll(3, 4) && emptycells.contains(5)){
    index=5;
    }
    else if( Player.Playero.ConntainAll(6,7) && emptycells.contains(8)){
      index=8;
    }
    else if( Player.Playero.ConntainAll(0, 3) && emptycells.contains(6)){
      index=6;
    }
    else if( Player.Playero.ConntainAll(1, 4) && emptycells.contains(7)){
      index=7;
    }
    else if( Player.Playero.ConntainAll(2, 5) && emptycells.contains(8)){
      index=8;
    }
    else if( Player.Playero.ConntainAll(0, 4) && emptycells.contains(8)){
      index=8;
    }
    else if( Player.Playero.ConntainAll(2, 4) && emptycells.contains(6)){
      index=6;
    }
    //center ...end
    else if(Player.Playero.ConntainAll(1, 2) && emptycells.contains(0)){
      index=0;
    }
    else if( Player.Playero.ConntainAll(4,5) && emptycells.contains(3)){
      index=3;
    }
    else if( Player.Playero.ConntainAll(7,8) && emptycells.contains(6)){
      index=6;
    }
    else if( Player.Playero.ConntainAll(3,6) && emptycells.contains(0)){
      index=0;
    }
    else if( Player.Playero.ConntainAll(4,7) && emptycells.contains(1)){
      index=1;
    }
    else if( Player.Playero.ConntainAll( 5,8) && emptycells.contains(2)){
      index=2;
    }
    else if( Player.Playero.ConntainAll( 4,8) && emptycells.contains(0)){
      index=0;
    }
    else if( Player.Playero.ConntainAll(4,6) && emptycells.contains(2)){
      index=2;
    }
    // start..end
    else if(Player.Playero.ConntainAll(0, 2) && emptycells.contains(1)){
      index=1;
    }
    else if( Player.Playero.ConntainAll(3, 5) && emptycells.contains(4)){
      index=4;
    }
    else if( Player.Playero.ConntainAll(6,8) && emptycells.contains(7)){
      index=7;
    }
    else if( Player.Playero.ConntainAll(0, 6) && emptycells.contains(3)){
      index=3;
    }
    else if( Player.Playero.ConntainAll(1, 7) && emptycells.contains(4)){
      index=4;
    }
    else if( Player.Playero.ConntainAll(2, 8) && emptycells.contains(5)){
      index=5;
    }
    else if( Player.Playero.ConntainAll(0, 8) && emptycells.contains(4)){
      index=4;
    }
    else if( Player.Playero.ConntainAll(2, 6) && emptycells.contains(4)){
      index=4;
    }


    //.....................start   center
    else if(Player.Playerx.ConntainAll(0, 1) && emptycells.contains(2)){
      index=2;
    }
    else if( Player.Playerx.ConntainAll(3, 4) && emptycells.contains(5)){
      index=5;
    }
    else if( Player.Playerx.ConntainAll(6,7) && emptycells.contains(8)){
      index=8;
    }
    else if( Player.Playerx.ConntainAll(0, 3) && emptycells.contains(6)){
      index=6;
    }
    else if( Player.Playerx.ConntainAll(1, 4) && emptycells.contains(7)){
      index=7;
    }
    else if( Player.Playerx.ConntainAll(2, 5) && emptycells.contains(8)){
      index=8;
    }
    else if( Player.Playerx.ConntainAll(0, 4) && emptycells.contains(8)){
      index=8;
    }
    else if( Player.Playerx.ConntainAll(2, 4) && emptycells.contains(6)){
      index=6;
    }
    //center ...end
    else if(Player.Playerx.ConntainAll(1, 2) && emptycells.contains(0)){
      index=0;
    }
    else if( Player.Playerx.ConntainAll(4,5) && emptycells.contains(3)){
      index=3;
    }
    else if( Player.Playerx.ConntainAll(7,8) && emptycells.contains(6)){
      index=6;
    }
    else if( Player.Playerx.ConntainAll(3,6) && emptycells.contains(0)){
      index=0;
    }
    else if( Player.Playerx.ConntainAll(4,7) && emptycells.contains(1)){
      index=1;
    }
    else if( Player.Playerx.ConntainAll( 5,8) && emptycells.contains(2)){
      index=2;
    }
    else if( Player.Playerx.ConntainAll( 4,8) && emptycells.contains(0)){
      index=0;
    }
    else if( Player.Playerx.ConntainAll(4,6) && emptycells.contains(2)){
      index=2;
    }
    // start..end
    else if(Player.Playerx.ConntainAll(0, 2) && emptycells.contains(1)){
      index=1;
    }
    else if( Player.Playerx.ConntainAll(3, 5) && emptycells.contains(4)){
      index=4;
    }
    else if( Player.Playerx.ConntainAll(6,8) && emptycells.contains(7)){
      index=7;
    }
    else if( Player.Playerx.ConntainAll(0, 6) && emptycells.contains(3)){
      index=3;
    }
    else if( Player.Playerx.ConntainAll(1, 7) && emptycells.contains(4)){
      index=4;
    }
    else if( Player.Playerx.ConntainAll(2, 8) && emptycells.contains(5)){
      index=5;
    }
    else if( Player.Playerx.ConntainAll(0, 8) && emptycells.contains(4)){
      index=4;
    }
    else if( Player.Playerx.ConntainAll(2, 6) && emptycells.contains(4)){
      index=4;
    }
    else{
    Random R=Random();
    int cellindex= R.nextInt(emptycells.length);
    index=emptycells[cellindex];
    }

    playgame(index, activeplayer);

  }


}