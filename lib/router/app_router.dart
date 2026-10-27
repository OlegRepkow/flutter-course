import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_lab/core/network/news_api/fake/news_api_fake.dart';
import 'package:flutter_lab/core/network/products_api/products_api.dart';
import 'package:flutter_lab/core/storage/prefs_storage/prefs_storage.dart';
import 'package:flutter_lab/features/animations/presentation/explicit_animations/examples/animated_buider.dart';
import 'package:flutter_lab/features/animations/presentation/explicit_animations/examples/animation_controller.dart';
import 'package:flutter_lab/features/animations/presentation/explicit_animations/examples/build_in_transitions.dart';
import 'package:flutter_lab/features/animations/presentation/explicit_animations/examples/tweens_and_animations.dart';
import 'package:flutter_lab/features/animations/presentation/explicit_animations/explicit_animations_screen.dart';
import 'package:flutter_lab/features/animations/presentation/implicit_animations/animated_box_playground.dart';
import 'package:flutter_lab/features/animations/presentation/implicit_animations/examples/animated_align_example.dart';
import 'package:flutter_lab/features/animations/presentation/implicit_animations/examples/animated_container_example.dart';
import 'package:flutter_lab/features/animations/presentation/implicit_animations/examples/animated_opacity_example.dart';
import 'package:flutter_lab/features/animations/presentation/implicit_animations/examples/animated_padding_example.dart';
import 'package:flutter_lab/features/animations/presentation/implicit_animations/examples/animated_positioned_example.dart';
import 'package:flutter_lab/features/animations/presentation/implicit_animations/examples/animated_switcher_example.dart';
import 'package:flutter_lab/features/animations/presentation/implicit_animations/examples/tween_animation_builder_example.dart';
import 'package:flutter_lab/features/animations/presentation/implicit_animations/implicit_animations_screen.dart';
import 'package:flutter_lab/features/animations/presentation/screens/animations_main_screen.dart';
import 'package:flutter_lab/features/app/screens/home_screen.dart';
import 'package:flutter_lab/features/app/screens/page_names.dart';
import 'package:flutter_lab/features/error_handling/data/data_source/products_data_source.dart';
import 'package:flutter_lab/features/error_handling/data/repository/products_repository.dart';
import 'package:flutter_lab/features/error_handling/presentation/cubit/products_cubit.dart';
import 'package:flutter_lab/features/error_handling/presentation/ui/screens/error_handling_main_screen.dart';
import 'package:flutter_lab/features/error_handling/presentation/ui/screens/products_page_example.dart';
import 'package:flutter_lab/features/navigation/presentation/screens/base_navigation/base_navigation_section_screen.dart';
import 'package:flutter_lab/features/navigation/presentation/screens/base_navigation/simple_empty_screen.dart';
import 'package:flutter_lab/features/navigation/presentation/screens/base_navigation/simple_screen_with_data.dart';
import 'package:flutter_lab/features/navigation/presentation/screens/base_navigation/simple_screen_with_returning_data.dart';
import 'package:flutter_lab/features/navigation/presentation/screens/named_navigation/named_routes_navigation.dart';
import 'package:flutter_lab/features/navigation/presentation/screens/navigation_main_screen.dart';
import 'package:flutter_lab/features/push_notifications/push_notifications_screen.dart';
import 'package:flutter_lab/features/rest_api/presentation/decoding_example_screen.dart';
import 'package:flutter_lab/features/rest_api/presentation/rest_api_base_screen.dart';
import 'package:flutter_lab/features/state_managment/bloc_couter_example/bloc_counter_example_screen.dart';
import 'package:flutter_lab/features/state_managment/common_mistakes_screen.dart';
import 'package:flutter_lab/features/state_managment/cubit_counter_example/cubit_counter_example_screen.dart';
import 'package:flutter_lab/features/state_managment/simple_example.dart/simple_state_management_screen.dart';
import 'package:flutter_lab/features/state_managment/state_management_main_screen.dart';
import 'package:flutter_lab/features/storage/presentation/UI/screens/saving_large_data_screen.dart';
import 'package:flutter_lab/features/storage/presentation/UI/screens/settings_screen.dart';
import 'package:flutter_lab/features/storage/presentation/UI/screens/storage_base_screen.dart';
import 'package:flutter_lab/features/top_news/data/data_source/top_news_data_source.dart';
import 'package:flutter_lab/features/top_news/data/repository/news_repository.dart';
import 'package:flutter_lab/features/top_news/presentation/bloc/news_cubit.dart';
import 'package:flutter_lab/features/top_news/presentation/ui/top_news_screen.dart';
import 'package:flutter_lab/features/top_news/presentation/ui/web_view_article.dart';
import 'package:flutter_lab/features/widgets/presentation/screens/widgets_first_part_screen.dart';
import 'package:flutter_lab/features/widgets/presentation/screens/widgets_main_screen.dart';
import 'package:flutter_lab/features/widgets/presentation/screens/widgets_second_part_screen.dart';
import 'package:flutter_lab/features/widgets/presentation/screens/widgets_third_part_screen.dart';
import 'package:flutter_lab/features/widgets/presentation/widgets/part1/align_example_screen.dart';
import 'package:flutter_lab/features/widgets/presentation/widgets/part1/buttons_example_screen.dart';
import 'package:flutter_lab/features/widgets/presentation/widgets/part1/center_example_screen.dart';
import 'package:flutter_lab/features/widgets/presentation/widgets/part1/column_example_screen.dart';
import 'package:flutter_lab/features/widgets/presentation/widgets/part1/container_example_screen.dart';
import 'package:flutter_lab/features/widgets/presentation/widgets/part1/expanded_example_screen.dart';
import 'package:flutter_lab/features/widgets/presentation/widgets/part1/padding_example_screen.dart';
import 'package:flutter_lab/features/widgets/presentation/widgets/part1/progress_indicators_example_screen.dart';
import 'package:flutter_lab/features/widgets/presentation/widgets/part1/row_example_screen.dart';
import 'package:flutter_lab/features/widgets/presentation/widgets/part1/scroll_example_screen.dart';
import 'package:flutter_lab/features/widgets/presentation/widgets/part1/sized_box_example_screen.dart';
import 'package:flutter_lab/features/widgets/presentation/widgets/part1/stack_example_screen.dart';
import 'package:flutter_lab/features/widgets/presentation/widgets/part1/text_example_screen.dart';
import 'package:flutter_lab/features/widgets/presentation/widgets/part2/custom_widgets_example_screen.dart';
import 'package:flutter_lab/features/widgets/presentation/widgets/part2/gesture_example_screen.dart';
import 'package:flutter_lab/features/widgets/presentation/widgets/part2/images_example_screen.dart';
import 'package:flutter_lab/features/widgets/presentation/widgets/part2/text_field_example_screen.dart';
import 'package:flutter_lab/features/widgets/presentation/widgets/part2/widget_types_example_screen.dart';
import 'package:flutter_lab/features/widgets/presentation/widgets/part3/example_1.dart';
import 'package:flutter_lab/features/widgets/presentation/widgets/part3/example_2.dart';
import 'package:flutter_lab/features/widgets/presentation/widgets/part3/example_3.dart';
import 'package:flutter_lab/features/widgets/presentation/widgets/part3/example_4.dart';
import 'package:flutter_lab/features/widgets/presentation/widgets/part3/example_5.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      name: ScreenNames.home,
      builder: (context, state) => const HomeScreen(),
      routes: [
        // Widgets routes
        GoRoute(
          path: 'widgets',
          name: ScreenNames.widgets,
          builder: (context, state) => const WidgetsScreen(),
          routes: [
            GoRoute(
              path: 'widgets-first-part',
              name: ScreenNames.widgetsFirstPart,
              builder: (context, state) => const WidgetsFirstPartScreen(),
              routes: [
                GoRoute(
                  path: 'container',
                  name: ScreenNames.containerExample,
                  builder: (context, state) => const ContainerExampleScreen(),
                ),
                GoRoute(
                  path: 'row',
                  name: ScreenNames.rowExample,
                  builder: (context, state) => const RowExampleScreen(),
                ),
                GoRoute(
                  path: 'column',
                  name: ScreenNames.columnExample,
                  builder: (context, state) => const ColumnExampleScreen(),
                ),
                GoRoute(
                  path: 'expanded',
                  name: ScreenNames.expandedExample,
                  builder: (context, state) => const ExpandedExampleScreen(),
                ),
                GoRoute(
                  path: 'stack',
                  name: ScreenNames.stackExample,
                  builder: (context, state) => const StackExampleScreen(),
                ),
                GoRoute(
                  path: 'sized-box',
                  name: ScreenNames.sizedBoxExample,
                  builder: (context, state) => const SizedBoxExampleScreen(),
                ),
                GoRoute(
                  path: 'padding',
                  name: ScreenNames.paddingExample,
                  builder: (context, state) => const PaddingExampleScreen(),
                ),
                GoRoute(
                  path: 'align',
                  name: ScreenNames.alignExample,
                  builder: (context, state) => const AlignExampleScreen(),
                ),
                GoRoute(
                  path: 'center',
                  name: ScreenNames.centerExample,
                  builder: (context, state) => const CenterExampleScreen(),
                ),
                GoRoute(
                  path: 'text',
                  name: ScreenNames.textExample,
                  builder: (context, state) => const TextExampleScreen(),
                ),
                GoRoute(
                  path: 'buttons',
                  name: ScreenNames.buttonsExample,
                  builder: (context, state) => const ButtonsExampleScreen(),
                ),
                GoRoute(
                  path: 'scroll',
                  name: ScreenNames.scrollExample,
                  builder: (context, state) => const ScrollExampleScreen(),
                ),
                GoRoute(
                  path: 'progress-indicators',
                  name: ScreenNames.progressIndicatorsExample,
                  builder: (context, state) =>
                      const ProgressIndicatorsExampleScreen(),
                ),
              ],
            ),
            GoRoute(
              path: 'widgets-second-part',
              name: ScreenNames.widgetsSecondPart,
              builder: (context, state) => const WidgetsSecondPartScreen(),
              routes: [
                GoRoute(
                  path: 'custom-widgets',
                  name: ScreenNames.customWidgetsExample,
                  builder: (context, state) =>
                      const CustomWidgetsExampleScreen(),
                ),
                GoRoute(
                  path: 'widget-types',
                  name: ScreenNames.widgetTypesExample,
                  builder: (context, state) => const WidgetTypesExampleScreen(),
                ),
                GoRoute(
                  path: 'gesture',
                  name: ScreenNames.gestureExample,
                  builder: (context, state) => const GestureExampleScreen(),
                ),
                GoRoute(
                  path: 'text-field',
                  name: ScreenNames.textFieldExample,
                  builder: (context, state) => const TextFieldExampleScreen(),
                ),
                GoRoute(
                  path: 'image',
                  name: ScreenNames.imageExample,
                  builder: (context, state) => const ImageExampleScreen(),
                ),
              ],
            ),
            GoRoute(
              path: 'understanding-constraints',
              name: ScreenNames.understandingConstraints,
              builder: (context, state) => const WidgetsThirdPartScreen(),
              routes: [
                GoRoute(
                  path: 'example-1',
                  name: ScreenNames.understandingConstraintsExample1,
                  builder: (context, state) =>
                      const UnderstandingConstraintsExample1(),
                ),
                GoRoute(
                  path: 'example-2',
                  name: ScreenNames.understandingConstraintsExample2,
                  builder: (context, state) =>
                      const UnderstandingConstraintsExample2(),
                ),
                GoRoute(
                  path: 'example-3',
                  name: ScreenNames.understandingConstraintsExample3,
                  builder: (context, state) =>
                      const UnderstandingConstraintsExample3(),
                ),
                GoRoute(
                  path: 'example-4',
                  name: ScreenNames.understandingConstraintsExample4,
                  builder: (context, state) =>
                      const UnderstandingConstraintsExample4(),
                ),
                GoRoute(
                  path: 'example-5',
                  name: ScreenNames.understandingConstraintsExample5,
                  builder: (context, state) =>
                      const UnderstandingConstraintsExample5(),
                ),
              ],
            ),
          ],
        ),
        // Navigation routes
        GoRoute(
          path: 'navigation',
          name: ScreenNames.navigation,
          builder: (context, state) => const NavigationMainScreen(),
          routes: [
            GoRoute(
              path: 'base-navigation',
              name: ScreenNames.baseNavigation,
              builder: (context, state) => const BaseNavigationSectionScreen(),
              routes: [
                GoRoute(
                  path: 'simple-empty',
                  name: ScreenNames.simpleEmptyScreen,
                  builder: (context, state) => const SimpleEmptyScreen(),
                ),
                GoRoute(
                  path: 'simple-empty-with-custom-transition',
                  name: ScreenNames.simpleEmptyScreenWithCustomTransition,
                  pageBuilder: (context, state) {
                    return CustomTransitionPage(
                      child: const SimpleEmptyScreen(),
                      transitionsBuilder:
                          (context, animation, secondaryAnimation, child) {
                            return RotationTransition(
                              turns: animation,
                              child: child,
                            );
                          },
                    );
                  },
                ),
                GoRoute(
                  path: 'simple-with-data',
                  name: ScreenNames.simpleTransitionWithArguments,
                  builder: (context, state) => SimpleScreenWithData(
                    id: state.uri.queryParameters['id'] ?? '',
                  ),
                ),
                GoRoute(
                  path: 'simple-with-returning-data',
                  name: ScreenNames.simpleScreenWithReturningData,
                  builder: (context, state) => SimpleScreenWithReturningData(
                    guestName: state.uri.queryParameters['guestName'] ?? '',
                  ),
                ),
              ],
            ),
            GoRoute(
              path: 'named-routes',
              name: ScreenNames.namedRoutesNavigation,
              builder: (context, state) => const NamedRoutesNavigationScreen(),
              routes: [
                GoRoute(
                  path: 'simple-empty',
                  builder: (context, state) => const SimpleEmptyScreen(),
                ),
                GoRoute(
                  path: 'simple-with-data/:id',
                  builder: (context, state) => SimpleScreenWithData(
                    id: state.pathParameters['id'] ?? '',
                  ),
                ),
              ],
            ),
          ],
        ),
        // State Management routes
        GoRoute(
          path: 'state-management',
          name: ScreenNames.stateManagement,
          builder: (context, state) => const StateManagementMainScreen(),
          routes: [
            GoRoute(
              path: 'simple-state-management',
              name: ScreenNames.simpleStateManagement,
              builder: (context, state) => const SimpleStateManagementScreen(),
            ),
            GoRoute(
              path: 'bloc-counter-example',
              name: ScreenNames.blocCounterExample,
              builder: (context, state) => const BlocCounterExampleScreen(),
            ),
            GoRoute(
              path: 'cubit-counter-example',
              name: ScreenNames.cubitCounterExample,
              builder: (context, state) => const CubitCounterExampleScreen(),
            ),
            GoRoute(
              path: 'common-mistakes',
              name: ScreenNames.commonMistakes,
              builder: (context, state) => const CommonMistakesScreen(),
            ),
          ],
        ),
        // Animations routes
        GoRoute(
          path: 'animations',
          name: ScreenNames.animations,
          builder: (context, state) => const AnimationsMainScreen(),
          routes: [
            GoRoute(
              path: 'implicit-animations',
              name: ScreenNames.implicitAnimations,
              builder: (context, state) => const ImplicitAnimationsScreen(),
              routes: [
                GoRoute(
                  path: 'animated-container-example',
                  name: ScreenNames.animatedContainerExample,
                  builder: (context, state) => const AnimatedContainerExample(),
                ),
                GoRoute(
                  path: 'animated-opacity-example',
                  name: ScreenNames.animatedOpacityExample,
                  builder: (context, state) => const AnimatedOpacityExample(),
                ),
                GoRoute(
                  path: 'animated-align-example',
                  name: ScreenNames.animatedAlignExample,
                  builder: (context, state) => const AnimatedAlignExample(),
                ),
                GoRoute(
                  path: 'animated-padding-example',
                  name: ScreenNames.animatedPaddingExample,
                  builder: (context, state) => const AnimatedPaddingExample(),
                ),
                GoRoute(
                  path: 'animated-positioned-example',
                  name: ScreenNames.animatedPositionedExample,
                  builder: (context, state) =>
                      const AnimatedPositionedExample(),
                ),
                GoRoute(
                  path: 'animated-switcher-example',
                  name: ScreenNames.animatedSwitcherExample,
                  builder: (context, state) => const AnimatedSwitcherExample(),
                ),
                GoRoute(
                  path: 'tween-animation-builder-example',
                  name: ScreenNames.tweenAnimationBuilderExample,
                  builder: (context, state) =>
                      const TweenAnimationBuilderExample(),
                ),
                GoRoute(
                  path: 'animated-box-playground',
                  name: ScreenNames.animatedBoxPlayground,
                  builder: (context, state) => const AnimatedBoxPlayground(),
                ),
              ],
            ),
            GoRoute(
              path: 'explicit-animations',
              name: ScreenNames.explicitAnimations,
              builder: (context, state) => const ExplicitAnimationsScreen(),
              routes: [
                GoRoute(
                  path: 'animation-controller-example',
                  name: ScreenNames.animationControllerExample,
                  builder: (context, state) =>
                      const AnimationControllerExample(),
                ),
                GoRoute(
                  path: 'tween-and-animation-example',
                  name: ScreenNames.tweenAndAnimationExample,
                  builder: (context, state) => const TweenAndAnimationExample(),
                ),
                GoRoute(
                  path: 'animated-builder-example',
                  name: ScreenNames.animatedBuilderExample,
                  builder: (context, state) => const AnimatedBuilderExample(),
                ),
                GoRoute(
                  path: 'fade-transition-example',
                  name: ScreenNames.fadeTransitionExample,
                  builder: (context, state) => const BuildInTransitionExample(),
                ),
              ],
            ),
          ],
        ),
        // Error Handling routes
        GoRoute(
          path: 'error-handling',
          name: ScreenNames.errorHandling,
          builder: (context, state) => const ErrorHandlingMainScreen(),
          routes: [
            GoRoute(
              path: 'products-page-example',
              name: ScreenNames.productsPageExample,
              builder: (context, state) => BlocProvider(
                create: (context) => ProductsCubit(
                  ProductsRepositoryImpl(
                    ProductsDataSourceImpl(ProductsApiImpl()),
                  ),
                )..getProducts(),
                child: const ProductsPageExample(),
              ),
            ),
          ],
        ),
        // Rest API routes
        GoRoute(
          path: 'rest-api',
          name: ScreenNames.restApi,
          builder: (context, state) => const RestApiBaseScreen(),
          routes: [
            GoRoute(
              path: 'decoding',
              name: ScreenNames.restApiDecodingExample,
              builder: (context, state) => const JsonDecodingExampleScreen(),
            ),
          ],
        ),
        // Top News routes
        GoRoute(
          path: 'top-news',
          name: ScreenNames.topNews,
          builder: (context, state) => BlocProvider(
            create: (context) => NewsCubit(
              prefs: PrefsStorage.instance,
              repository: ArticleRepository(
                dataSource: TopNewsDataSource(
                  newsApi: NewsApiFake(),
                  //newsApi: NewsApiHttp(),
                  //newsApi: NewsApiRetrofit(Dio()),
                ),
              ),
            )..getTopNews(),
            child: const TopNewsScreen(),
          ),
          routes: [
            GoRoute(
              path: 'article/:url',
              name: ScreenNames.webViewArticle,
              builder: (context, state) => WebViewArticleScreen(
                url: state.pathParameters['url'] ?? '',
              ),
            ),
          ],
        ),

        // Storage routes
        GoRoute(
          path: 'storage',
          name: ScreenNames.storage,
          builder: (context, state) => const StorageBaseScreen(),
          routes: [
            GoRoute(
              path: 'settings',
              name: ScreenNames.storagePageSettings,
              builder: (context, state) => const SettingsScreen(),
            ),
            GoRoute(
              path: 'saving-large-data',
              name: ScreenNames.savingLargeData,
              builder: (context, state) => const SavingLargeDataScreen(),
            ),
          ],
        ),

        GoRoute(
          path: 'settings',
          name: ScreenNames.mainPageSettings,
          builder: (context, state) => const SettingsScreen(),
        ),

        // Push Notifications route
        GoRoute(
          path: 'push-notifications',
          name: ScreenNames.pushNotifications,
          builder: (context, state) => const PushNotificationsScreen(),
        ),
      ],
    ),
  ],
);
