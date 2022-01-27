import 'package:flutter/material.dart';
import 'package:flutter_app/design/colors.dart';
import 'package:flutter_app/design/textstyles.dart';
import 'package:flutter_app/providers/search_data.dart';
import 'package:provider/provider.dart';

class AddressSearchWidget extends StatefulWidget {
  @override
  State<AddressSearchWidget> createState() => _AddressSearchWidgetState();
}

class _AddressSearchWidgetState extends State<AddressSearchWidget> {
  late TextEditingController _controller;

  @override
  void initState() {
    final SearchData searchData =
        Provider.of<SearchData>(context, listen: false);

    super.initState();
    _controller = TextEditingController(text: searchData.keyword);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final SearchData searchData = Provider.of<SearchData>(context);
    return TextFormField(
        controller: _controller,
        // onChanged: searchData.setkeyword,
        textInputAction: TextInputAction.go,
        onFieldSubmitted: (value) => FocusScope.of(context).unfocus(),
        cursorColor: whiteA700,
        style: TextStyle(
            fontFamily: primaryFontFamily,
            color: Colors.white,
            fontWeight: FontWeight.w200,
            fontSize: 1,
            height: 1),
        decoration: const InputDecoration(
            hintText: "Search",
            hintStyle: TextStyle(
                fontFamily: primaryFontFamily,
                color: Colors.white,
                fontWeight: FontWeight.w100,
                fontSize: 18,
                height: 1),
            contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
            border: InputBorder.none));
  }
}
