import 'package:flutter/material.dart';

class DetailPages extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset("assets/sayur.png"),
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
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topRight: Radius.circular(30),topLeft: Radius.circular(30))
                ),
                height: 400,
                width: double.infinity,
                child: Padding(
                  padding: EdgeInsets.only(
                    top: 42,
                    left: 33
                  ),

                  child: Column(
                  children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text("Sayur Asem",style: TextStyle(fontSize: 27,fontFamily: "Poppins",fontWeight: FontWeight.w600),)),
                  Padding(
                    padding: EdgeInsets.only(
                      top: 10
                    ),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text("Sayur asam atau sayur asem adalah masakan sejenis sayur yang khas Indonesia. Ada banyak variasi lokal sayur asam seperti sayur asam Jakarta, sayur asam kangkung, dan sayur asam ikan asin.",overflow: TextOverflow.ellipsis,maxLines: 3,style: TextStyle(fontSize: 16,fontFamily: "Poppins",fontWeight: FontWeight.w400),)),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: 49
                    ),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text("Harga Produk",style: TextStyle(fontSize: 20,fontFamily: "Poppins",fontWeight: FontWeight.w600),)),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: 6
                    ),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text("Rp.10.000",style: TextStyle(fontSize: 16,fontFamily: "Poppins",fontWeight: FontWeight.w700),)),
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: EdgeInsets.only(left: 30,right: 60),
                    child: MaterialButton(
                      height: 60,
                      minWidth: double.infinity,
                      color: Colors.green[600],
                      onPressed: () {},
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)),
                      child: Text("Pesan Sekarang",style: TextStyle(fontSize: 18,fontFamily: "Poppins",fontWeight: FontWeight.w600,color: Colors.white,),),
                    ),
                  )
                  ],
                ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}