import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:news_app/models/CategoriesNewsModels.dart';
import 'package:news_app/models/news_view_model.dart';
import 'package:news_app/screens/news_detail_screen.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  NewsView newsview = NewsView();
  final format = DateFormat('MMMM dd, yyyy');
  String  categoryName = 'General';

  List<String> categoriedlist = [
    'General',
    'Entertainment',
    'Health',
    'Sports',
    'Business',
    'Technoloy'
  ];
  @override
  Widget build(BuildContext context) {
      final width = MediaQuery.sizeOf(context).width;
    final height = MediaQuery.sizeOf(context).height;
    return Scaffold(
      appBar: AppBar(
      ),
      body: Padding(padding: const EdgeInsets.symmetric(horizontal:20),
      child: Column(
        children: [
          SizedBox(height: 20,),
          SizedBox(
            height: 50,
            child: ListView.builder(scrollDirection: Axis.horizontal,
               itemCount: categoriedlist.length,
              itemBuilder: (context,index){
              return InkWell(
                onTap: (){
                  categoryName=categoriedlist[index];
                  setState(() {});
                },
                child: Padding(padding: const EdgeInsets.only(right: 12),
                child: Container(
                  decoration: BoxDecoration(
                    color: categoryName==categoriedlist[index]?Colors.blue:Colors.grey,
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: Padding(padding: EdgeInsets.symmetric(horizontal: 12),child: 
                  Center(child: Text(categoriedlist[index],style: GoogleFonts.poppins(color: Colors.white,fontWeight: FontWeight.bold),)),),
                ),),
              );
            }),
          ),
          SizedBox(height:20),
          Expanded(child: 
          FutureBuilder<CategoriesNewsModel>(future: newsview.fetchcategorynewsfromapi(categoryName), builder: (context,snapshot){
            if(snapshot.connectionState==ConnectionState.waiting)
            {
              return Center(
                 child: SpinKitCircle(color: Colors.blue,size: 50,),

              );
            }
            else{
              return ListView.builder(itemCount: snapshot.data!.articles!.length,itemBuilder:(context,index){
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
          }))
        ],
      ),),

    );
  }
}