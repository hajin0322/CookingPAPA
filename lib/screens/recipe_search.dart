import 'package:flutter/material.dart';
import 'package:group_project/base/widgets/app_bar.dart';
import 'package:group_project/base/widgets/search_categories.dart';

import '../base/res/styles/app_styles.dart';

class RecipeSearch extends StatelessWidget {
  const RecipeSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Recipe Search"),
      body: const RecipeSearchState(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print('새 레시피 추가');
        },
        backgroundColor: AppStyles.bgColor,
        child: const Icon(Icons.search),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

class RecipeSearchState extends StatefulWidget {
  const RecipeSearchState({super.key});

  @override
  State<RecipeSearchState> createState() => _RecipeSearchState();
}

class _RecipeSearchState extends State<RecipeSearchState> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppStyles.bgColor,
        body: SearchCategories(categories: [
          Category(name: "Seafoods(해산물)", subCategories: [
            Category(name: "Fish(어류)", subCategories: [
              Category(name: "Mackerel(고등어)"),
              Category(name: "Corvina(조기)"),
              Category(name: "Salmon(연어)"),
              Category(name: "대구(대구)"),
              Category(name: "옥돔(옥돔)"),
              Category(name: "도미(도미)"),
              Category(name: "광어(광어)"),
            ]),
            Category(name: "Shellfish(갑각류)", subCategories: [
              Category(name: "Blue crab(꽃게)"),
              Category(name: "Shrimp(칵테일 새우)"),
              Category(name: "Prawns(대하)"),
              Category(name: "Lobster(랍스타)")
            ]),
            Category(name: "Shellfish(어패류)", subCategories: [
              Category(name: "Clam(조개)"),
              Category(name: "abalone(전복)"),
              Category(name: "scallop(가리비)"),
              Category(name: "Oyster(굴)"),
            ]),
            Category(name: "Seaweeds(해조류)", subCategories: [
              Category(name: "Kelp(다시마)"),
              Category(name: "Brown seaweed(미역)"),
              Category(name: "Gamtae(감태)"),
              Category(name: "Hijiki(톳)"),
              Category(name: "Seaweed(김)"),
            ]),
            Category(name: "Cephalopod(두족류)", subCategories: [
              Category(name: "Octopus(문어)"),
              Category(name: "Squid(오징어)"),
              Category(name: "Small octopus(낙지)"),
            ]),
            Category(name: "etc.(기타)", subCategories: [
              Category(name: "해삼(해삼)"),
              Category(name: "멍게(멍게)"),
              Category(name: "성게(성게)"),
              Category(name: "Jelly fish(해파리)"),
            ]),
          ]),
          Category(name: "Livestocks(축산물)", subCategories: [
            Category(name: "Pork(돼지고기)", subCategories: [
              Category(name: "Pork belly(삽겹살)"),
              Category(name: "Pork shoulder(목살)"),
              Category(name: "앞다리살(앞다리살)"),
              Category(name: "오겹살(오겹살)"),
              Category(name: "항정살(항정살)"),
              Category(name: "(대패 삼겹살)"),
              Category(name: "Pork skin(껍데기)"),
              Category(name: "(갈빗살)"),
              Category(name: "(양념?)"),
            ]),
            Category(name: "Beef(소고기)", subCategories: [
              Category(name: "Sirloin(등심)"),
              Category(name: "Tenderloin(안심)"),
              Category(name: "사태(사태)"),
              Category(name: "양지(양지)"),
              Category(name: "(차돌박이)"),
              Category(name: "(우둔살)"),
              Category(name: "(업진살 살살 녹는다)"),
              Category(name: "(채끝)"),
              Category(name: "(갈빗살)"),
              Category(name: "(양념?)"),
              Category(name: "(우삼겹)"),
              Category(name: "(티본 스테이크)"),
            ]),
            Category(name: "Bird(가금류)", subCategories: [
              Category(name: "Chicken(닭고기)", subCategories: [
                Category(name: "Chicken leg(다리살)"),
                Category(name: "Protein(닭가슴살)"),
                Category(name: "Chicken wings(닭날개)"),
              ]),
              Category(name: "(오리고기)")
            ]),
          ]),
          Category(name: "Vegetables(채소류)", subCategories: [
            Category(name: "Raw Vegetables(생채소)", subCategories: [
              Category(name: "Onion(양파)"),
              Category(name: "Potato(감자)"),
              Category(name: "Carrot(당근)"),
              Category(name: "Green onion(대파)"),
              Category(name: "(쪽파)"),
              Category(name: "Chives(부추)"),
              Category(name: "Garlic(마늘)"),
              Category(name: "(상추)"),
              Category(name: "(깻잎)"),
              Category(name: "(무)"),
              Category(name: "(배추)"),
              Category(name: "(양배추)"),
              Category(name: "(양상추)"),
            ]),
            Category(name: "Kimchis(김치류)", subCategories: [
              Category(name: "Cabbage kimchi(배추김치)"),
              Category(name: "Kkakdugi(깍두기)"),
              Category(name: "(파김치)"),
              Category(name: "()"),
            ])
          ]),
          Category(name: "(가공품)", subCategories: [
            Category(name: "가공육", subCategories: [
              Category(name: "Spam(통조림햄)"),
              Category(name: "(후랑크)"),
              Category(name: "(비엔나)"),
              Category(name: "(하몽)"),
            ]),
            Category(name: "(육수)", subCategories: [
              Category(name: "(비프스톡)"),
              Category(name: "(치킨스톡)"),
              Category(name: "(사골육수)"),
            ]),
            Category(name: "Daily(유제품)", subCategories: [
              Category(name: "Milk(우유)"),
              Category(name: "Ricotta(리코타 치즈)"),
              Category(name: "(모짜렐라 치즈)"),
              Category(name: "(체다 치즈)"),
              Category(name: "(파마산 치즈)"),
            ]),
            Category(name: "Frozen(냉동 식품)", subCategories: [
              Category(name: "(냉동 만두)"),
              Category(name: "(근데 냉동은 그냥 렌지 돌리면 되지 않냐)"),
            ]),
            Category(name: "(소스류)", subCategories: [
              Category(name: "(장류)", subCategories: [
                Category(name: "(고추장)"),
                Category(name: "(된장)"),
                Category(name: "(쌈장)"),
                Category(name: "(간장)"),
              ]),
              Category(name: "(카테고리가 뭔지 모르겠음)", subCategories: [
                Category(name: "(식초)"),
                Category(name: "(액젓)"),
                Category(name: "(맛술)"),
              ]),
              Category(name: "(가루?)", subCategories: [
                Category(name: "(소금)"),
                Category(name: "(후추)"),
                Category(name: "(파슬리)"),
                Category(name: "(로즈마리)"),
                Category(name: "(고춧가루)"),
              ]),
            ]),
          ]),
        ]));
  }
}
