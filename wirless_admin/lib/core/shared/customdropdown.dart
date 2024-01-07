import 'package:drop_down_list/drop_down_list.dart';
import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:wirless_delivery/core/function/validator.dart';

class Dropdownlist extends StatefulWidget {
  final String title;
  final List<SelectedListItem> listdata;
  final TextEditingController dropdownSelctedname;
  final TextEditingController dropdownSelctedid;
  const Dropdownlist(
      {super.key,
      required this.title,
      required this.listdata,
      required this.dropdownSelctedname,
      required this.dropdownSelctedid});

  @override
  State<Dropdownlist> createState() => _DropdownlistState();
}

class _DropdownlistState extends State<Dropdownlist> {
  openn(context) {
    DropDownState(
      DropDown(
        bottomSheetTitle: Text(
          widget.title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
            fontFamily: 'myfont1',
            color: Colors.black,
          ),
        ),
        submitButtonChild: const Text(
          'Done',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            fontFamily: 'myfont1',
            color: Colors.black,
          ),
        ),
        data: widget.listdata ?? [],
        selectedItems: (List<dynamic> selectedList) {
          SelectedListItem selectedListItem = selectedList[0];
          widget.dropdownSelctedname.text = selectedListItem.name;
          widget.dropdownSelctedid.text = selectedListItem.value!;
        },
      ),
    ).showModal(context);
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.dropdownSelctedname,
      cursorColor: Colors.black,
      onTap: () {
        FocusScope.of(context).unfocus();
        openn(context);
      },
      validator: (val) {
        return validator(val!, 1, 20, "type");
      },
      decoration: InputDecoration(
        suffixIcon: const InkWell(
          child: Icon(
            Icons.arrow_drop_down,
            size: 33,
            color: Colors.black,
          ),
        ),
        filled: true,
        fillColor: Color.fromARGB(255, 255, 255, 255),
        contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        hintText: widget.dropdownSelctedname.text == ""
            ? widget.title
            : widget.dropdownSelctedname.text,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
      ),
    );
  }
}
