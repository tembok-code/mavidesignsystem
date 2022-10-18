import 'package:flutter/material.dart';
import 'package:mavi_design_system/components/elements/frame.dart';
import 'package:mavi_design_system/mavi_design_system.dart';

import '../../components/components_preview.dart';

class ContentSwitch extends StatefulWidget {
  const ContentSwitch({super.key});

  @override
  State<ContentSwitch> createState() => _ContentSwitchState();
}

class _ContentSwitchState extends State<ContentSwitch> {
  //
  bool checked = false;
  ButtonVariant selectedVariant = ButtonVariant.solid;
  List<bool> selectedSizeState = [false, true, false];
  ButtonSize selectedSize = ButtonSize.md;
  List<ButtonSize> buttonSizeOptions = [
    ButtonSize.sm,
    ButtonSize.md,
    ButtonSize.lg
  ];
  //
  //
  toggleSwitch(bool value) => setState(() => checked = value);
  setVariant(ButtonVariant value) => setState(() => selectedVariant = value);
  setSize(int index) => setState(() {
        selectedSizeState = selectedSizeState.map((e) => false).toList();
        selectedSizeState[index] = true;
        selectedSize = buttonSizeOptions[index];
      });
  //
  @override
  Widget build(BuildContext context) {
    //
    var colorScheme = Theme.of(context).colorScheme;
    //
    String title = "Switch";
    //

    return CustomScrollView(slivers: [
      SectionWidget(title: '$title - Variants', slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: margin_lg),
            child: Row(
              children: [
                Expanded(
                    child: Wrap(
                  spacing: spacing_md,
                  runSpacing: spacing_md,
                  alignment: WrapAlignment.center,
                  runAlignment: WrapAlignment.center,
                  children: [
                    ButtonVariant.solid,
                    ButtonVariant.soft,
                    ButtonVariant.outlined,
                    ButtonVariant.plain
                  ]
                      .map((e) => MSwitch(
                            value: checked,
                            onChanged: (value) => toggleSwitch(value),
                            variant: e,
                            //label: 'Solid',
                            //disabled: disabled,
                            size: selectedSize,
                          ))
                      .toList(),
                )),
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MaviTextTheme().h4(text: 'Playground'),
                    /* Row(
                      children: [
                        MaviTextTheme().bodyBold(text: 'Disabled'),
                        Switch(
                            value: checked,
                            onChanged: (value) => toggleDisabled())
                      ],
                    ), */
                    Row(
                      children: [
                        MaviTextTheme().bodyBold(text: 'Size'),
                        ToggleButtons(
                          isSelected: selectedSizeState,
                          onPressed: (index) => setSize(index),
                          children: const [
                            Text('Small'),
                            Text('Medium'),
                            Text('Large')
                          ],
                        )
                      ],
                    ),
                    Row(
                      children: [
                        MaviTextTheme().bodyBold(text: 'Variant'),
                        DropdownButtonHideUnderline(
                          child: DropdownButton(
                              value: selectedVariant,
                              onChanged: (value) =>
                                  setVariant(value ?? ButtonVariant.solid),
                              items: [
                                DropdownMenuItem(
                                    value: ButtonVariant.solid,
                                    child: MaviTextTheme().body(text: 'Solid')),
                                DropdownMenuItem(
                                    value: ButtonVariant.soft,
                                    child: MaviTextTheme().body(text: 'Soft')),
                                DropdownMenuItem(
                                    value: ButtonVariant.outlined,
                                    child:
                                        MaviTextTheme().body(text: 'Outlined')),
                                DropdownMenuItem(
                                    value: ButtonVariant.plain,
                                    child: MaviTextTheme().body(text: 'Plain'))
                              ]),
                        )
                      ],
                    ),
                  ],
                )),
              ],
            ),
          ),
        ),
      ]),
    ]);
  }
}
