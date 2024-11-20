import '../model/ingredient.dart';

class IngredientRepository {
  // 미리 정의된 재료 리스트
  final List<Ingredient> _ingredients = [
    // 농작물
    Ingredient(name: 'sweet potato(고구마)', category: 'Crop(농작물)'),
    Ingredient(name: 'potato(감자)', category: 'Crop(농작물)'),
    Ingredient(name: 'carrot(당근)', category: 'Crop(농작물)'),
    Ingredient(name: 'bean sprout(콩나물)', category: 'Crop(농작물)'),
    Ingredient(name: 'onion(양파)', category: 'Crop(농작물)'),
    Ingredient(name: 'green onion(대파)', category: 'Crop(농작물)'),
    Ingredient(name: 'garlic(마늘)', category: 'Crop(농작물)'),
    Ingredient(name: 'napa cabbage(배추)', category: 'Crop(농작물)'),
    Ingredient(name: 'cheongyang pepper(청양고추)', category: 'Crop(농작물)'),
    Ingredient(name: 'paprika(파프리카)', category: 'Crop(농작물)'),
    Ingredient(name: 'broccoli(브로콜리)', category: 'Crop(농작물)'),
    Ingredient(name: 'mushroom(버섯)', category: 'Crop(농작물)'),
    Ingredient(name: 'rice(쌀)', category: 'Crop(농작물)'),

    // 생선류
    Ingredient(name: 'mackerel(고등어)', category: 'Fish(생선류)'),
    Ingredient(name: 'salmon(연어)', category: 'Fish(생선류)'),
    Ingredient(name: 'flounder(광어)', category: 'Fish(생선류)'),

    // 갑각류
    Ingredient(name: 'shrimp(새우)', category: 'Crustacean(갑각류)'),
    Ingredient(name: 'flower crab(꽃게)', category: 'Crustacean(갑각류)'),

    // 해조류
    Ingredient(name: 'seaweed(kim)(김)', category: 'Seaweed(해조류)'),
    Ingredient(name: 'wakame(미역)', category: 'Seaweed(해조류)'),
    Ingredient(name: 'kelp(다시마)', category: 'Seaweed(해조류)'),

    // 육류
    Ingredient(name: 'beef for soup(국거리용 소고기)', category: 'Meat(육류)'),
    Ingredient(name: 'beef for grilling(구이용 소고기)', category: 'Meat(육류)'),
    Ingredient(name: 'pork for boiled dishes(수육용 돼지고기)', category: 'Meat(육류)'),
    Ingredient(name: 'pork for grilling(구이용 돼지고기)', category: 'Meat(육류)'),

    // 가금류
    Ingredient(name: 'egg(계란)', category: 'Poultry(가금류)'),
    Ingredient(name: 'quail egg(메추리알)', category: 'Poultry(가금류)'),
    Ingredient(name: 'chicken thigh (닭다리살)', category: 'Poultry(가금류)'),
    Ingredient(name: 'chicken breast (닭가슴살)', category: 'Poultry(가금류)'),
    Ingredient(name: 'smoked duck (오리 훈제)', category: 'Poultry(가금류)'),

    // 육수류
    Ingredient(name: 'bone broth (사골육수)', category: 'Broth(육수류)'),
    Ingredient(name: 'seafood broth (해물육수)', category: 'Broth(육수류)'),
    Ingredient(name: 'beef stock (비프스톡)', category: 'Broth(육수류)'),
    Ingredient(name: 'chicken stock (치킨스톡)', category: 'Broth(육수류)'),

    // 면류
    Ingredient(name: 'spaghetti (스파게티면)', category:'Noodles (면류)'),
    Ingredient(name:'somen (소면)',category:'Noodles (면류)'),
    Ingredient(name:'knife-cut noodles (칼국수면)',category:'Noodles (면류)'),
    Ingredient(name:'ramen noodles (라면사리)',category:'Noodles (면류)'),
    Ingredient(name:'udon noodles (우동사리)',category:'Noodles (면류)'),

    // 소스류
    Ingredient(name:"tomato sauce (토마토 소스)",category:'Sauce (소스류)'),
    Ingredient(name:"cream sauce (크림 소스)",category:'Sauce (소스류)'),
    Ingredient(name:"rosé sauce (로제 소스)",category:'Sauce (소스류)'),
    Ingredient(name:"oyster sauce (굴소스)",category:'Sauce (소스류)'),
    Ingredient(name:"chili sauce (칠리 소스)",category:'Sauce (소스류)'),

    // 향신료
    Ingredient(name:"gochujang (고추장)",category:'Spice (향신료)'),
    Ingredient(name:"doenjang (된장)",category:'Spice (향신료)'),
    Ingredient(name:"ssamjang (쌈장)",category:'Spice (향신료)'),
    Ingredient(name:"soy sauce (간장)",category:'Spice (향신료)'),

    // 유제품
    Ingredient(name:"milk (우유)",category:'Dairy (유제품)'),
    Ingredient(name:"cheese (치즈)",category:'Dairy (유제품)'),

    // 가공류
    Ingredient(name:"spam",category:'Processed Food (가공식품)'),
    Ingredient(name:"tuna",category:'Processed Food (가공식품)'),
    Ingredient(name:"fish cake",category:'Processed Food (가공식품)'),
    Ingredient(name:"crab stick",category:'Processed Food (가공식품)'),
    Ingredient(name:"sausage",category:'Processed Food (가공식품)')
  ];

  // 모든 재료 가져오기 => TypeListViewModel에서 수행
  List<Ingredient> getAllIngredients() {
    return _ingredients;
  }

  // 카테고리별 재료 가져오기 => TypeListViewModel에서 수행
  List<Ingredient> getIngredientsByCategory(String category) {
    return _ingredients.where((i) => i.category == category).toList();
  }

  // 모든 카테고리 가져오기 => TypeListViewModel에서 수행
  List<String> getAllCategories() {
    return _ingredients.map((i) => i.category).toSet().toList();
  }

}