import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:circular_check_box/circular_check_box.dart';
import 'package:itax_test/login.dart';
import 'package:itax_test/my_flutter_app_icons.dart';

List allList = [
  {'select': false, 'title': "โทรหาลูกค้า"},
  {'select': false, 'title': "ส่ง slide ให้ภัทร"},
  {'select': false, 'title': "นัดประชุมทีม Marketing"},
  {'select': false, 'title': "Follow up A team"},
  {'select': false, 'title': "Press check"},
  {'select': false, 'title': "Schedule social media posts"},
  {'select': false, 'title': "สั่ง materials"},
  {'select': false, 'title': "รับเช็ค"},
];

class Firstpage extends StatefulWidget {
  @override
  _FirstpageState createState() => _FirstpageState();
}

class _FirstpageState extends State<Firstpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 44,
              ),
              Container(
                height: 44,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 24),
                      child: Text(
                        "To-dolist",
                        style: GoogleFonts.mitr(
                          fontWeight: FontWeight.w500,
                          color: Color.fromRGBO(69, 76, 96, 1),
                          fontSize: 24,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () async {
                        showModalBottomSheet(
                          isScrollControlled: true,
                          context: context,
                          builder: (context) => Container(
                              child: Wrap(
                            children: [
                              BottomSheet(),
                            ],
                          )),
                        ).whenComplete(() {
                          setState(() {});
                        });
                      },
                      child: Container(
                          margin: EdgeInsets.only(right: 16),
                          width: 60,
                          height: 40,
                          decoration: BoxDecoration(
                              color: Color.fromRGBO(1, 178, 102, 1),
                              borderRadius: BorderRadius.circular(20)),
                          child: Icon(
                            Icons.add,
                            color: Colors.white,
                            size: 24,
                          )),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 24,
              ),
              Divider(
                color: Color.fromRGBO(221, 221, 221, 1),
                thickness: 1,
              ),
              Theme(
                data: ThemeData().copyWith(
                  dividerColor: Colors.transparent,
                  accentColor: Colors.grey[500],
                ),
                child: ExpansionTile(
                  tilePadding: EdgeInsets.only(
                    right: 16,
                    left: 25,
                  ),
                  title: Text(
                    "All",
                    style: GoogleFonts.mitr(
                      fontWeight: FontWeight.w400,
                      color: Color.fromRGBO(69, 76, 96, 1),
                      fontSize: 16,
                    ),
                  ),
                  children: [
                    ListView.builder(
                        padding: EdgeInsets.all(0),
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: allList.length,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              Container(
                                height: 56,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(left: 16),
                                      child: CircularCheckBox(
                                          materialTapTargetSize:
                                              MaterialTapTargetSize.shrinkWrap,
                                          inactiveColor:
                                              Color.fromRGBO(218, 229, 223, 1),
                                          activeColor:
                                              Color.fromRGBO(1, 178, 102, 1),
                                          value: allList[index]['select'],
                                          onChanged: (bool x) {
                                            setState(() {
                                              allList[index]['select'] = x;
                                            });
                                          }),
                                    ),
                                    Text(
                                      allList[index]['title'],
                                      style: GoogleFonts.mitr(
                                        decoration:
                                            (allList[index]['select'] == true)
                                                ? TextDecoration.lineThrough
                                                : TextDecoration.none,
                                        fontWeight: FontWeight.w400,
                                        color: Color.fromRGBO(69, 76, 96, 1),
                                        fontSize: 16,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.only(left: 24),
                                child: Divider(
                                  color: Color.fromRGBO(221, 221, 221, 1),
                                  thickness: 1,
                                ),
                              )
                            ],
                          );
                        })
                  ],
                ),
              ),
              Divider(
                color: Color.fromRGBO(221, 221, 221, 1),
                thickness: 1,
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => Login()),
                    );
                  },
                  child: Container(
                    alignment: FractionalOffset.bottomCenter,
                    padding: EdgeInsets.only(bottom: 47),
                    child: Text(
                      "Log out",
                      style: GoogleFonts.mitr(
                        fontWeight: FontWeight.w500,
                        color: Color.fromRGBO(69, 76, 96, 1),
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class BottomSheet extends StatefulWidget {
  @override
  _BottomSheetState createState() => _BottomSheetState();
}

class _BottomSheetState extends State<BottomSheet> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController dateCtl = TextEditingController();
  final myController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Container(
        color: Color(0xff757575),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10.0),
              topRight: Radius.circular(10.0),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: EdgeInsets.fromLTRB(16, 17, 16, 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        "Cancel",
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        if (_formKey.currentState.validate()) {
                          allList.add(
                            {'select': false, 'title': "${myController.text}"},
                          );
                          Navigator.pop(context);
                        }
                      },
                      child: Text(
                        "Save",
                        style: TextStyle(fontSize: 16),
                      ),
                    )
                  ],
                ),
              ),
              Divider(
                color: Color.fromRGBO(221, 221, 221, 1),
                thickness: 1,
              ),
              Container(
                padding: EdgeInsets.fromLTRB(24, 16, 24, 24),
                child: TextFormField(
                  validator: (val) =>
                      val.isEmpty ? "ท่านยังไม่ได้กรอกTask name" : null,
                  controller: myController,
                  style: GoogleFonts.mitr(),
                  autocorrect: false,
                  keyboardType: TextInputType.text,
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    hintText: "Task name...",
                    hintStyle: GoogleFonts.mitr(
                      fontWeight: FontWeight.w400,
                      color: Color.fromRGBO(167, 178, 172, 1),
                      fontSize: 18,
                    ),
                  ),
                  autofocus: true,
                  textAlign: TextAlign.start,
                  onChanged: (newText) {},
                ),
              ),
              Container(
                  padding: EdgeInsets.only(left: 24),
                  child: Text(
                    "Due Date *",
                    style: GoogleFonts.mitr(
                      fontWeight: FontWeight.w400,
                      color: Color.fromRGBO(69, 76, 96, 1),
                      fontSize: 16,
                    ),
                  )),
              Container(
                padding: EdgeInsets.only(
                  left: 24,
                  right: 24,
                  bottom: 32,
                ),
                child: TextFormField(
                  validator: (val) =>
                      val.isEmpty ? "ท่านยังไม่ได้กรอก Due Date" : null,
                  style: GoogleFonts.mitr(),
                  controller:
                      (dateCtl != null) ? dateCtl : "วัน / เดือน / ปี พ.ศ.",
                  decoration: InputDecoration(
                    suffixIcon: Icon(
                      MyFlutterApp.calendar_alt,
                      color: Colors.green,
                      size: 24,
                    ),
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    hintText: "วัน / เดือน / ปี พ.ศ.",
                    hintStyle: GoogleFonts.mitr(
                      fontWeight: FontWeight.w400,
                      color: Color.fromRGBO(167, 178, 172, 1),
                      fontSize: 16,
                    ),
                    fillColor: Colors.white,
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Color.fromRGBO(218, 219, 223, 1), width: 1),
                        borderRadius: BorderRadius.circular(8.0)),
                  ),
                  onTap: () async {
                    DateTime date = DateTime(1900);
                    FocusScope.of(context).requestFocus(new FocusNode());

                    date = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now().add(Duration(days: 198327)),
                        firstDate: DateTime(2500),
                        lastDate: DateTime(2600));
                    if (date != null)
                      setState(() {
                        dateCtl.text =
                            " ${date.day} / ${date.month} / ${date.year}";
                      });
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
