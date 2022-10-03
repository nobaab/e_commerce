import 'package:e_commerce/bloc/products_bloc.dart';
import 'package:e_commerce/constants/colors.dart';
import 'package:e_commerce/models/api_service.dart';
import 'package:e_commerce/models/products_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductsBloc(
        RepositoryProvider.of<ProductsRepository>(context),
      )..add(DataLoadEvent()),
      child: Scaffold(
        backgroundColor: backgroundColor,
        appBar: AppBar(
          backgroundColor: backgroundColor,
          elevation: 0,
        ),
        body: BlocBuilder<ProductsBloc, ProductsState>(
          builder: (context, state) {
            if (state is DataLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is DataLoadedState) {
              DataInfoModel? dataList = state.products.dataList;
              int? len = dataList!.products!.results!.length;
              //print(dataList.length);
              print(len);
              return Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 48,
                        width: MediaQuery.of(context).size.width * 0.9,
                        decoration: BoxDecoration(
                          color: whiteBack,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: TextFormField(
                          decoration: const InputDecoration(
                            isDense: true,
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.transparent, width: 1.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.transparent, width: 1.0),
                            ),
                            suffixIcon: Icon(Icons.search_outlined),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: GridView.builder(
                        padding: const EdgeInsets.fromLTRB(15, 5, 15, 5),
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          childAspectRatio: 1,
                          crossAxisCount: 2,
                          mainAxisSpacing: 5,
                          crossAxisSpacing: 10,
                          mainAxisExtent: 267,
                        ),
                        itemCount: len,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {},
                            child: SizedBox(
                              child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                elevation: 0,
                                color: whiteBack,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                        "assets/images/potato_chips.png"),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      dataList.products!.results![index]
                                          .productName!,
                                      style: const TextStyle(
                                          color: naturalBlack,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Row(
                                          children: const [
                                            Text(
                                              "ক্রয়",
                                              style: TextStyle(
                                                  color: naturalBlack300,
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Text(
                                              "৳ 20.00",
                                              style: TextStyle(
                                                  color: secondaryColor,
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w700),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: const [
                                            Text(
                                              "৳ 22.00",
                                              style: TextStyle(
                                                  color: secondaryColor,
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: const [
                                            Text(
                                              "বিক্রয়",
                                              style: TextStyle(
                                                  color: naturalBlack300,
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Text(
                                              "৳ 20.00",
                                              style: TextStyle(
                                                  color: naturalBlack300,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w700),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: const [
                                            Text(
                                              "লাভ",
                                              style: TextStyle(
                                                  color: naturalBlack300,
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Text(
                                              "৳ 5.00",
                                              style: TextStyle(
                                                  color: naturalBlack300,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w700),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              );
            } else if (state is DataErrorState) {
              return Center(
                child: Text(state.error),
              );
            }
            return Center(
              child: Text("Data Not Found"),
            );
          },
        ),
      ),
    );
  }
}
