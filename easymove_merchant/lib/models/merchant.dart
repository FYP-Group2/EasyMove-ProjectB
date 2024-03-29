class Merchant {
  static final Merchant _instance = Merchant._internal();
  late int id;
  late int companyId;
  late int branchId;
  late int region;
  late String branchLocation;
  late String branchCoordinate;
  late String fcmToken;
  late String username;
  late String companyName;
  late String branchName;


  Merchant._internal();

  factory Merchant() {
    return _instance;
  }

  void initializeMerchant(
      int id, int region, int companyId, int branchId, String branchLocation, String branchCoordinate, String fcmToken,
      String username, String companyName, String branchName) {
    this.id = id;
    this.region = region;
    this.companyId = companyId;
    this.branchId = branchId;
    this.branchLocation = branchLocation;
    this.branchCoordinate = branchCoordinate;
    this.fcmToken = fcmToken;
    this.username = username;
    this.companyName = companyName;
    this.branchName = branchName;
  }

}