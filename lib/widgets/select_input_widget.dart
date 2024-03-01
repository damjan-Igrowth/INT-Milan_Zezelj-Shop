import 'package:flutter/material.dart';
import 'package:tech_byte/models/picker_list_item_model.dart';
import 'package:tech_byte/utils/colors.dart';
import 'package:tech_byte/widgets/picker_list_widget.dart';
import 'package:tech_byte/widgets/text_input_widget.dart';

class TBSelectInput extends StatefulWidget {
  final List<TBPickerListItemModel>? items;
  final String label;
  final void Function(String?) onTap;
  final String? selectedItem;
  final bool enabled;
  final Widget? suffixIcon;
  final String? suffixText;
  final String? Function(String?)? validator;
  final bool? isLoading;

  const TBSelectInput(
      {super.key,
      required this.label,
      required this.onTap,
      this.selectedItem,
      this.items,
      this.enabled = true,
      this.suffixIcon,
      this.suffixText,
      this.validator,
      this.isLoading});

  @override
  State<TBSelectInput> createState() => _TBSelectInputState();
}

class _TBSelectInputState extends State<TBSelectInput> {
  final TextEditingController _controller = TextEditingController();
  String? _selectedItem;

  @override
  void initState() {
    _selectedItem = widget.selectedItem;
    _controller.text = _selectedItem ?? "";
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: TBTextInput(
        validator: widget.validator,
        enabled: widget.items == null ? false : widget.enabled,
        suffixIcon: widget.isLoading ?? false
            ? CircularProgressIndicator(
                color: TBColor.app.lightBlue,
              )
            : widget.suffixIcon,
        suffixText: widget.suffixText,
        onTap: () {
          showModalBottomSheet(
              context: context,
              builder: (context) => TBPickerList(
                  title: widget.label,
                  selectedItem: _selectedItem,
                  items: widget.items ?? [],
                  onIconPressed: () => Navigator.of(context).pop(),
                  onItemPressed: (value) {
                    setState(() {
                      _selectedItem = value;
                    });
                    _controller.text = _selectedItem ?? "";
                    widget.onTap(_selectedItem);
                  }));
        },
        textEditingController: _controller,
        label: widget.label,
        readOnly: true,
      ),
    );
  }
}
