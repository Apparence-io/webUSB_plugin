enum StatusResponse {
  ok,
  stall,
  babble,
  empty_data,
}

extension StatusResponseHelper on StatusResponse {
  static StatusResponse fromString(String value) {
    return StatusResponse.values
        .firstWhere((type) => type.toString().split(".").last == value);
  }
}
