import 'package:curd_operation_in_local/ContactModel.dart';
import 'package:flutter/material.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({super.key});

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  List<ContactModel> contactList = [
    ContactModel(name: "Ankita", number: "56483639476"),
  ];
  void addContact(String inputname, String inputnumber) {
    var cont = ContactModel(name: inputname, number: inputnumber);
    setState(() {
      contactList.add(cont);
    });
  }

  void deleteContact(String inputname) {
    setState(() {
      contactList.removeWhere((element) => element.name == inputname);
    });
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController inputName = TextEditingController();
    TextEditingController inputNumber = TextEditingController();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "CONTACT LIST",
            style: TextStyle(
                color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          backgroundColor: Color.fromARGB(255, 131, 90, 203),
        ),
        body: Padding(
          padding: EdgeInsets.all(8),
          child: Column(
            children: [
              TextField(
                controller: inputName,
                decoration: InputDecoration(
                    hintText: "Full Name",
                    hintStyle: TextStyle(fontSize: 20),
                    // border: BorderRadius.circular(5),
                    prefixIcon: Icon(
                      Icons.person,
                      size: 35,
                    )),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                controller: inputNumber,
                decoration: InputDecoration(
                    hintText: "Ph Number",
                    hintStyle: TextStyle(fontSize: 20),
                    // border: BorderRadius.circular(5),
                    prefixIcon: Icon(
                      Icons.phone,
                      size: 35,
                    )),
              ),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () {
                  // print(inputName.text);
                  // print(inputNumber.text);
                  addContact(inputName.text, inputNumber.text);
                },
                child: Text(
                  "Save Contact",
                  style: TextStyle(fontSize: 15),
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  Text(
                    "All Contacts List",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(
                height: 8,
              ),
              contactList.length==0 ? Text("No! Contact in the Sysytem!!",style: TextStyle(fontSize: 18),) :Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children:  contactList
                        .map((e) => Container(
                              margin: EdgeInsets.all(5),
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 195, 175, 229),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Row(children: [
                                Icon(
                                  Icons.phone,
                                  size: 30,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  children: [
                                    Text(
                                      e.name!,
                                      style: TextStyle(fontSize: 18),
                                    ),
                                    Text(
                                      e.number!,
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                Spacer(),
                                IconButton(
                                    onPressed: () {
                                      deleteContact(e.name!);
                                    },
                                    icon: Icon(
                                      Icons.delete,
                                      size: 40,
                                      color: Color.fromARGB(206, 255, 82, 82),
                                    ))
                              ]),
                            )).toList(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
