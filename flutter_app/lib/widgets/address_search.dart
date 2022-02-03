import 'package:flutter/material.dart';
import 'package:flutter_app/design/colors.dart';
import 'package:flutter_app/design/textstyles.dart';
import 'package:flutter_app/providers/search_data.dart';
import 'package:provider/provider.dart';

class AddressSearchWidget extends StatefulWidget {
  final TextEditingController controller;

  const AddressSearchWidget({Key? key, required this.controller})
      : super(key: key);
  @override
  State<AddressSearchWidget> createState() => _AddressSearchWidgetState();
}

class _AddressSearchWidgetState extends State<AddressSearchWidget> {
  @override
  void initState() {
    final SearchData searchData =
        Provider.of<SearchData>(context, listen: false);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final SearchData searchData = Provider.of<SearchData>(context);
    return TextFormField(
        controller: widget.controller,
        onChanged: (changed) {
          searchData.setkeyword(changed);
          // context.watch<WeatherData>().setWeatherFromAddress(address);
        },
        textInputAction: TextInputAction.go,
        onFieldSubmitted: (value) => FocusScope.of(context).unfocus(),
        cursorColor: Colors.white,
        style: title3.override(fontWeight: FontWeight.w200, fontSize: 20),
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
