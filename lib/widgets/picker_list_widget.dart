import 'package:flutter/material.dart';
import 'package:tech_byte/models/picker_list_item_model.dart';
import 'package:tech_byte/utils/colors.dart';
import 'package:tech_byte/utils/constants.dart';
import 'package:tech_byte/utils/icons.dart';

class TBPickerList extends StatefulWidget {
  final String title;
  final List<TBPickerListItemModel> items;
  final void Function()? onIconPressed;
  final void Function(String?) onItemPressed;
  final String? selectedItem;

  const TBPickerList(
      {super.key,
      required this.title,
      this.onIconPressed,
      required this.selectedItem,
      required this.items,
      required this.onItemPressed});

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
              itemBuilder: (context, index) =>
                  widget.items[index].iconData == null
                      ? _ListTile(
                          name: widget.items[index].name,
                          isSelected: _selectedItem == widget.items[index].name,
                          onTap: () {
                            setState(() {
                              _selectedItem = widget.items[index].name;
                            });
                            widget.onItemPressed.call(_selectedItem);
                            Navigator.pop(context);
                          },
                        )
                      : _ListTile.withIcon(
                          name: widget.items[index].name,
                          iconData: widget.items[index].iconData,
                          isSelected: _selectedItem == widget.items[index].name,
                          onTap: () {
                            setState(() {
                              _selectedItem = widget.items[index].name;
                            });
                            widget.onItemPressed.call(_selectedItem);
                            Navigator.of(context).pop();
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
  final IconData? iconData;
  final String name;
  final bool _withIcon;

  const _ListTile({
    this.onTap,
    required this.isSelected,
    required this.name,
  })  : _withIcon = false,
        iconData = null;

  const _ListTile.withIcon({
    this.onTap,
    required this.isSelected,
    required this.iconData,
    required this.name,
  }) : _withIcon = true;

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
            widget._withIcon
                ? Icon(
                    widget.iconData,
                    size: TBDimensions.pickerList.iconSize,
                    color: widget.isSelected
                        ? TBColor.pickerList.lightBlue
                        : TBColor.pickerList.grey,
                  )
                : Container(),
            widget._withIcon
                ? SizedBox(
                    width: TBDimensions.pickerList.itemContentSpacing,
                  )
                : Container(),
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
