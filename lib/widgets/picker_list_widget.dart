import 'package:flutter/material.dart';
import 'package:tech_byte/utils/colors.dart';
import 'package:tech_byte/utils/constants.dart';
import 'package:tech_byte/utils/icons.dart';

class TBPickerList extends StatefulWidget {
  final String title;
  final List<(IconData, String)> items;
  final void Function()? onIconPressed;
  final String? selectedItem;

  const TBPickerList({
    super.key,
    required this.title,
    this.onIconPressed,
    required this.selectedItem,
    required this.items,
  });

  @override
  State<TBPickerList> createState() => _TBPickerListState();
}

class _TBPickerListState extends State<TBPickerList> {
  late String? _selectedItem;

  @override
  void initState() {
    _selectedItem = widget.selectedItem;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
          borderRadius:
              BorderRadius.circular(TBDimensions.pickerList.borderRadius)),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(TBDimensions.pickerList.headerPadding),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    widget.title,
                    style: TextStyle(
                        color: TBColor.pickerList.black,
                        fontFamily: "Inter",
                        fontSize: 16,
                        fontWeight: FontWeight.w700),
                  ),
                ),
                IconButton(
                  icon: const Icon(TBIcons.chevronDown),
                  onPressed: widget.onIconPressed,
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: widget.items.length,
              itemBuilder: (context, index) => _ListTile(
                iconData: widget.items[index].$1,
                name: widget.items[index].$2,
                isSelected: _selectedItem == widget.items[index].$2,
                onTap: () {
                  setState(() {
                    _selectedItem = widget.items[index].$2;
                  });
                  Navigator.of(context).pop(_selectedItem);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ListTile extends StatefulWidget {
  final void Function()? onTap;
  final bool isSelected;
  final IconData iconData;
  final String name;
  const _ListTile(
      {super.key,
      this.onTap,
      required this.isSelected,
      required this.iconData,
      required this.name});

  @override
  State<_ListTile> createState() => _ListTileState();
}

class _ListTileState extends State<_ListTile> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        color: widget.isSelected
            ? TBColor.pickerList.selectedItemBackground
            : Colors.transparent,
        padding: EdgeInsets.symmetric(
            horizontal: TBDimensions.pickerList.itemContentHorizontalPadding,
            vertical: TBDimensions.pickerList.itemContentVerticalPadding),
        child: Row(
          children: [
            Icon(
              widget.iconData,
              size: TBDimensions.pickerList.iconSize,
              color: widget.isSelected
                  ? TBColor.pickerList.lightBlue
                  : TBColor.pickerList.grey,
            ),
            SizedBox(
              width: TBDimensions.pickerList.itemContentSpacing,
            ),
            Expanded(
              child: Text(
                widget.name,
                style: widget.isSelected
                    ? TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: TBColor.pickerList.lightBlue)
                    : TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: TBColor.pickerList.grey,
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
