/// Returns URLs configured properly for the given arguments.
///
/// This makes switching between local dev and prod easier.
abstract class Endpoints {
  /// Where to find image files.
  String media(String mediaType, String fileName);

  /// The update API url for the given table / tstamp.
  String api(String tableName, {int tstamp});
}

/// Right now this points to my personal machine; if you're doing dev work against a local server,
/// update it to point to your own.
class DevEndpoints extends Endpoints {
  String media(String mediaType, String fileName) {
    return null;
  }

  String api(String tableName, {int tstamp}) {
    var url = 'http://192.168.1.108:8000/dadguide/api/serve?table=$tableName';
    if (tstamp != null) {
      url += '&tstamp=$tstamp';
    }
    return url;
  }
}

/// Points to the production server.
class ProdEndpoints extends Endpoints {
  // TODO: oops I should start using this.
  String media(String mediaType, String fileName) {
    return null;
  }

  String api(String tableName, {int tstamp}) {
    var url = 'http://miru.info/dadguide/api/serve.php?table=$tableName';
    if (tstamp != null) {
      url += '&tstamp=$tstamp';
    }
    return url;
  }
}
