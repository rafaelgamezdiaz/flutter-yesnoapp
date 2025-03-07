import 'package:flutter/material.dart';

class MessageFieldBox extends StatelessWidget {

  final ValueChanged<String> onValue;

  const MessageFieldBox({
    super.key, 
    required this.onValue
    });

  @override
  Widget build(BuildContext context) {

   // final colors = Theme.of(context).colorScheme;
    final focusNode = FocusNode();
    final textController = TextEditingController();

    final inputDecoration = InputDecoration(
        hintText: 'End your message with "?"',
        fillColor: Colors.amber,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        suffixIcon: IconButton(
          icon: const Icon(Icons.send),
          onPressed: () {
            final textValue = textController.value.text;
            onValue(textValue);
          },
        ),
      );

    return TextFormField(
      controller: textController,
      keyboardType: TextInputType.text,
      keyboardAppearance: Brightness.dark,
      decoration: inputDecoration,
      focusNode: focusNode,
      onTapOutside: (event) {
        focusNode.unfocus();
      },
      onFieldSubmitted: (value) {   
        textController.clear();
        focusNode.requestFocus();
        onValue(value);
      },
    );
  }
}



 // final outlineInputBorder = UnderlineInputBorder(
    //   borderSide: BorderSide(
    //     color: Colors.transparent,
    //   ),
    //   borderRadius: BorderRadius.circular(20),
    // );