class MonsterType {
  const MonsterType._(this.id, this.name, this.killers);

  final int id;
  final String name;
  final List<KillerLatent> killers;

  static const MonsterType evoMat = MonsterType._(0, 'Evo Material', []);
  static const MonsterType balanced = MonsterType._(1, 'Balanced', [
    KillerLatent.god,
    KillerLatent.dragon,
    KillerLatent.devil,
    KillerLatent.machine,
    KillerLatent.balanced,
    KillerLatent.attacker,
    KillerLatent.physical,
    KillerLatent.healer,
  ]);
  static const MonsterType physical = MonsterType._(2, 'Physical', [
    KillerLatent.machine,
    KillerLatent.healer,
  ]);
  static const MonsterType healer = MonsterType._(3, 'Healer', [
    KillerLatent.dragon,
    KillerLatent.attacker,
  ]);
  static const MonsterType dragon = MonsterType._(4, 'Dragon', [
    KillerLatent.machine,
    KillerLatent.healer,
  ]);
  static const MonsterType god = MonsterType._(5, 'God', [KillerLatent.devil]);
  static const MonsterType attacker = MonsterType._(6, 'Attacker', [
    KillerLatent.devil,
    KillerLatent.physical,
  ]);
  static const MonsterType devil = MonsterType._(7, 'Devil', [KillerLatent.god]);
  static const MonsterType machine = MonsterType._(8, 'Machine', [
    KillerLatent.god,
    KillerLatent.balanced,
  ]);
  static const MonsterType enhance = MonsterType._(12, 'Enhance', []);
  static const MonsterType awoken = MonsterType._(14, 'Awoken', []);
  static const MonsterType vendor = MonsterType._(15, 'Vendor', []);

  static const List<MonsterType> allTypes = [
    evoMat,
    balanced,
    physical,
    healer,
    dragon,
    god,
    attacker,
    devil,
    machine,
    enhance,
    awoken,
    vendor
  ];

  static final _lookup = Map.fromIterable(allTypes, key: (mt) => mt.id);

  static MonsterType byId(int id) {
    return _lookup[id];
  }
}

class KillerLatent {
  final int id;
  final String name;

  const KillerLatent._(this.id, this.name);

  static const KillerLatent god = KillerLatent._(20, 'God');
  static const KillerLatent dragon = KillerLatent._(21, 'Dragon');
  static const KillerLatent devil = KillerLatent._(22, 'Devil');
  static const KillerLatent machine = KillerLatent._(23, 'Machine');
  static const KillerLatent balanced = KillerLatent._(24, 'Balanced');
  static const KillerLatent attacker = KillerLatent._(25, 'Attacker');
  static const KillerLatent physical = KillerLatent._(26, 'Physical');
  static const KillerLatent healer = KillerLatent._(27, 'Healer');

  static const List<KillerLatent> allTypes = [
    god,
    dragon,
    devil,
    machine,
    balanced,
    attacker,
    physical,
    healer,
  ];

  static final _lookup = Map.fromIterable(allTypes, key: (k) => k.id);

  static MonsterType byId(int id) {
    return _lookup[id];
  }
}
