// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:hexcolor/hexcolor.dart';

// class products_Screen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return BlocConsumer<shopCubit, shopStates>(
//       listener: (context, state) {
//         if (state is FavoriteSuccessState) {
//           if (state.model.status) {
//             showToast(text: state.model.message, state: ToastState.SUCCESS);
//           } else {
//             showToast(text: state.model.message, state: ToastState.ERORR);
//           }
//         }
//       },
//       builder: (context, state) {
//         return ConditionalBuilder(
//           condition: shopCubit.get(context).homeModel != null &&
//               shopCubit.get(context).categoriesModel != null,
//           builder: (context) => BuilderWidget(
//               shopCubit.get(context).homeModel!, shopCubit.get(context).categoriesModel!, context),
//           fallback: (context) => const Center(child: CircularProgressIndicator()),
//         );
//       },
//     );
//   }

//   Widget builderWidget(home_model model, categories_Model categoriesModel, context) =>
//       SingleChildScrollView(
//         physics: const BouncingScrollPhysics(),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             CarouselSlider(
//               items: model.data?.banners
//                   .map(
//                     (e) => Padding(
//                       padding: const EdgeInsets.all(15.0),
//                       child: ClipRRect(
//                         borderRadius: BorderRadius.circular(10),
//                         child: Image(
//                           width: double.infinity,
//                           image: NetworkImage(e.image),
//                           fit: BoxFit.cover,
//                         ),
//                       ),
//                     ),
//                   )
//                   .toList(),
//               options: CarouselOptions(
//                 height: 250,
//                 viewportFraction: 1.0,
//                 autoPlay: true,
//                 autoPlayCurve: Curves.fastOutSlowIn,
//                 autoPlayInterval: const Duration(seconds: 3),
//                 autoPlayAnimationDuration: const Duration(milliseconds: 3000),
//                 scrollDirection: Axis.horizontal,
//                 reverse: false,
//                 enableInfiniteScroll: true,
//                 initialPage: 0,
//               ),
//             ),
//             const SizedBox(height: 5),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 10),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     'Categories',
//                     style: TextStyle(
//                       color: shopCubit.get(context).isDark ? Colors.white : Colors.black,
//                       fontSize: 25,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   const SizedBox(height: 10),
//                   SizedBox(
//                     height: 100,
//                     child: ListView.separated(
//                       physics: const BouncingScrollPhysics(),
//                       scrollDirection: Axis.horizontal,
//                       itemBuilder: (context, index) =>
//                           bulidCategoriesItem(categoriesModel.data!.data[index], context),
//                       separatorBuilder: (context, index) => const SizedBox(width: 10),
//                       itemCount: categoriesModel.data!.data.length,
//                     ),
//                   ),
//                   const SizedBox(height: 20),
//                   Text(
//                     'Products',
//                     style: TextStyle(
//                       color: shopCubit.get(context).isDark ? Colors.white : Colors.black,
//                       fontSize: 25,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             const SizedBox(height: 5),
//             Container(
//               color: Colors.white,
//               child: GridView.count(
//                 shrinkWrap: true,
//                 physics: const NeverScrollableScrollPhysics(),
//                 crossAxisCount: 2,
//                 //mainAxisSpacing: 2,
//                 //crossAxisSpacing: 2,
//                 childAspectRatio: 1 / 1.63,
//                 children: List.generate(
//                   model.data!.products.length,
//                   (index) => buildGridProduct(model.data!.products[index], context),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       );

//   Widget buildGridProduct(ProductModel model, context) => Padding(
//         padding:
//             shopCubit.get(context).isDark ? const EdgeInsets.all(0) : const EdgeInsets.all(4.0),
//         child: Container(
//           decoration: BoxDecoration(
//             borderRadius: shopCubit.get(context).isDark ? null : BorderRadius.circular(30),
//             color: shopCubit.get(context).isDark ? HexColor('333739') : Colors.white,

