// dart format width=80
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_import, prefer_relative_imports, directives_ordering

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AppGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:widgetbook/widgetbook.dart' as _widgetbook;
import 'package:widgetbook_workspace/widgets/home_list.dart'
    as _widgetbook_workspace_widgets_home_list;
import 'package:widgetbook_workspace/widgets/program_item.dart'
    as _widgetbook_workspace_widgets_program_item;
import 'package:widgetbook_workspace/widgets/search_bar.dart'
    as _widgetbook_workspace_widgets_search_bar;
import 'package:widgetbook_workspace/widgets/selected_program.dart'
    as _widgetbook_workspace_widgets_selected_program;
import 'package:widgetbook_workspace/widgets/tonight_carrousel.dart'
    as _widgetbook_workspace_widgets_tonight_carrousel;

final directories = <_widgetbook.WidgetbookNode>[
  _widgetbook.WidgetbookFolder(
    name: 'views',
    children: [
      _widgetbook.WidgetbookFolder(
        name: 'pages',
        children: [
          _widgetbook.WidgetbookFolder(
            name: 'v2',
            children: [
              _widgetbook.WidgetbookFolder(
                name: 'widgets',
                children: [
                  _widgetbook.WidgetbookComponent(
                    name: 'HomeList',
                    useCases: [
                      _widgetbook.WidgetbookUseCase(
                        name: 'Default',
                        builder: _widgetbook_workspace_widgets_home_list
                            .buildHomeListUseCase,
                      ),
                    ],
                  ),
                  _widgetbook.WidgetbookComponent(
                    name: 'ProgramItem',
                    useCases: [
                      _widgetbook.WidgetbookUseCase(
                        name: 'Default',
                        builder: _widgetbook_workspace_widgets_program_item
                            .buildProgramItemUseCase,
                      ),
                    ],
                  ),
                  _widgetbook.WidgetbookComponent(
                    name: 'SelectedProgramSelector',
                    useCases: [
                      _widgetbook.WidgetbookUseCase(
                        name: 'Default',
                        builder: _widgetbook_workspace_widgets_selected_program
                            .buildProgramItemUseCase,
                      ),
                    ],
                  ),
                  _widgetbook.WidgetbookComponent(
                    name: 'TonightCarrousel',
                    useCases: [
                      _widgetbook.WidgetbookUseCase(
                        name: 'Default',
                        builder: _widgetbook_workspace_widgets_tonight_carrousel
                            .buildTonightCarrouselUseCase,
                      ),
                    ],
                  ),
                  _widgetbook.WidgetbookComponent(
                    name: 'TvProgSearchBar',
                    useCases: [
                      _widgetbook.WidgetbookUseCase(
                        name: 'Default',
                        builder: _widgetbook_workspace_widgets_search_bar
                            .buildSearchBarUseCase,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    ],
  ),
];
