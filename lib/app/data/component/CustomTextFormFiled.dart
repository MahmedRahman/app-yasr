import 'package:flutter/material.dart';

class CustomTextFormFiled extends StatelessWidget {
  final String inputLabel;
  final String inputHit;
  final TextEditingController inputController;
  final TextInputType keyboardType;
  final FormFieldSetter<String> onValidator;
 
  const CustomTextFormFiled({
    Key key,
    this.inputLabel,
    this.inputHit,
    this.keyboardType,
    this.onValidator,
    this.inputController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: SizedBox(
              height: inputLabel == null ? 0 : null,
              child: Text(
                inputLabel == null ? '' : inputLabel,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          TextFormField(
            controller: inputController,
            keyboardType: keyboardType,
            validator: onValidator,
            obscureText: keyboardType!=TextInputType.visiblePassword ? false : true ,
            decoration: InputDecoration(
              errorStyle: TextStyle(fontSize: 14),
              
              isDense: true,
              filled: true,
              contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
              fillColor: Colors.white,
              hintText: inputHit,
              hintStyle: TextStyle(fontWeight: FontWeight.bold),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                borderSide: BorderSide(color: Color(0XFF707070), width: 2),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomTextAreaFormFiled extends StatelessWidget {
  final String inputLabel;
  final String inputHit;
  final TextInputType keyboardType;
  final TextEditingController inputController;
  const CustomTextAreaFormFiled({
    Key key,
    this.inputLabel,
    this.inputHit,
    this.keyboardType,
    this.inputController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              inputLabel,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          TextFormField(
            keyboardType: keyboardType,
            controller: inputController,
            minLines: 5, //Normal textInputField will be displayed
            maxLines: 5,

            decoration: InputDecoration(
              isDense: true,
              filled: true,
              contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
              fillColor: Colors.white,
              hintText: inputHit,
              hintStyle: TextStyle(fontWeight: FontWeight.bold),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                borderSide: BorderSide(color: Color(0XFF707070), width: 2),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
