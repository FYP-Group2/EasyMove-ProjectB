class Merchant {
  static final Merchant _instance = Merchant._internal();
  late int id;
  late int companyId;
  late int branchId;
  late int region;
  late String branchLocation;
  late String branchCoordinate;

  Merchant._internal();

  factory Merchant() {
    return _instance;
  }

  void initializeMerchant(
      int id, int region, int companyId, int branchId, String branchLocation, String branchCoordinate) {
    this.id = id;
    this.region = region;
    this.companyId = companyId;
    this.branchId = branchId;
    this.branchLocation = branchLocation;
    this.branchCoordinate = branchCoordinate;
  }

}