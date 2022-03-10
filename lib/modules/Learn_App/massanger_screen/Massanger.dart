import 'package:flutter/material.dart';

class Massenger extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Row(
          children: [
            CircleAvatar(
              radius: 20.0,
              backgroundImage: NetworkImage(
                  "https://cdn.vox-cdn.com/thumbor/WCH_hpmDktgoM_vsNb4QGWr2s8k=/0x104:438x396/1400x1050/filters:focal(0x104:438x396):format(jpeg)/cdn.vox-cdn.com/imported_assets/846336/steve-jobs.jpeg"),
            ),
            SizedBox(
              width: 20,
            ),
            Text(
              "Chats",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        actions: [
          Row(
            children: [
              CircleAvatar(
                backgroundColor: Colors.grey[300],
                radius: 20,
                child: Icon(
                  Icons.camera_alt,
                  color: Colors.black,
                ),
              ),
              SizedBox(
                width: 20,
              ),
              CircleAvatar(
                radius: 20,
                backgroundColor: Colors.grey[300],
                child: Icon(
                  Icons.edit,
                  color: Colors.black,
                ),
              ),
            ],
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.only(left: 10),
                height: 35,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    15.0,
                  ),
                  color: Colors.grey[300],
                ),
                child: Row(
                  children: [
                    Icon(Icons.search),
                    SizedBox(
                      width: 10,
                    ),
                    Text("Search"),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              //************ this comments is the code without List View  ***********/
              // SingleChildScrollView(
              //   scrollDirection: Axis.horizontal,
              //   child: Row(
              //     children: [
              //       Container(
              //         width: 70,
              //         child: Column(
              //           crossAxisAlignment: CrossAxisAlignment.start,
              //           children: [
              //             Stack(
              //               alignment: Alignment.bottomRight,
              //               children: [
              //                 CircleAvatar(
              //                   radius: 30.0,
              //                   backgroundImage: NetworkImage(
              //                       "https://cdn.vox-cdn.com/thumbor/WCH_hpmDktgoM_vsNb4QGWr2s8k=/0x104:438x396/1400x1050/filters:focal(0x104:438x396):format(jpeg)/cdn.vox-cdn.com/imported_assets/846336/steve-jobs.jpeg"),
              //                 ),
              //                 Padding(
              //                   padding: const EdgeInsetsDirectional.only(
              //                     bottom: 2,
              //                     end: 2,
              //                   ),
              //                   child: CircleAvatar(
              //                     radius: 7.0,
              //                     backgroundColor: Colors.red,
              //                   ),
              //                 ),
              //               ],
              //             ),
              //             Text(
              //               "Stev Jobs ",
              //               maxLines: 1,
              //               overflow: TextOverflow.ellipsis,
              //             ),
              //           ],
              //         ),
              //       ),
              //       SizedBox(
              //         width: 10.0,
              //       ),
              //       Container(
              //         width: 70,
              //         child: Column(
              //           crossAxisAlignment: CrossAxisAlignment.start,
              //           children: [
              //             Stack(
              //               alignment: Alignment.bottomRight,
              //               children: [
              //                 CircleAvatar(
              //                   radius: 30.0,
              //                   backgroundImage: NetworkImage(
              //                       "https://cdn.vox-cdn.com/thumbor/WCH_hpmDktgoM_vsNb4QGWr2s8k=/0x104:438x396/1400x1050/filters:focal(0x104:438x396):format(jpeg)/cdn.vox-cdn.com/imported_assets/846336/steve-jobs.jpeg"),
              //                 ),
              //                 Padding(
              //                   padding: const EdgeInsetsDirectional.only(
              //                     bottom: 2,
              //                     end: 2,
              //                   ),
              //                   child: CircleAvatar(
              //                     radius: 7.0,
              //                     backgroundColor: Colors.red,
              //                   ),
              //                 ),
              //               ],
              //             ),
              //             Text(
              //               "Stev Jobs ",
              //               maxLines: 1,
              //               overflow: TextOverflow.ellipsis,
              //             ),
              //           ],
              //         ),
              //       ),
              //       SizedBox(
              //         width: 10.0,
              //       ),
              //       Container(
              //         width: 70,
              //         child: Column(
              //           crossAxisAlignment: CrossAxisAlignment.start,
              //           children: [
              //             Stack(
              //               alignment: Alignment.bottomRight,
              //               children: [
              //                 CircleAvatar(
              //                   radius: 30.0,
              //                   backgroundImage: NetworkImage(
              //                       "https://cdn.vox-cdn.com/thumbor/WCH_hpmDktgoM_vsNb4QGWr2s8k=/0x104:438x396/1400x1050/filters:focal(0x104:438x396):format(jpeg)/cdn.vox-cdn.com/imported_assets/846336/steve-jobs.jpeg"),
              //                 ),
              //                 Padding(
              //                   padding: const EdgeInsetsDirectional.only(
              //                     bottom: 2,
              //                     end: 2,
              //                   ),
              //                   child: CircleAvatar(
              //                     radius: 7.0,
              //                     backgroundColor: Colors.red,
              //                   ),
              //                 ),
              //               ],
              //             ),
              //             Text(
              //               "Stev Jobs ",
              //               maxLines: 1,
              //               overflow: TextOverflow.ellipsis,
              //             ),
              //           ],
              //         ),
              //       ),
              //       SizedBox(
              //         width: 10.0,
              //       ),
              //       Container(
              //         width: 70,
              //         child: Column(
              //           crossAxisAlignment: CrossAxisAlignment.start,
              //           children: [
              //             Stack(
              //               alignment: Alignment.bottomRight,
              //               children: [
              //                 CircleAvatar(
              //                   radius: 30.0,
              //                   backgroundImage: NetworkImage(
              //                       "https://cdn.vox-cdn.com/thumbor/WCH_hpmDktgoM_vsNb4QGWr2s8k=/0x104:438x396/1400x1050/filters:focal(0x104:438x396):format(jpeg)/cdn.vox-cdn.com/imported_assets/846336/steve-jobs.jpeg"),
              //                 ),
              //                 Padding(
              //                   padding: const EdgeInsetsDirectional.only(
              //                     bottom: 2,
              //                     end: 2,
              //                   ),
              //                   child: CircleAvatar(
              //                     radius: 7.0,
              //                     backgroundColor: Colors.red,
              //                   ),
              //                 ),
              //               ],
              //             ),
              //             Text(
              //               "Stev Jobs ",
              //               maxLines: 1,
              //               overflow: TextOverflow.ellipsis,
              //             ),
              //           ],
              //         ),
              //       ),
              //       SizedBox(
              //         width: 10.0,
              //       ),
              //       Container(
              //         width: 70,
              //         child: Column(
              //           crossAxisAlignment: CrossAxisAlignment.start,
              //           children: [
              //             Stack(
              //               alignment: Alignment.bottomRight,
              //               children: [
              //                 CircleAvatar(
              //                   radius: 30.0,
              //                   backgroundImage: NetworkImage(
              //                       "https://cdn.vox-cdn.com/thumbor/WCH_hpmDktgoM_vsNb4QGWr2s8k=/0x104:438x396/1400x1050/filters:focal(0x104:438x396):format(jpeg)/cdn.vox-cdn.com/imported_assets/846336/steve-jobs.jpeg"),
              //                 ),
              //                 Padding(
              //                   padding: const EdgeInsetsDirectional.only(
              //                     bottom: 2,
              //                     end: 2,
              //                   ),
              //                   child: CircleAvatar(
              //                     radius: 7.0,
              //                     backgroundColor: Colors.red,
              //                   ),
              //                 ),
              //               ],
              //             ),
              //             Text(
              //               "Stev Jobs ",
              //               maxLines: 1,
              //               overflow: TextOverflow.ellipsis,
              //             ),
              //           ],
              //         ),
              //       ),
              //       SizedBox(
              //         width: 10.0,
              //       ),
              //       Container(
              //         width: 70,
              //         child: Column(
              //           crossAxisAlignment: CrossAxisAlignment.start,
              //           children: [
              //             Stack(
              //               alignment: Alignment.bottomRight,
              //               children: [
              //                 CircleAvatar(
              //                   radius: 30.0,
              //                   backgroundImage: NetworkImage(
              //                       "https://cdn.vox-cdn.com/thumbor/WCH_hpmDktgoM_vsNb4QGWr2s8k=/0x104:438x396/1400x1050/filters:focal(0x104:438x396):format(jpeg)/cdn.vox-cdn.com/imported_assets/846336/steve-jobs.jpeg"),
              //                 ),
              //                 Padding(
              //                   padding: const EdgeInsetsDirectional.only(
              //                     bottom: 2,
              //                     end: 2,
              //                   ),
              //                   child: CircleAvatar(
              //                     radius: 7.0,
              //                     backgroundColor: Colors.red,
              //                   ),
              //                 ),
              //               ],
              //             ),
              //             Text(
              //               "Stev Jobs ",
              //               maxLines: 1,
              //               overflow: TextOverflow.ellipsis,
              //             ),
              //           ],
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
              // SizedBox(
              //   height: 20,
              // ),
              // Expanded(
              //   child: SingleChildScrollView(
              //     child: Column(
              //       children: [
              //         Row(
              //           children: [
              //             Stack(
              //               alignment: Alignment.bottomRight,
              //               children: [
              //                 CircleAvatar(
              //                   radius: 30.0,
              //                   backgroundImage: NetworkImage(
              //                       "https://cdn.vox-cdn.com/thumbor/WCH_hpmDktgoM_vsNb4QGWr2s8k=/0x104:438x396/1400x1050/filters:focal(0x104:438x396):format(jpeg)/cdn.vox-cdn.com/imported_assets/846336/steve-jobs.jpeg"),
              //                 ),
              //                 Padding(
              //                   padding: const EdgeInsetsDirectional.only(
              //                     bottom: 2,
              //                     end: 2,
              //                   ),
              //                   child: CircleAvatar(
              //                     radius: 7.0,
              //                     backgroundColor: Colors.red,
              //                   ),
              //                 ),
              //               ],
              //             ),
              //             SizedBox(
              //               width: 15.0,
              //             ),
              //             Expanded(
              //               child: Column(
              //                 crossAxisAlignment: CrossAxisAlignment.start,
              //                 children: [
              //                   Text(
              //                     "Stev Jobs",
              //                     style: TextStyle(
              //                       fontWeight: FontWeight.bold,
              //                       fontSize: 17,
              //                     ),
              //                     maxLines: 1,
              //                     overflow: TextOverflow.ellipsis,
              //                   ),
              //                   SizedBox(
              //                     height: 3,
              //                   ),
              //                   Row(
              //                     children: [
              //                       Expanded(
              //                         child: Text(
              //                           "Hello Stev Can you call me asdasdsaadsadsdsad",
              //                           maxLines: 2,
              //                           overflow: TextOverflow.ellipsis,
              //                         ),
              //                       ),
              //                       Text("11.00 PM")
              //                     ],
              //                   ),
              //                 ],
              //               ),
              //             )
              //           ],
              //         ),
              //         SizedBox(
              //           height: 20.0,
              //         ),
              //         Row(
              //           children: [
              //             Stack(
              //               alignment: Alignment.bottomRight,
              //               children: [
              //                 CircleAvatar(
              //                   radius: 30.0,
              //                   backgroundImage: NetworkImage(
              //                       "https://cdn.vox-cdn.com/thumbor/WCH_hpmDktgoM_vsNb4QGWr2s8k=/0x104:438x396/1400x1050/filters:focal(0x104:438x396):format(jpeg)/cdn.vox-cdn.com/imported_assets/846336/steve-jobs.jpeg"),
              //                 ),
              //                 Padding(
              //                   padding: const EdgeInsetsDirectional.only(
              //                     bottom: 2,
              //                     end: 2,
              //                   ),
              //                   child: CircleAvatar(
              //                     radius: 7.0,
              //                     backgroundColor: Colors.red,
              //                   ),
              //                 ),
              //               ],
              //             ),
              //             SizedBox(
              //               width: 15.0,
              //             ),
              //             Expanded(
              //               child: Column(
              //                 crossAxisAlignment: CrossAxisAlignment.start,
              //                 children: [
              //                   Text(
              //                     "Stev Jobs",
              //                     style: TextStyle(
              //                       fontWeight: FontWeight.bold,
              //                       fontSize: 17,
              //                     ),
              //                     maxLines: 1,
              //                     overflow: TextOverflow.ellipsis,
              //                   ),
              //                   SizedBox(
              //                     height: 3,
              //                   ),
              //                   Row(
              //                     children: [
              //                       Expanded(
              //                         child: Text(
              //                           "Hello Stev Can you call me asdasdsaadsadsdsad",
              //                           maxLines: 2,
              //                           overflow: TextOverflow.ellipsis,
              //                         ),
              //                       ),
              //                       Text("11.00 PM")
              //                     ],
              //                   ),
              //                 ],
              //               ),
              //             )
              //           ],
              //         ),
              //         SizedBox(
              //           height: 20.0,
              //         ),
              //         Row(
              //           children: [
              //             Stack(
              //               alignment: Alignment.bottomRight,
              //               children: [
              //                 CircleAvatar(
              //                   radius: 30.0,
              //                   backgroundImage: NetworkImage(
              //                       "https://cdn.vox-cdn.com/thumbor/WCH_hpmDktgoM_vsNb4QGWr2s8k=/0x104:438x396/1400x1050/filters:focal(0x104:438x396):format(jpeg)/cdn.vox-cdn.com/imported_assets/846336/steve-jobs.jpeg"),
              //                 ),
              //                 Padding(
              //                   padding: const EdgeInsetsDirectional.only(
              //                     bottom: 2,
              //                     end: 2,
              //                   ),
              //                   child: CircleAvatar(
              //                     radius: 7.0,
              //                     backgroundColor: Colors.red,
              //                   ),
              //                 ),
              //               ],
              //             ),
              //             SizedBox(
              //               width: 15.0,
              //             ),
              //             Expanded(
              //               child: Column(
              //                 crossAxisAlignment: CrossAxisAlignment.start,
              //                 children: [
              //                   Text(
              //                     "Stev Jobs",
              //                     style: TextStyle(
              //                       fontWeight: FontWeight.bold,
              //                       fontSize: 17,
              //                     ),
              //                     maxLines: 1,
              //                     overflow: TextOverflow.ellipsis,
              //                   ),
              //                   SizedBox(
              //                     height: 3,
              //                   ),
              //                   Row(
              //                     children: [
              //                       Expanded(
              //                         child: Text(
              //                           "Hello Stev Can you call me asdasdsaadsadsdsad",
              //                           maxLines: 2,
              //                           overflow: TextOverflow.ellipsis,
              //                         ),
              //                       ),
              //                       Text("11.00 PM")
              //                     ],
              //                   ),
              //                 ],
              //               ),
              //             )
              //           ],
              //         ),
              //         SizedBox(
              //           height: 20.0,
              //         ),
              //         Row(
              //           children: [
              //             Stack(
              //               alignment: Alignment.bottomRight,
              //               children: [
              //                 CircleAvatar(
              //                   radius: 30.0,
              //                   backgroundImage: NetworkImage(
              //                       "https://cdn.vox-cdn.com/thumbor/WCH_hpmDktgoM_vsNb4QGWr2s8k=/0x104:438x396/1400x1050/filters:focal(0x104:438x396):format(jpeg)/cdn.vox-cdn.com/imported_assets/846336/steve-jobs.jpeg"),
              //                 ),
              //                 Padding(
              //                   padding: const EdgeInsetsDirectional.only(
              //                     bottom: 2,
              //                     end: 2,
              //                   ),
              //                   child: CircleAvatar(
              //                     radius: 7.0,
              //                     backgroundColor: Colors.red,
              //                   ),
              //                 ),
              //               ],
              //             ),
              //             SizedBox(
              //               width: 15.0,
              //             ),
              //             Expanded(
              //               child: Column(
              //                 crossAxisAlignment: CrossAxisAlignment.start,
              //                 children: [
              //                   Text(
              //                     "Stev Jobs",
              //                     style: TextStyle(
              //                       fontWeight: FontWeight.bold,
              //                       fontSize: 17,
              //                     ),
              //                     maxLines: 1,
              //                     overflow: TextOverflow.ellipsis,
              //                   ),
              //                   SizedBox(
              //                     height: 3,
              //                   ),
              //                   Row(
              //                     children: [
              //                       Expanded(
              //                         child: Text(
              //                           "Hello Stev Can you call me asdasdsaadsadsdsad",
              //                           maxLines: 2,
              //                           overflow: TextOverflow.ellipsis,
              //                         ),
              //                       ),
              //                       Text("11.00 PM")
              //                     ],
              //                   ),
              //                 ],
              //               ),
              //             )
              //           ],
              //         ),
              //         Row(
              //           children: [
              //             Stack(
              //               alignment: Alignment.bottomRight,
              //               children: [
              //                 CircleAvatar(
              //                   radius: 30.0,
              //                   backgroundImage: NetworkImage(
              //                       "https://cdn.vox-cdn.com/thumbor/WCH_hpmDktgoM_vsNb4QGWr2s8k=/0x104:438x396/1400x1050/filters:focal(0x104:438x396):format(jpeg)/cdn.vox-cdn.com/imported_assets/846336/steve-jobs.jpeg"),
              //                 ),
              //                 Padding(
              //                   padding: const EdgeInsetsDirectional.only(
              //                     bottom: 2,
              //                     end: 2,
              //                   ),
              //                   child: CircleAvatar(
              //                     radius: 7.0,
              //                     backgroundColor: Colors.red,
              //                   ),
              //                 ),
              //               ],
              //             ),
              //             SizedBox(
              //               width: 15.0,
              //             ),
              //             Expanded(
              //               child: Column(
              //                 crossAxisAlignment: CrossAxisAlignment.start,
              //                 children: [
              //                   Text(
              //                     "Stev Jobs",
              //                     style: TextStyle(
              //                       fontWeight: FontWeight.bold,
              //                       fontSize: 17,
              //                     ),
              //                     maxLines: 1,
              //                     overflow: TextOverflow.ellipsis,
              //                   ),
              //                   SizedBox(
              //                     height: 3,
              //                   ),
              //                   Row(
              //                     children: [
              //                       Expanded(
              //                         child: Text(
              //                           "Hello Stev Can you call me asdasdsaadsadsdsad",
              //                           maxLines: 2,
              //                           overflow: TextOverflow.ellipsis,
              //                         ),
              //                       ),
              //                       Text("11.00 PM")
              //                     ],
              //                   ),
              //                 ],
              //               ),
              //             )
              //           ],
              //         ),
              //         SizedBox(
              //           height: 20.0,
              //         ),
              //         Row(
              //           children: [
              //             Stack(
              //               alignment: Alignment.bottomRight,
              //               children: [
              //                 CircleAvatar(
              //                   radius: 30.0,
              //                   backgroundImage: NetworkImage(
              //                       "https://cdn.vox-cdn.com/thumbor/WCH_hpmDktgoM_vsNb4QGWr2s8k=/0x104:438x396/1400x1050/filters:focal(0x104:438x396):format(jpeg)/cdn.vox-cdn.com/imported_assets/846336/steve-jobs.jpeg"),
              //                 ),
              //                 Padding(
              //                   padding: const EdgeInsetsDirectional.only(
              //                     bottom: 2,
              //                     end: 2,
              //                   ),
              //                   child: CircleAvatar(
              //                     radius: 7.0,
              //                     backgroundColor: Colors.red,
              //                   ),
              //                 ),
              //               ],
              //             ),
              //             SizedBox(
              //               width: 15.0,
              //             ),
              //             Expanded(
              //               child: Column(
              //                 crossAxisAlignment: CrossAxisAlignment.start,
              //                 children: [
              //                   Text(
              //                     "Stev Jobs",
              //                     style: TextStyle(
              //                       fontWeight: FontWeight.bold,
              //                       fontSize: 17,
              //                     ),
              //                     maxLines: 1,
              //                     overflow: TextOverflow.ellipsis,
              //                   ),
              //                   SizedBox(
              //                     height: 3,
              //                   ),
              //                   Row(
              //                     children: [
              //                       Expanded(
              //                         child: Text(
              //                           "Hello Stev Can you call me asdasdsaadsadsdsad",
              //                           maxLines: 2,
              //                           overflow: TextOverflow.ellipsis,
              //                         ),
              //                       ),
              //                       Text("11.00 PM")
              //                     ],
              //                   ),
              //                 ],
              //               ),
              //             )
              //           ],
              //         ),
              //         SizedBox(
              //           height: 20.0,
              //         ),
              //         Row(
              //           children: [
              //             Stack(
              //               alignment: Alignment.bottomRight,
              //               children: [
              //                 CircleAvatar(
              //                   radius: 30.0,
              //                   backgroundImage: NetworkImage(
              //                       "https://cdn.vox-cdn.com/thumbor/WCH_hpmDktgoM_vsNb4QGWr2s8k=/0x104:438x396/1400x1050/filters:focal(0x104:438x396):format(jpeg)/cdn.vox-cdn.com/imported_assets/846336/steve-jobs.jpeg"),
              //                 ),
              //                 Padding(
              //                   padding: const EdgeInsetsDirectional.only(
              //                     bottom: 2,
              //                     end: 2,
              //                   ),
              //                   child: CircleAvatar(
              //                     radius: 7.0,
              //                     backgroundColor: Colors.red,
              //                   ),
              //                 ),
              //               ],
              //             ),
              //             SizedBox(
              //               width: 15.0,
              //             ),
              //             Expanded(
              //               child: Column(
              //                 crossAxisAlignment: CrossAxisAlignment.start,
              //                 children: [
              //                   Text(
              //                     "Stev Jobs",
              //                     style: TextStyle(
              //                       fontWeight: FontWeight.bold,
              //                       fontSize: 17,
              //                     ),
              //                     maxLines: 1,
              //                     overflow: TextOverflow.ellipsis,
              //                   ),
              //                   SizedBox(
              //                     height: 3,
              //                   ),
              //                   Row(
              //                     children: [
              //                       Expanded(
              //                         child: Text(
              //                           "Hello Stev Can you call me asdasdsaadsadsdsad",
              //                           maxLines: 2,
              //                           overflow: TextOverflow.ellipsis,
              //                         ),
              //                       ),
              //                       Text("11.00 PM")
              //                     ],
              //                   ),
              //                 ],
              //               ),
              //             )
              //           ],
              //         ),
              //         SizedBox(
              //           height: 20.0,
              //         ),
              //         Row(
              //           children: [
              //             Stack(
              //               alignment: Alignment.bottomRight,
              //               children: [
              //                 CircleAvatar(
              //                   radius: 30.0,
              //                   backgroundImage: NetworkImage(
              //                       "https://cdn.vox-cdn.com/thumbor/WCH_hpmDktgoM_vsNb4QGWr2s8k=/0x104:438x396/1400x1050/filters:focal(0x104:438x396):format(jpeg)/cdn.vox-cdn.com/imported_assets/846336/steve-jobs.jpeg"),
              //                 ),
              //                 Padding(
              //                   padding: const EdgeInsetsDirectional.only(
              //                     bottom: 2,
              //                     end: 2,
              //                   ),
              //                   child: CircleAvatar(
              //                     radius: 7.0,
              //                     backgroundColor: Colors.red,
              //                   ),
              //                 ),
              //               ],
              //             ),
              //             SizedBox(
              //               width: 15.0,
              //             ),
              //             Expanded(
              //               child: Column(
              //                 crossAxisAlignment: CrossAxisAlignment.start,
              //                 children: [
              //                   Text(
              //                     "Stev Jobs",
              //                     style: TextStyle(
              //                       fontWeight: FontWeight.bold,
              //                       fontSize: 17,
              //                     ),
              //                     maxLines: 1,
              //                     overflow: TextOverflow.ellipsis,
              //                   ),
              //                   SizedBox(
              //                     height: 3,
              //                   ),
              //                   Row(
              //                     children: [
              //                       Expanded(
              //                         child: Text(
              //                           "Hello Stev Can you call me asdasdsaadsadsdsad",
              //                           maxLines: 2,
              //                           overflow: TextOverflow.ellipsis,
              //                         ),
              //                       ),
              //                       Text("11.00 PM")
              //                     ],
              //                   ),
              //                 ],
              //               ),
              //             )
              //           ],
              //         ),
              //       ],
              //     ),
              //   ),
              // ),

              Container(
                height: 90,
                child: ListView.separated(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => BuildStoryItem(),
                  separatorBuilder: (context, index) => SizedBox(
                    width: 20.0,
                  ),
                  itemCount: 10,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ListView.separated(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) => BuildChatItem(),
                  separatorBuilder: (context, index) => SizedBox(
                        height: 20.0,
                      ),
                  itemCount: 15)
            ],
          ),
        ),
      ),
    );
  }
}

