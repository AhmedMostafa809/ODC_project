import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:odc_day_one/presentation/widgets/Conponents/Email_txt.dart';

class SupportScreen extends StatefulWidget {
  const SupportScreen({Key? key}) : super(key: key);

  @override
  _SupportScreenState createState() => _SupportScreenState();
}

class _SupportScreenState extends State<SupportScreen> {
  TextEditingController nameController=TextEditingController();
  TextEditingController emailController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon: const Icon(Icons.keyboard_arrow_left_sharp,size: 40,color: Colors.black),onPressed: (){Navigator.pop(context);}),
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          "Support",
          style: TextStyle(color: Colors.black, fontSize: 30),
        ),
      ),
      body: Form(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ListView(
            children: [
              SizedBox(height:MediaQuery.of(context).size.height*.02),

              TextFormField(
                // inputFormatters: widget.formater,
                cursorHeight: 20,
                controller: nameController,
                // validator: widget.validate,
                cursorColor: Colors.orange,
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    hintText: "Name",
                    labelText: "Name",
                    prefixIcon: const Icon(Icons.person,color: Colors.orange,),
                    floatingLabelStyle: const TextStyle(color: Colors.orange, fontSize: 15),
                    disabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: const BorderSide(color: Colors.grey)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Colors.orange)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Colors.black12,width: 2)),
                    // border: OutlineInputBorder(
                    //     borderRadius: BorderRadius.circular(20),
                    //     borderSide: BorderSide(color: Colors.orange)),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 30,vertical:20 ),
                  )
              ),
              SizedBox(height:MediaQuery.of(context).size.height*.02),
              TextFormField(
                // inputFormatters: widget.formater,
                  cursorHeight: 20,
                  controller: emailController,
                  // validator: widget.validate,
                  cursorColor: Colors.orange,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    hintText: "Email",
                    labelText: "Email",
                    prefixIcon: const Icon(Icons.email,color: Colors.orange,),
                    floatingLabelStyle: const TextStyle(color: Colors.orange, fontSize: 15),
                    disabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: const BorderSide(color: Colors.grey)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Colors.orange)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Colors.black12,width: 2)),
                    // border: OutlineInputBorder(
                    //     borderRadius: BorderRadius.circular(20),
                    //     borderSide: BorderSide(color: Colors.orange)),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 30,vertical:20 ),
                  )
              ),
              SizedBox(height:MediaQuery.of(context).size.height*.02),
              TextField(
                cursorHeight: 20,
                  cursorColor: Colors.orange,
                  textInputAction: TextInputAction.done,
                  maxLines: 10,
                  decoration: InputDecoration(
                    hintText: "Whats making you unhappy?",

                    floatingLabelStyle: const TextStyle(color: Colors.orange, fontSize: 15),
                    disabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: const BorderSide(color: Colors.grey)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Colors.orange)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Colors.black12,width: 2)),
                    // border: OutlineInputBorder(
                    //     borderRadius: BorderRadius.circular(20),
                    //     borderSide: BorderSide(color: Colors.orange)),
                    // contentPadding: const EdgeInsets.symmetric(horizontal: 30,vertical:20 ),
                  )

              )
            ],
          ),
        ),
      ),
    );
  }
}
