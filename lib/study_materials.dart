import 'package:flutter/material.dart';

class StudyMaterials extends StatelessWidget {
  const StudyMaterials({super.key});

  @override
  Widget build(BuildContext context) {
    return
      // IntrinsicHeight(
      // child:
      Material(
        elevation: 4.0,
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: Colors.blue[50],
        child: Container(
          height: 220.0,
          padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          child:
          Column(
            children: [
              Row(
                children: [
                  Flexible(
                      child: Row(
                        children: [
                          Icon(Icons.folder),
                          SizedBox(width: 5.0),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [Text('AI'), Text('02, Feb, 2023',
                              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 12, color: Colors.grey[700]),
                            )],
                          ),
                        ],
                      )),
                  Flexible(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(onPressed: (){}, icon: Icon(Icons.remove_red_eye)),
                          // SizedBox(width: 5.0),
                          IconButton(onPressed: (){}, icon: Icon(Icons.download))],
                      )),
                ],
              ),

              Divider(),
              Row(
                children: [
                  Flexible(
                      child: Row(
                        children: [
                          Icon(Icons.folder),
                          SizedBox(width: 5.0),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [Text('OS'), Text('02, Feb, 2023',
                              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 12, color: Colors.grey[700]),
                            )],
                          ),
                        ],
                      )),
                  Flexible(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(onPressed: (){}, icon: Icon(Icons.remove_red_eye)),
                          // SizedBox(width: 5.0),
                          IconButton(onPressed: (){}, icon: Icon(Icons.download))],
                      )),
                ],
              ),
              Divider(),
              Row(
                children: [
                  Flexible(
                      child: Row(
                        children: [
                          Icon(Icons.note),
                          SizedBox(width: 5.0),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [Text('InformationSecurity_Lec01.pdf',

                            ), Text('04, Feb, 2023',
                              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 12, color: Colors.grey[700]),
                            )],
                          ),
                        ],
                      )),
                  Flexible(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(onPressed: (){}, icon: Icon(Icons.remove_red_eye)),
                          // SizedBox(width: 5.0),
                          IconButton(onPressed: (){}, icon: Icon(Icons.download))],
                      )),
                ],
              ),
              Container(
                child: IconButton(
                  icon: Icon(Icons.expand_more),
                  onPressed: (){},
                ),
              )
            ],
          ),

        ),
      )

      // ,
    // )
    ;
  }
}
