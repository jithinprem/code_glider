import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:code_glider/functions/arbiratary.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  static const String id = 'homescreen';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    int progress_val = 40;
    int projects_val = 3;



    return MaterialApp(
      theme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(
            title: Text(
              'CodeGlider',
              style: GoogleFonts.poppins(),
            ),
            leading: const Icon(
              FontAwesomeIcons.plane,
            )),
        body: SafeArea(
          child: Column(
            children: <Widget>[

              Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: 5, left: 5, right: 5),
                    width: MediaQuery.of(context).size.width,
                    height: 120,
                    decoration: BoxDecoration(
                        color: Colors.grey[900],
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(left: 10, top: 10),
                          child: Text(
                            get_comment_completed(progress_val+projects_val),
                            style: GoogleFonts.poppins(),
                            textAlign: TextAlign.left,
                          ),
                        ),
                        Progressbars(context, 'Chapters', progress_val),
                        Progressbars(context, 'Projects', projects_val),
                      ],
                    ),
                  ),
                ],
              ),

              SizedBox(
                height: 250,
                width: double.infinity,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    TheSquareBox(),
                    TheSquareBox(),
                    TheSquareBox(),
                    TheSquareBox(),
                    TheSquareBox(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TheSquareBox extends StatelessWidget {
  var func_perform;
  String? main_text;
  String? subtitle;
  var image;
  TheSquareBox({
    Key? key,
    this.func_perform,
    this.main_text,
    this.subtitle,
    this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            blurRadius: 2.0,
            spreadRadius: 2,
            offset: Offset(
              20,
              20,
            ),
          ),
        ],
        borderRadius: BorderRadius.all(Radius.circular(15)),
        color: Colors.grey[800],
      ),
      margin: EdgeInsets.only(left: 7, top: 30),
      height: 80,
      width: 160,
    );
  }
}

Widget Progressbars(@required context, String txt, int perc){
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Container(
        margin: EdgeInsets.only(left: 10, top: 10),
        child: Text(
          txt,
          style: GoogleFonts.poppins(),
          textAlign: TextAlign.left,
        ),
      ),
      Padding(
        padding: EdgeInsets.only(top: 6.0),
        child: LinearPercentIndicator(
          width: MediaQuery.of(context).size.width*70/100,
          animation: true,
          lineHeight: 15.0,
          animationDuration: 2500,
          percent: perc/100,
          center: Text("$perc.0%", style: GoogleFonts.poppins(fontSize: 10, color: Colors.grey[900]),),
          barRadius: Radius.circular(30),
          progressColor: perc > 5 ? Colors.green : Colors.orange.shade200,
        ),
      ),
    ],
  );
}