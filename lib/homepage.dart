import 'package:flutter/Material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ox_game_app/game_logic.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String activeplayer="X";
  bool gameover=false;
  String result=" ";
  int turns=0;
  Game game=Game();


  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: MediaQuery.of(context).orientation==Orientation.portrait?Column(
          children: [
            ...buildtop(),
            buildExpanded(context),
            ...builddown(),

          ],
        ):Row(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ...buildtop(),
                  SizedBox(height: 10,),
                  ...builddown(),
                ],
              ),
            ),
            buildExpanded(context),
          ],
        ),
      ),
    );
  }

  Expanded buildExpanded(BuildContext context) {
    return Expanded(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: GridView.count(
                mainAxisSpacing:10,
                crossAxisSpacing:10,
               childAspectRatio:2/1.5,
                crossAxisCount: 3,
              children: List.generate(9, (index) =>InkWell(
                borderRadius: BorderRadius.circular(15),
                onTap:gameover? null:()=>_ontap(index),
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).shadowColor,
                    borderRadius: BorderRadius.circular(15),

                  ),
                  child: Center(child: Text(
                    Player.Playerx.contains(index)?"X":Player.Playero.contains(index)?"O":"",
                  style: TextStyle(color:Player.Playerx.contains(index)?Colors.white:Colors.pinkAccent),)),
                ),
              ),),
          ),
            ),);
  }

  List<Widget> buildtop() {
    return[
      SwitchListTile.adaptive(
      title: Text(
        "turns off/ on  two players",
        textAlign: TextAlign.center,
      ),
      value: isSwitched,
      onChanged: (newval) {
        setState(() {
          isSwitched = newval;
        });
      },
    ),
      Text(
        "IT'S $activeplayer TURN",
        style: TextStyle(fontSize: 42, color: Colors.white),
        textAlign: TextAlign.center,
      ),

    ];
  }
  List<Widget> builddown() {
    return[
      Text(
        "$result",
        style: TextStyle(fontSize: 42, color: Colors.white),
        textAlign: TextAlign.center,
      ),
      ElevatedButton.icon(
        onPressed: () {
          setState(() {
            Player.Playerx=[];
            Player.Playero=[];
            activeplayer="X";
            gameover=false;
            result="";
            turns=0;
          });
        },
        icon: Icon(Icons.repeat),
        label: Text("repeat the game"),
      ),
    ];
  }


  _ontap(int index) {
    if((Player.Playerx.isEmpty|| !Player.Playerx.contains(index)) &&
        (Player.Playero.isEmpty|| !Player.Playero.contains(index)) ){
      game.playgame(index,activeplayer);
      updatestate();
    }
    if(!isSwitched && !gameover && turns!=9){
      game.autoplay(activeplayer);
      updatestate();
    }

  }
  void updatestate(){
    setState(() {
      activeplayer=activeplayer=="X"?"O":"X";
      turns++;
      String gamewinner= game.checkwinner();
      if(gamewinner !=" "){
        result="$gamewinner is the Winner";
        gameover=true;

      }else if(turns==9 && gamewinner==" " && !gameover){
        result="IT'S Draw";
        gameover=true;

      }
    });
  }
}