//             boxShadow: shopCubit.get(context).isDark
//                 ? null
//                 : [
//                     BoxShadow(
//                       color: Colors.grey.withOpacity(0.3),
//                       spreadRadius: 2,
//                       blurRadius: 2,
//                       offset: const Offset(0, 2), // changes position of shadow
//                     ),
//                   ],
//             // Container(
//             //   margin: EdgeInsets.all(4),
//             //   decoration: BoxDecoration(
//             //     color: Colors.white,
//             //     borderRadius: BorderRadius.circular(30),
//             //     boxShadow: [
//             //       BoxShadow(
//             //         color: Colors.grey.withOpacity(0.3),
//             //         spreadRadius: 2,
//             //         blurRadius: 9,
//             //         offset: Offset(0, 2), // changes position of shadow
//             //       ),
//             //     ],
//             //   ),
//             //   child: GestureDetector(
//             //     onTap: () {
//             //       Navigator.push(
//             //           context,
//             //           MaterialPageRoute(
//             //               builder: (context) => ProductView(
//             //                 index,
//             //                 model,
//             //               )));
//             //     },
//             //     child: Column(
//             //       crossAxisAlignment: CrossAxisAlignment.start,
//             //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             //       children: [
//             //         Stack(
//             //           alignment: Alignment.bottomLeft,
//             //           children: [
//             //             Container(
//             //               height: 200,
//             //               // padding: EdgeInsets.all(20),
//             //               decoration: BoxDecoration(
//             //                   borderRadius: BorderRadius.circular(30),
//             //                   image: DecorationImage(
//             //                     image: NetworkImage(
//             //                         '${model.data!.products[index].image}'),
//             //                   )),
//             //             ),
//             //             if (model.data!.products[index].discount != 0)
//             //               Container(
//             //                 margin: EdgeInsets.only(left: 4),
//             //                 decoration: BoxDecoration(
//             //                     color: Colors.red,
//             //                     borderRadius: BorderRadius.circular(7),
//             //                     boxShadow: [
//             //                       BoxShadow(
//             //                           color: Colors.grey.withOpacity(0.4),
//             //                           blurRadius: 6,
//             //                           spreadRadius: 2,
//             //                           offset: Offset(0, 3))
//             //                     ]),
//             //                 child: Padding(
//             //                   padding: const EdgeInsets.all(4.0),
//             //                   child: Text(
//             //                     'Discount',
//             //                     style: TextStyle(color: Colors.white),
//             //                   ),
//             //                 ),
//             //               ),
//             //           ],
//             //         ),
//             //         Padding(
//             //           padding: const EdgeInsets.all(10.0),
//             //           child: Column(
//             //             crossAxisAlignment: CrossAxisAlignment.start,
//             //             mainAxisSize: MainAxisSize.min,
//             //             children: [
//             //               Text(
//             //                 model.data!.products[index].name,
//             //                 style: TextStyle(
//             //                     color: CozmoText,
//             //                     fontSize: 15,
//             //                     fontWeight: FontWeight.w600),
//             //                 maxLines: 2,
//             //                 overflow: TextOverflow.ellipsis,
//             //               ),
//             //               // SizedBox(
//             //               //   height: 0,
//             //               // ),
//             //               Row(
//             //                 mainAxisSize: MainAxisSize.min,
//             //                 children: [
//             //                   Text(
//             //                     '${model.data!.products[index].price} ',
//             //                     style: TextStyle(
//             //                         color: CozmoColor2,
//             //                         fontSize: 11,
//             //                         fontWeight: FontWeight.w600),
//             //                     maxLines: 1,
//             //                     overflow: TextOverflow.ellipsis,
//             //                   ),
//             //                   SizedBox(
//             //                     width: 10,
//             //                   ),
//             //                   if (model.data!.products[index].discount != 0)
//             //                     Text(
//             //                       '${model.data!.products[index].old_price} ',
//             //                       style: TextStyle(
//             //                           decoration: TextDecoration.lineThrough,
//             //                           color: CozmoColor1,
//             //                           fontSize: 11,
//             //                           fontWeight: FontWeight.w600),
//             //                       maxLines: 2,
//             //                       overflow: TextOverflow.ellipsis,
//             //                     ),
//             //                   Spacer(),
//             //                   Expanded(
//             //                     child: IconButton(
//             //                       onPressed: () {
//             //                         print(model.data!.products[index].id);
//             //                         ShopCubit.get(context).ChangFavorite(
//             //                             model.data!.products[index].id);
//             //                       },
//             //                       icon: ShopCubit.get(context).favorites[
//             //                       model.data!.products[index].id]!
//             //                           ? Icon(
//             //                         Icons.favorite,
//             //                         color: CozmoColor7,
//             //                         size: 27,
//             //                       )
//             //                           : Icon(
//             //                         Icons.favorite_border,
//             //                         color: CozmoText1,
//             //                         size: 20,
//             //                       ),
//             //                       padding: EdgeInsets.all(0),
//             //                     ),
//             //                   ),
//             //                   IconButton(
//             //                     onPressed: () {
//             //                       ShopCubit.get(context).ChangeCart(
//             //                           model.data!.products[index].id);
//             //                     },
//             //                     icon: ShopCubit.get(context)
//             //                         .cart[model.data!.products[index].id]!
//             //                         ? Icon(
//             //                       Icons.shopping_cart_outlined,
//             //                       color: CozmoColor2,
//             //                     )
//             //                         : Icon(
//             //                       Icons.add_shopping_cart_outlined,
//             //                       color: CozmoText1,
//             //                     ),
//             //                   )
//             //                 ],
//             //               ),
//             //             ],
//             //           ),
//             //         )
//             //       ],
//             //     ),
//             //   ),
//             // ),
//           ),
//           child: Padding(
//             padding: const EdgeInsets.all(4.0),
//             child: ClipRRect(
//               borderRadius: BorderRadius.circular(20),
//               child: Container(
//                 color: Colors.white,
//                 child: Column(
//                   children: [
//                     Stack(
//                       alignment: AlignmentDirectional.bottomStart,
//                       children: [
//                         Image(
//                           image: NetworkImage(model.image),
//                           height: 200,
//                         ),
//                         if (model.discount != 0)
//                           Container(
//                             color: Colors.red,
//                             child: Padding(
//                               padding: const EdgeInsets.symmetric(horizontal: 3),
//                               child: Row(
//                                 mainAxisSize: MainAxisSize.min,
//                                 children: [
//                                   Text(
//                                     'Discount'.toUpperCase(),
//                                     style: const TextStyle(fontSize: 8, color: Colors.white),
//                                   ),
//                                   const SizedBox(width: 5),
//                                   Text(
//                                     '${model.discount}%',
//                                     style: const TextStyle(fontSize: 8, color: Colors.white),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                       ],
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.all(10.0),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         mainAxisSize: MainAxisSize.min,
//                         children: [
//                           Text(
//                             model.name,
//                             maxLines: 2,
//                             overflow: TextOverflow.ellipsis,
//                             style: const TextStyle(
//                               height: 1.3,
//                             ),
//                           ),
//                           Row(
//                             children: [
//                               Column(
//                                 children: [
//                                   Text(
//                                     '${model.price}\$',
//                                     style: const TextStyle(
//                                       fontSize: 14,
//                                       color: defultColor,
//                                     ),
//                                   ),
//                                   if (model.discount != 0)
//                                     Text(
//                                       '${model.oldPrice}\$',
//                                       style: const TextStyle(
//                                         fontSize: 12,
//                                         color: Colors.grey,
//                                         decoration: TextDecoration.lineThrough,
//                                       ),
//                                     ),
//                                 ],
//                               ),
//                               const Spacer(),
//                               IconButton(
//                                 onPressed: () {
//                                   shopCubit.get(context).changeFavorite(model.id);
//                                 },
//                                 icon: Icon(
//                                   shopCubit.get(context).favorite[model.id]!
//                                       ? Icons.favorite
//                                       : Icons.favorite_border,
//                                   size: shopCubit.get(context).favorite[model.id]! ? 27 : 20,
//                                   color: shopCubit.get(context).favorite[model.id]!
//                                       ? Colors.red
//                                       : Colors.grey,
//                                 ),
//                               ),
//                               IconButton(
//                                 onPressed: () {},
//                                 icon: const Icon(Icons.add_shopping_cart),
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ),
//       );

//   Widget bulidCategoriesItem(DataModel model, context) => GestureDetector(
//         onTap: () {
//           NavTo(context, ComingSoon_Screen());
//         },
//         child: Container(
//           width: 100,
//           height: 100,
//           decoration: const BoxDecoration(
//             borderRadius: BorderRadius.all(Radius.circular(20)),
//           ),
//           child: Stack(
//             alignment: AlignmentDirectional.bottomCenter,
//             children: [
//               ClipRRect(
//                 borderRadius: BorderRadius.circular(20),
//                 child: Image(
//                   width: 100,
//                   height: 100,
//                   image: NetworkImage(model.image),
//                   fit: BoxFit.fill,
//                 ),
//               ),
//               Container(
//                 width: 100,
//                 decoration: BoxDecoration(
//                   color: Colors.black.withOpacity(0.7),
//                   borderRadius: const BorderRadius.only(
//                       bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
//                 ),
//                 child: Text(
//                   model.name,
//                   textAlign: TextAlign.center,
//                   maxLines: 1,
//                   overflow: TextOverflow.ellipsis,
//                   style: const TextStyle(
//                     fontSize: 11,
//                     color: Colors.white,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       );
// }
