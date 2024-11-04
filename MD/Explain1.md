## 1. [TypeValue] var, dynamic
`var`: 변수의 타입이 고정되는 타입

`dynamic`: 변수의 타입이 고정되지 않는 타입

## 2. [ConstantValue]final, const
`final`: 런타임 상수(코드가 실행되는 순간에 값이 확정시)

`const`: 빌드타임 상수(코드를 실행하지 않은 상태에서 값이 확정시)

## 3. [Collection] List, Map
`List<[Type]>`: `List.length()`, `List.add([값])`, `List.remove([값])`, `List.indexOf([값])`, `List.where((x) => x == '')`, `List.map((x) => 'explain $x')`

`Map<[Type], [Type]>`: `Map.addAll({[값들]})`, `Map.remove`, `Map.keys`, `Map.values`

`Set<[Type]>`: `Set.add([값])`, `Set.remove([값])`, `Set.contains([값])`

* List는 중복값 허용, Set은 중복값 불가(중복 자동 처리)