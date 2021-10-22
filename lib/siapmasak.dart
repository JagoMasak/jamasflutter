import 'package:flutter/material.dart';
import 'package:jamas_project/detail.dart';

class SiapMasak extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
      body: 
        Column(
          children : [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children :[
                                  
                                    Padding(
                                    padding: EdgeInsets.only(
                                      left: 30,
                                      top: 33
                                    ),
                                    child: IconButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      icon: Icon(Icons.arrow_back,color: Color(0xffFF9800),))), 
                                    Padding(
                                    padding: EdgeInsets.only(
                                      right: 30,
                                      top: 36
                                      ),
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        "Paket Siap Masak",
                                          style: TextStyle(
                                          fontSize: 24,
                                          fontFamily: ("Poppins"),
                                          fontWeight: FontWeight.w600, 
                                          color: Color(0xffFF9800)),
                                        ),
                                      ),
                                    ),
                                  ]
                                ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                   Expanded(
                                     child: Container(
                                          height: MediaQuery.of(context).size.height,
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
                                            );})),
                                   )           
                                  //  Item Produk Terlaris Jamas
                                
                                  
                                     
                                   
                                    
                                  
                                
                            
                    
                            
                        
                    
                      
                  
                
            
          
          ],
        ),
      
      )
    );
  }
}
