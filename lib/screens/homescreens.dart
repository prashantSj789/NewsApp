import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:news_app/models/CategoriesNewsModels.dart';
import 'package:news_app/models/News_Headline_Model.dart';
import 'package:news_app/models/news_view_model.dart';
import 'package:news_app/screens/categoriesscreen.dart';
import 'package:news_app/screens/news_detail_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  NewsView newsview = NewsView();
  final format = DateFormat('MMMM dd, yyyy');
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final height = MediaQuery.sizeOf(context).height;
    return Scaffold(
      appBar: AppBar(
        title: Text('NEWS',style: GoogleFonts.rye(color: Colors.black,fontWeight: FontWeight.bold),),
        leading: IconButton(icon: Icon(Icons.grid_3x3),onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>CategoryScreen()));
        },),
      ),
      body: ListView(
        children:[
            SizedBox(
              height: height*0.55,
              width: width,
              child: FutureBuilder<News_Headline_Model>(future: newsview.fetchnewsfromapi(),builder: (context, snapshot) {
                if(snapshot.connectionState==ConnectionState.waiting)
                {
                  return const Center(child: SpinKitCircle(color: Colors.blue,size: 50,));
                }
                else{
                  return PageView.builder(itemCount: snapshot.data!.articles!.length,
                   scrollDirection: Axis.horizontal,
                   
                    itemBuilder: (context,index){
                      DateTime dateTime = DateTime.parse(snapshot.data!.articles![index].publishedAt.toString());
                     return SizedBox(
                      child: Stack(
                        children: [InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(builder: (context)=> NewsDetailScreen(snapshot.data!.articles![index].urlToImage.toString(), snapshot.data!.articles![index].title.toString(), snapshot.data!.articles![index].publishedAt.toString() , snapshot.data!.articles![index].author.toString(), snapshot.data!.articles![index].description.toString(), snapshot.data!.articles![index].content.toString(), snapshot.data!.articles![index].source!.name.toString())));
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: height*0.02,
                            ),
                            height: height*0.4,
                            width: width*0.95,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Card(
                                elevation: 5,
                                shadowColor: Colors.black,
                                child: CachedNetworkImage(imageUrl: snapshot.data!.articles![index].urlToImage.toString(),
                                fit: BoxFit.cover,
                                placeholder: (context,url)=>Container(child: const SpinKitChasingDots(color: Colors.amber,size: 50,),),
                                errorWidget: (context, url, error) => const Icon(Icons.error_outlined,color: Colors.red,),),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 20,
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                              
                            ),
                            elevation: 5,
                            shadowColor: Colors.black,
                            child: Container(
                              alignment: Alignment.bottomCenter,
                              height: height*0.22,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    width: width*0.7,
                                    child: Text(snapshot.data!.articles![index].title.toString(),style: GoogleFonts.merriweather(color: Colors.black,fontSize: 17,fontWeight: FontWeight.bold),maxLines: 3,overflow: TextOverflow.ellipsis,),
                                  ),
                                  Spacer(),
                                  Container(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                           Text(snapshot.data!.articles![index].source!.name.toString(),style: GoogleFonts.poppins(color: Colors.black,fontSize: 12),maxLines: 3,overflow: TextOverflow.ellipsis,),
                                           SizedBox(width: 10,),
                                           Text(format.format(dateTime),style: GoogleFonts.poppins(color: Colors.black,fontSize: 12),maxLines: 3,overflow: TextOverflow.ellipsis,),
                                    ]),
                                  )
                                ],
                              ),
                            ),
                          ),
                        )
                        ]
                      ),

                     );
                  });
                }
              },),
            ),
          SingleChildScrollView(
            child: Padding(padding: EdgeInsets.all(20),
            child: FutureBuilder<CategoriesNewsModel>(future: newsview.fetchcategorynewsfromapi('General'), builder: (context,snapshot){
              if(snapshot.connectionState==ConnectionState.waiting)
              {
                return Center(
                   child: SpinKitCircle(color: Colors.blue,size: 50,),
            
                );
              }
              else{
                return ListView.builder(shrinkWrap: true,itemCount: snapshot.data!.articles!.length,itemBuilder:(context,index){
                  
                   DateTime dateTime = DateTime.parse(snapshot.data!.articles![index].publishedAt.toString());
                   return InkWell(
                    onTap:  () {
                            Navigator.of(context).push(MaterialPageRoute(builder: (context)=> NewsDetailScreen(snapshot.data!.articles![index].urlToImage.toString(), snapshot.data!.articles![index].title.toString(), snapshot.data!.articles![index].publishedAt.toString() , snapshot.data!.articles![index].author.toString(), snapshot.data!.articles![index].description.toString(), snapshot.data!.articles![index].content.toString(), snapshot.data!.articles![index].source!.name.toString())));
                          },
                     child: Padding(padding: EdgeInsets.only(bottom: 20),
                     child: Row(
                      children: [
                        ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Card(
                                  elevation: 5,
                                  shadowColor: Colors.black,
                                  child: CachedNetworkImage(imageUrl: snapshot.data!.articles![index].urlToImage.toString(),
                                  fit: BoxFit.cover,
                                  height: height*0.1,
                                  width: height*0.1,
                                  placeholder: (context,url)=>Container(child: const SpinKitChasingDots(color: Colors.amber,size: 50,),),
                                  errorWidget: (context, url, error) => const Icon(Icons.error_outlined,color: Colors.red,),),
                                ),
                              ),
                              Expanded(child: Column(
                                children: [
                                  Text(snapshot.data!.articles![index].title.toString(),style: GoogleFonts.merriweather(fontSize: 12,fontWeight: FontWeight.bold),maxLines: 2,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(snapshot.data!.articles![index].source!.name.toString(),style: GoogleFonts.poppins(fontSize: 10,),),
                                      Text(format.format(dateTime),style: GoogleFonts.poppins(fontSize: 10,),),
                                    ],
                                  )
                                ],
                              ))
                      ],
                     ),),
                   );
                });
              }
            }),),
          )
        ]
        ),
      );
  }
}