import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomDropdownButton extends StatelessWidget {
  const CustomDropdownButton({
    Key key,
    @required this.listDropdown,
    this.listDropdownValue,
    this.labelDropdownButton,
    this.onChanged, this.labelhint
  }) : super(key: key);

  final List<String> listDropdown;
  final List<int> listDropdownValue;
  final String labelDropdownButton;
  final String labelhint;
  final Function onChanged;

  @override
  Widget build(BuildContext context) {

    var selectText = '-1'.obs;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: SizedBox(
            height: labelDropdownButton.isEmpty ? 0 : null,
            child: Text(
              labelDropdownButton,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10),
          child: Container(
            decoration: BoxDecoration(
                border: Border.all(width: 2, color: Color(0XFF707070)),
                borderRadius: BorderRadius.all(Radius.circular(10))),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Obx(
                () {
                  return DropdownButton(
                     hint: Text(labelhint??labelDropdownButton),
                    value: selectText.value == '-1' ? null : selectText.value,
                  
                    elevation: 2,
                 
                    icon: Icon(Icons.arrow_drop_down),
                    iconSize: 36,
                    isExpanded: true,
                    items: new List.generate(listDropdown.length, (index) {
                      return new DropdownMenuItem(
                        
                          value: listDropdownValue.elementAt(index).toString(),
                          child:
                              Text(listDropdown.elementAt(index).toString()));
                    }),
                    onChanged: (value){
                      selectText.value = value;
                      onChanged(value);
                    },
                    
                  );
                },
              ),
            ),
          ),
        )
      ],
    );
  }
}
