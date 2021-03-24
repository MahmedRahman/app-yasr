import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomCheckBox extends StatelessWidget {
  CustomCheckBox({
    this.labelCheckBox,
    this.onChanged,
  });

  final String labelCheckBox;
  final Function onChanged;
  

  @override
  Widget build(BuildContext context) {
    var stateCheckBox = false.obs;
    // stateCheckBox = false.obs;
    return 
         Obx(
            () {
             return CheckboxListTile(
              checkColor: Colors.green,
              title: Text(
                labelCheckBox,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              value: stateCheckBox.value,
              onChanged: (newValue) {
                stateCheckBox.value = newValue;
                print(newValue);
                onChanged(newValue);
              },
              controlAffinity:
                  ListTileControlAffinity.leading, //  <-- leading Checkbox
        );
           }
         );
      
    
  }
}
