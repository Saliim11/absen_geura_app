import 'package:absen_geura/utils/constant/app_color.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  MainScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.moca,
      body: Stack(
        children: [
          Positioned(
            right: 20,
            top: 20,
            child: CircleAvatar(
              radius: 20,
              backgroundColor: AppColor.darkMoca,
            ),
          ),

          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.3,
                width: double.infinity,
                padding: EdgeInsets.only(bottom: 32, top: 64, left: 40, right: 40),
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColor.merah,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(0, 4),
                        spreadRadius: 1,
                        blurRadius: 8,
                        color: Colors.black.withOpacity(0.8)
                      )
                    ]
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Sudah hadir pada", style: TextStyle(fontSize: 20),),
                              Text("23 Mar 2025", style: TextStyle(fontSize: 16),),
                              Text("at 08.40.03", style: TextStyle(fontSize: 16),),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: 20,
                        decoration: BoxDecoration(
                          color: AppColor.beige,
                          borderRadius: BorderRadius.only(topRight: Radius.circular(20), bottomRight: Radius.circular(20))
                        ),
                      )
                    ],
                  ),
                )
              ),
              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppColor.beige,
                    borderRadius: BorderRadius.vertical(top: Radius.circular(20))
                  ),
                ),
              )
            ],
          )
        ],
      ),

      floatingActionButton: SizedBox(
        height: 50,
        width: 50,
        child: FittedBox(
          child: FloatingActionButton(
            onPressed: () {
              
            },
            backgroundColor: AppColor.darkMoca,
            shape: CircleBorder(),
            child: Icon(Icons.library_add_check_rounded, color: AppColor.beige, size: 30,),
          ),
        ),
      ),
    );
  }
}