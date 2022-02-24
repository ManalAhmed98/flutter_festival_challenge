import 'package:flutter/material.dart';
import 'package:flutter_festival/decoration/buttonDecoration.dart';
import 'package:flutter_festival/invitation_card.dart';
import 'package:flutter_festival/decoration/textfield_decoration.dart';


class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  late String name='';
  late String date='';
  late String city='';


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('إنشاء بطاقة دعوة'),
      ) ,
      body: SingleChildScrollView(
        child: Container(
          margin:const  EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:  [
              Align(
                  alignment: Alignment.center,
                  child: Image.asset('images/dash.png', height: 130)),
              const SizedBox(height: 20,),
              const Text('اسم الشخص المدعو:'),
              TextFieldDecoration(
                label: 'قم بإدخال الاسم هنا',
                onChanged: (value){name= value;},
                textInputAction: TextInputAction.next,
              ),

              const SizedBox(height: 22,),

              const Text('التاريخ:'),
              TextFieldDecoration(
                label: 'قم بإدخال التاريخ هنا',
                onChanged: (value){date= value;},
                textInputAction: TextInputAction.next,
              ),

              const SizedBox(height: 22,),

              const Text('اسم المدينة:'),
              TextFieldDecoration(label: 'قم بإدخال المدينة هنا',
                onChanged: (value){city= value;},
                textInputAction: TextInputAction.done,
              ),

              const SizedBox(height: 30,),

              ButtonDecoration(
                buttonTitle: 'معاينة البطاقة ',
                fixedSize: const Size.fromHeight(50),
                buttonIcon: Icons.card_giftcard_outlined,
                onPressed:(){
                  if(name.isEmpty|| date.isEmpty || city.isEmpty){
                    _alertDialog();
                  }else{
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => InvitationCard(name: name, city: city, date: date,)),
                    );}
                } ,
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _alertDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('انتباه!',
              style: TextStyle(fontSize: 26)
          ),
          content: const Text('الرجاء عدم ترك أي خانة فارغة',
            style: TextStyle(fontSize: 20),
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
