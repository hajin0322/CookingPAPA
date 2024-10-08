import 'package:flutter/material.dart';
import 'package:group_project/base/widgets/app_bar.dart';
import 'package:group_project/screens/recipe_search_results.dart';

import '../base/res/styles/app_styles.dart';


class RecipeSearch extends StatelessWidget {
  const RecipeSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(title: "Recipe Search"),
      body: RecipeSearchState(),
    );
  }
}


class RecipeSearchState extends StatefulWidget {
  const RecipeSearchState({super.key});

  @override
  State<RecipeSearchState> createState() => _RecipeSearchState();
}

class _RecipeSearchState extends State<RecipeSearchState> {
  bool _isChecked1 = false; //처음 상태 -> 체크 안됨
  bool _isChecked2 = false;
  bool _isChecked3 = false;
  bool _isChecked4 = false;
  bool _isChecked5 = false;
  bool _isChecked6 = false;
  bool _isChecked7 = false;
  bool _isChecked8 = false;
  bool _isChecked9 = false;
  bool _isChecked10 = false;
  bool _isChecked11 = false;
  bool _isChecked12 = false;

  String _selectedTexts = ''; //선택된 재료를 여기에 이어붙이기

  void _updateSelectedTexts() {
    setState(() {
      _selectedTexts = '';
      if (_isChecked1) {
        _selectedTexts += 'Mackerel(고등어), '; //선택되면 _selectedTexts에 추가
      }
      if (_isChecked2) _selectedTexts += 'Corvina(조기), ';
      if (_isChecked3) _selectedTexts += 'Shrimph(새우), ';
      if (_isChecked4) _selectedTexts += 'Blue crab(꽃게), ';
      if (_isChecked5) _selectedTexts += 'Pork belly(삼겹살), ';
      if (_isChecked6) _selectedTexts += 'Pork shoulder(목살), ';
      if (_isChecked7) _selectedTexts += 'Sirloin(등심), ';
      if (_isChecked8) _selectedTexts += 'Tenderloin(안심), ';
      if (_isChecked9) _selectedTexts += 'Cabbage kimchi(배추김치), ';
      if (_isChecked10) _selectedTexts += 'Kkakdugi(깍두기), ';
      if (_isChecked11) _selectedTexts += 'Onion(양파), ';
      if (_isChecked12) _selectedTexts += 'Potato(감자), ';
      if (_selectedTexts.isNotEmpty) {
        _selectedTexts =
            _selectedTexts.substring(0, _selectedTexts.length - 2); // 마지막 콤마 제거
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
        backgroundColor: AppStyles.bgColor,
        body: ListView(children: [
          const SizedBox(height: 40),
          Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(children: [
                const SizedBox(height: 20),
                Column(
                  children: [
                    ExpansionTile(
                      //숨김, 펼치기 기능
                      backgroundColor: AppStyles.expansionTileColor,
                      title: Text(
                        "Seafood(해산물)",
                        style: AppStyles.textStyle,
                      ),
                      initiallyExpanded: false, //처음상태 -> 숨김
                      children: [
                        ExpansionTile(
                          title: Text(
                            "   Fish(어류)",
                            style: AppStyles.textStyle,
                          ),
                          initiallyExpanded: false,
                          children: [
                            Wrap(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          "  Mackerel(고등어)",
                                          style: AppStyles.textStyle,
                                        ),
                                        Checkbox(
                                          //체크박스 위젯
                                            value: _isChecked1,
                                            onChanged: (value) {
                                              setState(
                                                    () {
                                                  _isChecked1 = value!;
                                                },
                                              );
                                              _updateSelectedTexts();
                                            }),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text("  Corvina(조기)",
                                            style: AppStyles.textStyle),
                                        Checkbox(
                                            value: _isChecked2,
                                            onChanged: (value) {
                                              setState(
                                                    () {
                                                  _isChecked2 = value!;
                                                },
                                              );
                                              _updateSelectedTexts();
                                            }),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                        ExpansionTile(
                          title: Text(
                            "   Shellfish(갑각류)",
                            style: AppStyles.textStyle,
                          ),
                          initiallyExpanded: false,
                          children: [
                            Column(
                              children: [
                                Wrap(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Text("  Shrimph(새우)",
                                                style: AppStyles.textStyle),
                                            Checkbox(
                                                value: _isChecked3,
                                                onChanged: (value) {
                                                  setState(
                                                        () {
                                                      _isChecked3 = value!;
                                                    },
                                                  );
                                                  _updateSelectedTexts();
                                                }),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Text("  Blue crab(꽃게)",
                                                style: AppStyles.textStyle),
                                            Checkbox(
                                                value: _isChecked4,
                                                onChanged: (value) {
                                                  setState(
                                                        () {
                                                      _isChecked4 = value!;
                                                    },
                                                  );
                                                  _updateSelectedTexts();
                                                }),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                    ExpansionTile(
                      backgroundColor: AppStyles.expansionTileColor,
                      title: Text(
                        "Livestock(축산물)",
                        style: AppStyles.textStyle,
                      ),
                      initiallyExpanded: false,
                      children: [
                        ExpansionTile(
                          title: Text(
                            "   Pork(돼지고기)",
                            style: AppStyles.textStyle,
                          ),
                          initiallyExpanded: false,
                          children: [
                            Wrap(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          "  Pork belly(삼겹살)",
                                          style: AppStyles.textStyle,
                                        ),
                                        Checkbox(
                                            value: _isChecked5,
                                            onChanged: (value) {
                                              setState(
                                                    () {
                                                  _isChecked5 = value!;
                                                },
                                              );
                                              _updateSelectedTexts();
                                            }),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text("  Pork shoulder(목살)",
                                            style: AppStyles.textStyle),
                                        Checkbox(
                                            value: _isChecked6,
                                            onChanged: (value) {
                                              setState(
                                                    () {
                                                  _isChecked6 = value!;
                                                },
                                              );
                                              _updateSelectedTexts();
                                            }),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                        ExpansionTile(
                          title: Text(
                            "   Beef(소고기)",
                            style: AppStyles.textStyle,
                          ),
                          initiallyExpanded: false,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Wrap(
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          "  Sirloin(등심)",
                                          style: AppStyles.textStyle,
                                        ),
                                        Checkbox(
                                            value: _isChecked7,
                                            onChanged: (value) {
                                              setState(
                                                    () {
                                                  _isChecked7 = value!;
                                                },
                                              );
                                              _updateSelectedTexts();
                                            }),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text("  Tenderloin(안심)",
                                            style: AppStyles.textStyle),
                                        Checkbox(
                                            value: _isChecked8,
                                            onChanged: (value) {
                                              setState(
                                                    () {
                                                  _isChecked8 = value!;
                                                },
                                              );
                                              _updateSelectedTexts();
                                            }),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                    ExpansionTile(
                      backgroundColor: AppStyles.expansionTileColor,
                      title: Text(
                        "Vegetable(채소류)",
                        style: AppStyles.textStyle,
                      ),
                      initiallyExpanded: false,
                      children: [
                        ExpansionTile(
                          title: Text(
                            "   Kimchi(김치류)",
                            style: AppStyles.textStyle,
                          ),
                          initiallyExpanded: false,
                          children: [
                            Wrap(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Row(children: [
                                      Text(
                                        "  Cabbage kimchi(배추김치)",
                                        style: AppStyles.textStyle,
                                      ),
                                      Checkbox(
                                          value: _isChecked9,
                                          onChanged: (value) {
                                            setState(
                                                  () {
                                                _isChecked9 = value!;
                                              },
                                            );
                                            _updateSelectedTexts();
                                          }),
                                    ]),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text("  Kkakdugi(깍두기)",
                                        style: AppStyles.textStyle),
                                    Checkbox(
                                        value: _isChecked10,
                                        onChanged: (value) {
                                          setState(
                                                () {
                                              _isChecked10 = value!;
                                            },
                                          );
                                          _updateSelectedTexts();
                                        }),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                        ExpansionTile(
                          title: Text(
                            "   Raw vegetables(생채소)",
                            style: AppStyles.textStyle,
                          ),
                          initiallyExpanded: false,
                          children: [
                            Wrap(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          "  Onion(양파)",
                                          style: AppStyles.textStyle,
                                        ),
                                        Checkbox(
                                            value: _isChecked11,
                                            onChanged: (value) {
                                              setState(
                                                    () {
                                                  _isChecked11 = value!;
                                                },
                                              );
                                              _updateSelectedTexts();
                                            }),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text("  Potato(감자)",
                                            style: AppStyles.textStyle),
                                        Checkbox(
                                            value: _isChecked12,
                                            onChanged: (value) {
                                              setState(
                                                    () {
                                                  _isChecked12 = value!;
                                                },
                                              );
                                              _updateSelectedTexts();
                                            }),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    SizedBox(
                      width: size.width * 0.9,
                      height: 200,
                      child: Column(
                        children: [
                          Container(
                            color: AppStyles.layoutColor,
                            child: Center(
                              child: Text(
                                _selectedTexts, // 선택된 텍스트 출력
                                textAlign: TextAlign.center,
                                style: AppStyles.textStyle,
                              ),
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () async {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => RecipeSearchResults(
                                    result:
                                    _selectedTexts, //다음 화면의 result에  _selectedTexts를 전달
                                  ),
                                  settings: RouteSettings(
                                    arguments: _selectedTexts,
                                  ),
                                ),
                              );
                            },
                            child: const Text("Cook Start"),
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              ]))
        ]));
  }
}