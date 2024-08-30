// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:quotes_app_data_base/controller/quote_controller.dart';
// import 'package:quotes_app_data_base/view/Folder_page/folder_page.dart';
//
// class HomePage extends StatelessWidget {
//   const HomePage({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     double height = MediaQuery.of(context).size.height;
//     double width = MediaQuery.of(context).size.width;
//     DataController controller = Get.put(DataController());
//     return SafeArea(
//       child: Scaffold(
//         appBar: AppBar(
//           actions: [
//             // InkWell(onTap: () {
//             //   Get.to(FolderPage());
//             // },child: Icon(Icons.pages_outlined,color: Colors.black,))
//           ],
//         ),
//           body: Container(
//         height: double.infinity,
//         width: double.infinity,
//         decoration: BoxDecoration(
//           image: DecorationImage(
//               image: AssetImage('assets/img/image1.jpeg'), fit: BoxFit.cover),
//         ),
//         child: Obx(() {
//           return Center(
//             child: PageView.builder(
//               scrollDirection: Axis.vertical,
//               itemCount: controller.quotes.length,
//               itemBuilder: (context, index) {
//                 return Center(
//                   child: Container(
//                     width: width * 0.9,
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Text(controller.quotes[index].category,style: TextStyle(color: Colors.white),),
//                         // IconButton(
//                         //     // onPressed: () {
//                         //     //   if (controller.dataList[index]['like'] == 0) {
//                         //     //     controller.favourite(
//                         //     //         1, controller.dataList[index]['id']);
//                         //     //     if(controller.dataList[index]['category'] == Motivation)
//                         //     //     {
//                         //     //       motivation.add(controller.dataList[index]['quote']);
//                         //     //       print(motivation);
//                         //     //     }
//                         //     //     else if(controller.dataList[index]['category'] == Inspiration)
//                         //     //     {
//                         //     //       inspiration.add(controller.dataList[index]['quote']);
//                         //     //       print(inspiration);
//                         //     //     }
//                         //     //     else
//                         //     //       {
//                         //     //         inspiration.add(controller.dataList[index]['quote']);
//                         //     //         print(inspiration);
//                         //     //       }
//                         //     //
//                         //     //   } else {
//                         //     //     controller.favourite(
//                         //     //         0, controller.dataList[index]['id']);
//                         //     //   }
//                         //     // },
//                         //     icon: controller.quotes[index].isLiked == 0
//                         //         ? Icon(
//                         //             Icons.favorite_border,
//                         //             color: Colors.white,
//                         //           )
//                         //         : Icon(
//                         //             Icons.favorite,
//                         //             color: Colors.red,
//                         //           )),
//                         Text(
//                           textAlign: TextAlign.center,
//                           ' ${controller.quotes[index].quote} \n',
//                           style: TextStyle(fontSize: 30, color: Colors.white),
//                         ),
//
//                       ],
//                     ),
//                   ),
//                 );
//               },
//             ),
//           );
//         }),
//       )),
//     );
//   }
// }
//
// //Obx(() {
// //           return Center(
// //             child: PageView.builder(
// //               scrollDirection: Axis.vertical,
// //               itemCount: controller.dataList.length,
// //               itemBuilder: (context, index) {
// //                 return Center(
// //                   child: Container(
// //                     width: width * 0.9,
// //                     child: Column(
// //                       mainAxisAlignment: MainAxisAlignment.center,
// //                       children: [
// //                         Text(
// //                           textAlign: TextAlign.center,
// //                           ' ${controller.dataList[index]['quote']} \n',
// //                           style: TextStyle(fontSize: 30),
// //                         ),
// //                         Row(
// //                           mainAxisAlignment: MainAxisAlignment.end,
// //                           children: [
// //                             Text(
// //                               ' ~ ${controller.dataList[index]['author']}',
// //                               style: TextStyle(fontSize: 30),
// //                             ),
// //                           ],
// //                         )
// //                       ],
// //                     ),
// //                   ),
// //                 );
// //               },
// //             ),
// //           );
// //         }),
//
// RxString Motivation =''.obs;
// RxString Inspiration =''.obs;
//
// RxList motivation = [].obs;
// RxList inspiration = [].obs;
// RxList Love = [].obs;

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quotes_app_sql/Controller/Quote_Controller.dart';
import 'package:quotes_app_sql/View/Edit_Page/edit_page.dart';
import 'package:quotes_app_sql/View/Folder_Page/folder_page.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final DataController dataController = Get.put(DataController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Fixed Background Image
          Obx(() {
            if (dataController.isLoading.value) {
              return const Center(child: CircularProgressIndicator());
            } else if (dataController.quotes.isEmpty) {
              return const Center(child: Text('No data available'));
            } else {
              return Image.asset(
                dataController.backgroundImage.value,
                // Image(
                //                     image: AssetImage(quotesController.backgroundImage.value),
                //                     fit: BoxFit.cover,
                //                   ),
                fit: BoxFit.cover,
              );
            }
          }),
          // Quotes PageView
          Obx(() {
            if (dataController.isLoading.value) {
              return const Center(child: CircularProgressIndicator());
            } else if (dataController.quotes.isEmpty) {
              return const Center(child: Text('No data available'));
            } else {
              return PageView.builder(
                scrollDirection: Axis.vertical,
                itemCount: dataController.quotes.length,
                itemBuilder: (context, index) {
                  final quote = dataController.quotes[index];
                  // final isLiked = dataController.likedQuotes.any((liked) => liked.quote == quote.quote);
                  return Stack(
                    children: [
                      Container(
                        color: Colors.black54,
                        // Add a slight background for readability
                        padding: const EdgeInsets.all(16.0),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InkWell(onTap: () {
                                // SelectIndex ++;
                                Get.to(ThoughtScreen(quote: RxString(quote.quote),author: RxString(quote.author),));
                              },
                                child: Text(
                                  quote.quote,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 24.0,
                                    fontStyle: FontStyle.italic,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              const SizedBox(height: 16.0),
                              Text(
                                '- ${quote.author}',
                                style: const TextStyle(
                                  color: Colors.white70,
                                  fontSize: 18.0,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(height: 8.0),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        top: 50,
                        left: 16.0,
                        child: Text(
                          quote.category,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 23.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 50,
                        right: 16.0,
                        child: IconButton(
                          icon: Icon(
                            dataController.quotes[index].isLiked == "1"
                                ? Icons.favorite
                                : Icons.favorite_border,
                            color: dataController.quotes[index].isLiked == "1"
                                ? Colors.red
                                : Colors.white,
                          ),
                          onPressed: () {
                            dataController.toggleLike(quote, index);
                          },
                        ),
                      ),
                    ],
                  );
                },
              );
            }
          }),
          // Transparent Buttons at the Bottom
          Positioned(
            bottom: 16.0,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TransparentButton(
                  text: 'Like Folder',
                  icon: Icons.topic,
                  onPressed: () {
                    Get.to(() => FolderPage());
                  },
                ),
                TransparentButton(
                  text: 'wallpaper',
                  icon:  Icons.edit,
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return SizedBox(
                          width: double.infinity,
                          height: 700,
                          child: Column(
                            children: [
                              const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  'Background image',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 25),
                                ),
                              ),
                              Expanded(
                                child: GridView.builder(
                                  gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2),
                                  itemBuilder: (context, index) {
                                    return GestureDetector(
                                      onTap: () {
                                        String selectedImage = imgList[index];
                                        dataController.updateBackgroundImage(selectedImage);
                                        Navigator.pop(context);
                                      },
                                      child: Card(
                                        child: Image(
                                          image: AssetImage(
                                              imgList[index]),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    );
                                  },
                                  itemCount: imgList.length,
                                ),
                              )
                            ],
                          ),
                        );
                      },
                    );
                  },
                ),
                // TransparentButton(
                //   text: 'Theme',
                //   icon: Icons.palette,
                //   onPressed: () {
                //     Get.to(() => ThemeScreen());
                //   },
                // ),
                TransparentButton(
                  text: 'Setting',
                  icon: Icons.settings,
                  onPressed: () {
                    // Get.to(() => ThoughtScreen(SelectIndex: SelectIndex,));
                    // Handle setting button press
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class TransparentButton extends StatelessWidget {
  final String text;
  final IconData icon;
  final VoidCallback onPressed;

  const TransparentButton(
      {super.key,
        required this.text,
        required this.icon,
        required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: onPressed,
      icon: Icon(icon, color: Colors.white),
      label: Text(text),
      style: TextButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor:
        Colors.black.withOpacity(0.2), // Transparent background
      ),
    );
  }
}

var SelectIndex = 0;
var data = 0;