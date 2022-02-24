import 'package:flutter/material.dart';
import 'package:flutter_festival/decoration/buttonDecoration.dart';
import 'package:screenshot/screenshot.dart';
import 'dart:async';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:share_plus/share_plus.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';


class InvitationCard extends StatefulWidget {
  const InvitationCard({Key? key, this.name='', this.city='', this.date=''}) : super(key: key);

  final String name;
  final String date;
  final String city;

  @override
  _InvitationCardState createState() => _InvitationCardState();
}

class _InvitationCardState extends State<InvitationCard> {

  ScreenshotController controller= ScreenshotController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('بطاقة الدعوة'),
        ),
        body: Column(
          children: [
            Screenshot( //used this package to save the whole container as an image
              controller: controller,
              child: Container(
                margin: const EdgeInsets.all(40),
                width: 500,
                height: 370,
                decoration:  BoxDecoration(
                  border: Border.all(width: 3, color: const Color(0xff042449), ),
                  borderRadius: BorderRadius.circular(10),
                  color: const Color(0xffA9D9F6)
                ),
                child: Column(
                  children:  [
                    const SizedBox(height: 17,),
                    const Text('دعوة حضور',
                      style: TextStyle(
                        fontSize: 34,
                        fontWeight: FontWeight.w900,
                        color:  Color(0xff042449)
                      ),
                    ),
                    const SizedBox(height: 10,),
                    Padding(
                      padding: const EdgeInsets.only(right: 18),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('عزيزي/ '+ widget.name+
                              '\n سأسعد برؤيتك يوم ' + widget.date+
                                  '،\nفي مدينة '+ widget.city+
                                      '.',
                            style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 23,
                              color:  Color(0xff042449),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text('\nمع تحياتي، \n داش',
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 23,
                                  color:  Color(0xff042449),
                                ),
                              ),
                              Image.asset('images/dash33.png', height: 160,),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ButtonDecoration(
                  buttonTitle: 'حفظ ',
                  buttonIcon: Icons.save_outlined,
                  fixedSize: const Size.fromWidth(120),
                  onPressed: () async{
                    await controller.capture(delay: const Duration(milliseconds: 10)).then((_imageFile) async {
                      if (_imageFile != null) {
                        final directory = await getApplicationDocumentsDirectory();
                        final imagePath = await File('${directory.path}/image.png').create();
                        await imagePath.writeAsBytes(_imageFile);

                        /// Share Plugin
                        // await Share.shareFiles([imagePath.path]);
                        await ImageGallerySaver.saveImage(_imageFile);
                        _alertDialog();
                      }
                    });
                  } ,
                ),
                ButtonDecoration(
                  buttonTitle: 'مشاركة ',
                  buttonIcon: Icons.save_outlined,
                  fixedSize: const Size.fromWidth(120),
                  onPressed: () async{
                    await controller.capture(delay: const Duration(milliseconds: 10)).then((_imageFile) async {
                      if (_imageFile != null) {
                        final directory = await getApplicationDocumentsDirectory();
                        final imagePath = await File('${directory.path}/image.png').create();
                        await imagePath.writeAsBytes(_imageFile);
                        await Share.shareFiles([imagePath.path],
                        );
                      }
                    });
                  } ,
                ),
              ],
            )
          ],
        )
    );
  }

  Future<void> _alertDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('تم حفظ الصورة',
              style: TextStyle(fontSize: 26, color:  Color(0xff042449))
          ),
          content: const Text('تم حفظ الصورة بنجاح في معرض الصور',
            style: TextStyle(fontSize: 20, color:  Color(0xff042449)),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('موافق',
                  style: TextStyle(fontSize: 20)
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

}