Widget BuildChatItem() => Row(
      children: [
        Stack(
          alignment: Alignment.bottomRight,
          children: [
            CircleAvatar(
              radius: 30.0,
              backgroundImage: NetworkImage(
                  "https://cdn.vox-cdn.com/thumbor/WCH_hpmDktgoM_vsNb4QGWr2s8k=/0x104:438x396/1400x1050/filters:focal(0x104:438x396):format(jpeg)/cdn.vox-cdn.com/imported_assets/846336/steve-jobs.jpeg"),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.only(
                bottom: 2,
                end: 2,
              ),
              child: CircleAvatar(
                radius: 7.0,
                backgroundColor: Colors.green,
              ),
            ),
          ],
        ),
        SizedBox(
          width: 15.0,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Stev Jobs",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(
                height: 3,
              ),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      "Hello Stev Can you call me asdasdsaadsadsdsad",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Text("11.00 PM")
                ],
              ),
            ],
          ),
        )
      ],
    );

Widget BuildStoryItem() => Container(
      width: 70,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            alignment: Alignment.bottomRight,
            children: [
              CircleAvatar(
                radius: 30.0,
                backgroundImage: NetworkImage(
                    "https://cdn.vox-cdn.com/thumbor/WCH_hpmDktgoM_vsNb4QGWr2s8k=/0x104:438x396/1400x1050/filters:focal(0x104:438x396):format(jpeg)/cdn.vox-cdn.com/imported_assets/846336/steve-jobs.jpeg"),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.only(
                  bottom: 2,
                  end: 2,
                ),
                child: CircleAvatar(
                  radius: 7.0,
                  backgroundColor: Colors.green,
                ),
              ),
            ],
          ),
          Text(
            "Stev Jobs ",
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
