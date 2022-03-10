import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:test1/modules/Shop_App/Login/ShopLoginScreen.dart';
import 'package:test1/network/local/cach_helper.dart';
import 'package:test1/shared/components/components.dart';
import 'package:test1/shared/styles/colors.dart';

class BoardingModel{
  final String image;
  final String title;
  final String body;
  BoardingModel({
    @required this.body,
    @required this.title,
    @required this.image,
  }
  );
}

// ignore: must_be_immutable
class OnBordingScreen extends StatefulWidget {
  @override
  State<OnBordingScreen> createState() => _OnBordingScreenState();
}

class _OnBordingScreenState extends State<OnBordingScreen> {
  var  boardController = PageController();

  List <BoardingModel> boarding=[
    BoardingModel(
      body: "OnBoarding 1 Body",
      image: 'assets/images/onboarding_1.jpg',
      title: 'OnBoarding 1 Title',
    ),
     BoardingModel(
      body: "OnBoarding 2 Body",
      image: 'assets/images/onboarding_2.jpg',
      title: 'OnBoarding 2 Title',
    ),
     BoardingModel(
      body: "OnBoarding 3 Body",
      image: 'assets/images/onboarding_3.jpg',
      title: 'OnBoarding 3 Title',
    ),

  ];
  bool isLast=false;

  void submit(){
    ChacheHelper.saveData(key: 'onBoarding', value: true).then((value){
      if(value){
        navigateAndFinsh(context, ShopLoginScreen());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Title(child: Text("Shoping"),
        color: Colors.grey,),
        actions: [
          TextButton(onPressed: (){submit();}, child: Text("Skip",style: TextStyle(color: default_Color),))
        ],
      ),
      body: Column(
        children: 
        [
          Expanded(
          
            child: PageView.builder(
              onPageChanged: (index){
                if(index ==boarding.length-1){
                  setState(() {
                    isLast=true;
                  });
                }
                else{
                  isLast=false;
                }
                
              },
              controller: boardController,
              physics: BouncingScrollPhysics(),
              itemBuilder: (context, index
              ) => buildBoardingItem(boarding[index]),
            itemCount:boarding.length ,),
          ),
          
        ],
      )
    );
  }

  Widget buildBoardingItem(BoardingModel model)=>Padding(
    padding: const EdgeInsets.all(20.0),
    child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: 
          [
            Container(
              height: 500,
              child: Image(
                image: 
                  AssetImage('${model.image}'),
                  fit: BoxFit.fill,
                  
                  ),
            ),
            SizedBox(height: 30,),
            Text(
              '${model.title}',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
            SizedBox(height: 15,),
            Text('${model.body}',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
            ),
             SizedBox(height: 30,),
            Row(
              children: 
              [
               SmoothPageIndicator(
                 controller: boardController,
                 count: boarding.length,
                 effect: ExpandingDotsEffect(
                   dotColor: Colors.grey,
                   spacing: 5,
                   expansionFactor: 4,
                   dotHeight: 10,
                   activeDotColor:default_Color, 
                 ),
               ),
                Spacer(),
                FloatingActionButton(
                  onPressed: (){
                    if(isLast){
                     submit();
                    }
                    else{
                       boardController.nextPage(duration: Duration(milliseconds: 800), curve: Curves.fastLinearToSlowEaseIn);
                    }
                   
                  },
                  child: Icon(Icons.arrow_forward_ios)
                )
              ],
            )
          ],
        ),
  );
}