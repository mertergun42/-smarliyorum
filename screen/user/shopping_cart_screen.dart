import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:ismarliyorum/utils/constants.dart';
import 'package:ismarliyorum/widgets/navigation_top_bar_widget.dart';
import 'package:ismarliyorum/widgets/text_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ShoppingCartScreen extends StatefulWidget {
  const ShoppingCartScreen({Key? key}) : super(key: key);

  @override
  State<ShoppingCartScreen> createState() => _ShoppingCartScreenState();
}

class _ShoppingCartScreenState extends State<ShoppingCartScreen> {
  final DatePickerController _controller = DatePickerController();

  DateTime _selectedValue = DateTime.now();

  @override
  void initState() {
    super.initState();
  }

  List productName = [
    "Women Sleep Suits by Femall Clothings",
    "Brown Women Shirts by Coklat Cloth",
  ];

  List productDescription = [
    "Grey Variant",
    "Grey Variant",
  ];

  List productImages = [
    "assets/images/product-one.png",
    "assets/images/product-two.png",
  ];

  List productPrice = [
    "\$158.2",
    "\$158.2",
  ];

  List productOldPrice = [
    "\$170",
    "\$170",
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const NavigationTopBarWidget(screenName: "Yapılan İşlemler"),
        SizedBox(
          height: Adaptive.h(6),
        ),
        Container(
          width: Adaptive.w(90),
          height: Adaptive.h(14),
          decoration: BoxDecoration(
              color: Constants.secondBackgroundColor,
              borderRadius: BorderRadius.circular(14)),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                    left: Adaptive.w(4),
                    right: Adaptive.w(4),
                    top: Adaptive.h(1),
                    bottom: Adaptive.h(1)),
                child: DatePicker(
                  DateTime.now(),
                  width: 60,
                  height: 90,
                  locale: "tr_TR",
                  monthTextStyle:
                      const TextStyle(fontFamily: "FontBold", fontSize: 12),
                  dayTextStyle:
                      const TextStyle(fontFamily: "FontMedium", fontSize: 12),
                  dateTextStyle:
                      const TextStyle(fontFamily: "FontBold", fontSize: 14),
                  controller: _controller,
                  initialSelectedDate: DateTime.now(),
                  onDateChange: (date) {
                    // New date selected
                    setState(() {
                      _selectedValue = date;
                    });
                  },
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: Adaptive.h(4),
        ),
        SizedBox(
          width: Adaptive.w(90),
          child: ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.all(0),
            itemCount: productName.length,
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: Adaptive.w(55),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const TextWidget(
                              text: "#125125671",
                              color: Constants.mainBackgroundColor,
                            ),
                            SizedBox(
                              height: Adaptive.h(0.5),
                            ),
                            TextWidget(
                              text: productName[index],
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w800,
                            ),
                            SizedBox(
                              height: Adaptive.h(0.5),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextWidget(
                                  text: productDescription[index],
                                  color: const Color(0xFF777777),
                                ),
                                const TextWidget(
                                  text: "2x",
                                  color: Color(0xFF777777),
                                ),
                                TextWidget(
                                  text: productPrice[index],
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset(
                          productImages[index],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: Adaptive.h(1),
                  ),
                  Row(
                    children: [
                      Container(
                        width: Adaptive.w(20),
                        height: Adaptive.h(4),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: const Color(0xFFCCFFD1))),
                        child: const Padding(
                          padding: EdgeInsets.all(4),
                          child: Center(
                            child: TextWidget(
                              text: "Tamamlandı",
                              fontSize: 12,
                              color: Color(0xFF18BF29),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: Adaptive.h(1.5),
                  ),
                  Container(
                    width: Adaptive.w(100),
                    height: 1,
                    color: const Color(0xFFF1F1F1),
                  ),
                  SizedBox(
                    height: Adaptive.h(1.5),
                  ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
