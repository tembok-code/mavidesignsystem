import 'package:flutter/material.dart';
import 'package:mavi_design_system/components/elements/contents/text.dart';
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
  bool checked = true;
  ButtonVariant selectedVariant = ButtonVariant.solid;
  List<bool> selectedSizeState = [false, true, false];
  ButtonSize selectedSize = ButtonSize.sm;
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
                    const MText(
                      'Playground',
                      style: MaviTextStyles.h4,
                    ),
                    Row(
                      children: [
                        const MText(
                          'Size',
                          fontWeight: FontWeight.bold,
                        ),
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
                        const MText(
                          'Variant',
                          fontWeight: FontWeight.bold,
                        ),
                        DropdownButtonHideUnderline(
                          child: DropdownButton(
                              value: selectedVariant,
                              onChanged: (value) =>
                                  setVariant(value ?? ButtonVariant.solid),
                              items: ButtonVariant.values
                                  .map((e) => DropdownMenuItem(
                                      value: e,
                                      child: MText(e.toString().toUpperCase())))
                                  .toList()),
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
      SectionWidget(title: '$title - Sizes', slivers: [
        SliverToBoxAdapter(
            child: MFrame(
          child: Wrap(
            spacing: spacing_md,
            runSpacing: spacing_md,
            alignment: WrapAlignment.center,
            runAlignment: WrapAlignment.center,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: ButtonSize.values
                .map(
                  (e) => MSwitch(
                    value: checked,
                    onChanged: (value) => toggleSwitch(value),
                    variant: selectedVariant,
                    //disabled: disabled,
                    size: e,
                  ),
                )
                .toList(),
          ),
        ))
      ]),
      SectionWidget(title: '$title - On Off Icons', slivers: [
        SliverToBoxAdapter(
            child: MFrame(
          child: Wrap(
            spacing: spacing_md,
            runSpacing: spacing_md,
            alignment: WrapAlignment.center,
            runAlignment: WrapAlignment.center,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: ButtonSize.values
                .map(
                  (e) => MSwitch(
                    value: checked,
                    onChanged: (value) => toggleSwitch(value),
                    variant: selectedVariant,
                    onIcon: Icons.light_mode_outlined,
                    offIcon: Icons.dark_mode_outlined,
                    //disabled: disabled,
                    size: e,
                  ),
                )
                .toList(),
          ),
        ))
      ]),
    ]);
  }
}
