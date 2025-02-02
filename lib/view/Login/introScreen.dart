import 'package:empowergo/theme/appColor.dart';
import 'package:empowergo/view/Blind%20Interface/Home/blindHomePage.dart';
import 'package:empowergo/view/Deaf%20Interface/deafHomePage.dart';
import 'package:empowergo/widgets/customWidgets/customText.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class Introscreen extends StatefulWidget {
  const Introscreen({super.key});

  @override
  State<Introscreen> createState() => _IntroscreenState();
}

class _IntroscreenState extends State<Introscreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          backgroundColor: AppColors.kLightWhite,
          shape: CircleBorder(),
          onPressed: () {},
          child: Icon(
            Icons.mic,
            size: 30,
            color: AppColors.kbackground,
          )),
      body: Container(
        width: size.width,
        height: size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: AppColors.gradientColors,
            begin: Alignment.topCenter,
          ),
        ),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Gap(20),
              CustomText(
                text: "EMPOWERGO",
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
              Gap(300),
              customCard(
                  icon: Icons.hearing,
                  text: "For Individuals with Hearing Impairments",
                  ontap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Deafhomepage()));
                  }),
              customCard(
                  icon: Icons.visibility,
                  text: "For Individuals with Visual Impairments",
                  ontap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => BlindHomePage()));
                  })
            ],
          ),
        ),
      ),
    );
  }

  Widget customCard({IconData? icon, String? text, VoidCallback? ontap}) {
    final size = MediaQuery.of(context).size;
    return Card(
      elevation: 8,
      child: SizedBox(
          width: size.width - 50,
          height: 60,
          child: Center(
            child: ListTile(
                leading: Icon(
                  icon,
                  size: 25,
                ),
                title: CustomText(
                  text: text ?? ' ',
                  fontSize: 13,
                  color: Colors.black,
                  align: TextAlign.start,
                ),
                horizontalTitleGap: 10,
                trailing: IconButton(
                  padding: EdgeInsets.all(0),
                  onPressed: ontap,
                  icon: Icon(
                    Icons.arrow_right,
                    size: 50,
                  ),
                )),
          )),
    );
  }
}
