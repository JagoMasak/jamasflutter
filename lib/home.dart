import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:jamas_project/detail.dart';
import 'package:jamas_project/login.dart';
import 'package:jamas_project/siapmasak.dart';
import 'package:jamas_project/sipasaji.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
      body: 
        
           SingleChildScrollView(
             child: Stack(
              children: [
                   
              // Box Orange Atas
                Column(
                  children: [
                    Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        Container(
                          height: 204,
                          width: double.maxFinite,
                          decoration: const BoxDecoration(
                            color: Color(0xffFF9800),
                            image: DecorationImage(
                              image: AssetImage("assets/banner1.png"),
                              fit: BoxFit.cover)
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                   
                 Container(
                    height: 950,
                    child: Column(
                      children: [
                          
                        // Kolom Search Jamas 
                        SizedBox(
                          height: 180,
                        ),
                        Align(
                            alignment: Alignment.center,
                            child: Container(
                                width: 315,
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(offset: Offset(0,4),blurRadius: 4,color: Color(0xff808080).withOpacity(0.15))
                                  ],
                                  borderRadius: BorderRadius.circular(30),
                                  color: Colors.white,
                                  border: Border.all(
                                  width: 1, color: Colors.black.withOpacity(0.3))),
                                child: ListTile(
                                  leading: Icon(
                                    Icons.search,
                                    size: 24,
                                    color: Colors.black,
                                  ),
                                  title: TextField(
                                    decoration: InputDecoration(border: InputBorder.none),
                                    onTap: () {},
                                  ),
                                ))),
                              
                          
                              Flexible(
                                child: Container(
                                  child: Column(
                                    children: [
                                      
                                    //Teks Kategori 
                                  Padding(
                                    padding: EdgeInsets.only(
                                      left: 30,
                                      top: 17
                                    ),
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                        child: Text(
                                        "Kategori",
                                          style: TextStyle(
                                          fontSize: 24,
                                          fontFamily: ("Poppins"),
                                          fontWeight: FontWeight.w600, 
                                          color: Color(0xffFF9800)
                                          ),
                                        ),
                                      ),
                                    ),

                                  SizedBox(
                                    height: 15,
                                  ),     
                                  // Gambar dan teks paket Jamas
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 32
                                    ),
                                    child: SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            Navigator.push(context,
                                            MaterialPageRoute(builder: (context) => SiapMasak()));
                                          },
                                          child: Column(
                                            children: [
                                            Image.asset("assets/Group 45.png", 
                                            width: 168, 
                                            height: 87
                                            ),
                                            Text(
                                              "Paket Siap Masak", 
                                                style: TextStyle(
                                                  fontSize: 15, 
                                                  fontFamily: ("Poppins"), 
                                                  fontWeight: FontWeight.w600
                                                  ),
                                                )
                                              ],
                                            ),
                                        ),
                                        SizedBox(
                                          width: 17,
                                          ),
                                        GestureDetector(
                                          onTap: () {
                                            Navigator.push(context,
                                            MaterialPageRoute(builder: (context) => SiapSaji()));
                                          },
                                          child: Column(
                                            children: [
                                            Image.asset("assets/Group 46.png", 
                                            width: 168, 
                                            height: 87
                                            ),
                                            
                                            Text(
                                              "Paket Siap Saji", 
                                              style: TextStyle(
                                                fontSize: 15, 
                                                fontFamily: ("Poppins"), 
                                                fontWeight: FontWeight.w600
                                                  ),
                                                )
                                              ],
                                            ),
                                        ),
                                        ],
                                      ),
                                    ),
                                  ),
                                        
                                // Teks Produk Terlaris Jamas
                                  Expanded(
                                    child: Container(
                                    height: MediaQuery.of(context).size.height / 1.3,
                                    child: Column(
                                      children:[ Padding(
                                      padding: EdgeInsets.only(
                                        left: 30,
                                        top: 26
                                        ),
                                      child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          "Produk Terlaris Jamas",
                                            style: TextStyle(
                                            fontSize: 24,
                                            fontFamily: ("Poppins"),
                                            fontWeight: FontWeight.w600, 
                                            color: Color(0xffFF9800)),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                          
                                      //  Item Produk Terlaris Jamas
                                      Flexible(
                                        child: Container(
                                          height: double.maxFinite,
                                          child: GridView.builder(
                                            itemCount: 5,
                                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2), 
                                            itemBuilder: (context,index){return 
                                            GestureDetector(
                                              onTap: () {
                                                Navigator.push(context,
                                                MaterialPageRoute(builder: (context) => DetailPages()));
                                              },
                                              child: Container(
                                                margin: EdgeInsets.only(bottom: 20,right: 10,left: 10),
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(15),
                                                  color: Colors.white,
                                                  boxShadow: [
                                                    BoxShadow(offset: Offset(0,10),blurRadius: 10,color: Color(0xff808080).withOpacity(0.15))
                                                  ],
                                                ),
                                                child: Column (
                                                children: [
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  Image.asset("assets/sayurasem 1.png",height: 109,),
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                      left: 8,
                                                      right: 8
                                                    ),
                                                    child: Align(
                                                      alignment: Alignment.centerLeft,     
                                                      child: Text("Sayur Asem",overflow: TextOverflow.ellipsis,maxLines: 1,style: TextStyle(fontSize: 15,fontFamily: "Poppins",fontWeight: FontWeight.w600),                           
                                                      ),
                                                      
                                                    ),
                                                  
                                                  ),
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                      left: 8,
                                                      right: 8
                                                    ),
                                                    child: Align(
                                                      alignment: Alignment.centerLeft,     
                                                      child: Text("Toko Bu Leni",overflow: TextOverflow.ellipsis,maxLines: 1,style: TextStyle(fontSize: 12,fontFamily: "Poppins",fontWeight: FontWeight.w200),                           
                                                      ),
                                                      
                                                    ),
                                                  
                                                  ),
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                      left: 8,
                                                      right: 8
                                                    ),
                                                    child: Align(
                                                      alignment: Alignment.centerRight,     
                                                      child: Text("Rp.7.000",overflow: TextOverflow.ellipsis,maxLines: 1,style: TextStyle(fontSize: 12,fontFamily: "Poppins",fontWeight: FontWeight.w200),                           
                                                      ),
                                                      
                                                    ),
                                                  
                                                  )
                                                ],)
                                              ),
                                            );})))
                                        ]
                                      ),
                                    ),
                                  ),
                                        
                                                        ],
                                                      ),
                                ),
                          )
                          
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
