import 'package:flutter/material.dart';
void main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Calculator(),
  ));
}
class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {

  int firstnum;
  int secondnum;
  String texttodiaplay = "";
  String res;
  String operatortopperform;
  void btnClicked(String btnval){

    if(btnval=="C"){
      texttodiaplay="";
      firstnum=0;
      secondnum=0;
      res ="" ;
    }
    else if(btnval == "+" || btnval == "-" || btnval == "x" || btnval == "/"){
      firstnum = int.parse(texttodiaplay);
      res = "";
      operatortopperform= btnval;
    }
    else if(btnval == "="){
      secondnum = int.parse(texttodiaplay);
      if(operatortopperform == "+"){
        res= (firstnum + secondnum).toString();
      }
      if(operatortopperform == "-"){
        res= (firstnum - secondnum).toString();
      }
      if(operatortopperform == "x"){
        res= (firstnum * secondnum).toString();
      }
      if(operatortopperform == "/"){
        res= (firstnum / secondnum).toString();
      }

    }
    else{
      res = int.parse(texttodiaplay + btnval).toString();
      }

    setState(() {
      texttodiaplay=res;
    });


  }



// custombutton
  Widget custombutton( String btnval ){
    return Expanded(
      child: OutlineButton(
        padding: EdgeInsets.all(25.0),
        onPressed: ()=> btnClicked(btnval),
        child: Text("$btnval", style: TextStyle(fontSize: 25.0),),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text("Calculator"),
       backgroundColor: Colors.deepOrange,
      ),

// body =========================================================

      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Expanded(
              child: Container(
                padding: EdgeInsets.all(10.0),
                alignment: Alignment.topRight,

                child: Text("$texttodiaplay",
                  style: TextStyle(fontSize: 30.0,
                      fontWeight: FontWeight.bold),),
              ),
            ),
            Row(
              children: <Widget>[
                custombutton("9"),
                custombutton("8"),
                custombutton("7"),
                custombutton("+"),
              ],
            ),
            Row(
              children: <Widget>[
                custombutton("6"),
                custombutton("5"),
                custombutton("4"),
                custombutton("-"),
              ],
            ),
            Row(
              children: <Widget>[
                custombutton("3"),
                custombutton("2"),
                custombutton("1"),
                custombutton("x"),
              ],
            ),
            Row(
              children: <Widget>[
                custombutton("C"),
                custombutton("0"),
                custombutton("="),
                custombutton("/"),
              ],
            ),


          ],
        ),
      ),

    );
  }
}
