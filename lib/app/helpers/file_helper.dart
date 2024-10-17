double convertFileSize(int fileSize, String target) {
  var fileSizeInKB = fileSize / 1024;

  if (target == 'MB') {
    var fileSizeInMB = fileSizeInKB / 1024;
    return fileSizeInMB;
  } else {
    return fileSizeInKB;
  }
}
