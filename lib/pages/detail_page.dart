import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel/cubit/app_cubit_states.dart';
import 'package:travel/cubit/app_cubits.dart';
import 'package:travel/misc/colors.dart';
import 'package:travel/widgets/app_button.dart';
import 'package:travel/widgets/app_large_text.dart';
import 'package:travel/widgets/app_text.dart';
import 'package:travel/widgets/responseive_button.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({ Key? key }) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {

  late int rating;
  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubites, CubitStates>(
      builder: (context, state) {
        DetailState detail = state as DetailState;
        rating = detail.place.stars;
        return Scaffold(
          body: Container(
            height: double.maxFinite,
            width: double.maxFinite,
            child: Stack(
              children: [
                Positioned(
                  left: 0,
                  right: 0,
                  child: Container(
                    width: double.maxFinite,
                    height: 350,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage('http://mark.bslmeiyu.com/uploads/'+ detail.place.img),
                        fit: BoxFit.cover
                      )
                    ),
                  ),
                ),
                Positioned(
                  top: 70,
                  left: 20,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {
                          BlocProvider.of<AppCubites>(context).GoHome();
                        },
                        icon: const Icon(
                          Icons.menu,
                          color: Colors.white,
                        ),
                      ),
                      // IconButton(
                      //   onPressed: () { },
                      //   icon: const Icon(Icons.arrow_back),
                      // )
                    ],
                  )
                ),
                Positioned(
                  top: 320,
                  child: Container(
                    padding: const EdgeInsets.only(
                      left: 20,
                      right: 20,
                      top: 30,
                    ),
                    width: MediaQuery.of(context).size.width,
                    height: 500,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                      color: Colors.white
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AppLargeText(
                              text: detail.place.name,
                              color: Colors.black54.withOpacity(0.8),
                            ),
                            AppLargeText(
                              text: '\$'+ detail.place.price.toString(), 
                              color: AppColors.mainColor
                            ),
                          ],
                        ),
                        const SizedBox(
                              height: 10,
                            ),
                        Row(
                          children: [
                            Icon(
                              Icons.location_on,
                              color: AppColors.mainColor,
                            ),
                            const SizedBox(
                                  width: 5,
                                ),
                            AppText(
                              text: detail.place.location,
                              color: AppColors.textColor1,
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          children: [
                            Wrap(
                              children: List.generate(5, (index) {
                                return Icon(
                                  Icons.star_sharp,
                                  color: rating > index ? AppColors.starColor : AppColors.textColor1
                                );
                              })
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            AppText(
                              text: detail.place.stars.toString(),
                              color: AppColors.textColor2,
                            ),
                          ],
                          
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        AppLargeText(
                          text: 'People',
                          color: Colors.black.withOpacity(0.8),
                          size: 20,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        AppText(
                          text: 'Number of people in your group',
                          color: AppColors.mainTextColor,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Wrap(
                          children: List.generate(5, (index) {
                            return InkWell(
                              onTap: () {
                                setState(() {
                                  selectedIndex = index;
                                });
                              },
                              child: Container(
                                margin: const EdgeInsets.only(
                                  right: 10
                                ),
                                child: AppButton(
                                  color: selectedIndex == index ? Colors.white : Colors.black ,
                                  backgroudColor: selectedIndex == index ? Colors.black : AppColors.buttonBackground, 
                                  size: 50,
                                  borderColor: selectedIndex == index ? Colors.black : AppColors.buttonBackground, 
                                  text: (index + 1).toString(),
                                  isIcon: false,
                                ),
                              ),
                            );
                          }),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        AppLargeText(
                          text: 'Description',
                          color: Colors.black.withOpacity(0.8),
                          size: 20,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        AppText(
                          text: detail.place.description,
                          color: AppColors.mainTextColor,
                        )
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: 20,
                  left: 20,
                  right: 20,
                  child: Row(
                    children: [
                      AppButton(
                        isIcon: true,
                        color: AppColors.textColor2,
                        backgroudColor: Colors.white,
                        size: 60,
                        icon: Icons.favorite_border_outlined,
                        borderColor: AppColors.textColor2
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      const ResponsiveButton(
                        isResponsive: true,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      }
    );
  }
}