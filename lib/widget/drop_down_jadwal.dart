import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

import '../util/color_textstyle.dart';

class DropDownJadwalSection extends StatefulWidget {
  List<String> data;
  String kata;
  double lebar;
  SizedBox jarak;
  DropDownJadwalSection({
    Key? key,
    required this.data,
    required this.kata,
    required this.lebar,
    required this.jarak,
  }) : super(key: key);

  @override
  State<DropDownJadwalSection> createState() => _DropDownJadwalSectionState();
}

class _DropDownJadwalSectionState extends State<DropDownJadwalSection> {
  String? selectedValue;
  final TextEditingController textEditingController = TextEditingController();

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "${widget.kata}:",
          style: subPageStlye.copyWith(
            fontSize: 24,
            fontWeight: FontWeight.w500,
          ),
        ),
        //SIZED BOX HERE
        widget.jarak,
        Container(
            padding: const EdgeInsets.only(left: 10, right: 10),
            width:  widget.lebar,
            height: 30,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: darkBlueColors)),
            child: DropdownButtonHideUnderline(
              child: DropdownButton2(
                  hint: Text(
                    'Select Item',
                    style: dropDownTextStyle,
                  ),
                  items: widget.data.map(buildMenuItem).toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedValue = value;
                    });
                  },
                  buttonHeight: 40,
                  buttonWidth: 100,
                  itemHeight: 40,
                  dropdownMaxHeight: 200,
                  value: selectedValue,
                  searchController: textEditingController,
                  searchInnerWidget: Padding(
                    padding: const EdgeInsets.only(
                      top: 8,
                      bottom: 4,
                      right: 8,
                      left: 8,
                    ),
                    child: TextFormField(
                      controller: textEditingController,
                      decoration: InputDecoration(
                        isDense: true,
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 8,
                        ),
                        hintText: 'Search for an item...',
                        hintStyle: const TextStyle(fontSize: 12),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ),
                  searchMatchFn: (item, searchValue) {
                    return (item.value
                        .toString()
                        .toLowerCase()
                        .contains(searchValue.toLowerCase()));
                  },
                  onMenuStateChange: (isOpen) {
                    if (!isOpen) {
                      textEditingController.clear();
                    }
                  }),
            ))
      ],
    );
  }
}

DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
      value: item,
      child: Text(
        item,
        style: dropDownTextStyle,
      ),
    );
