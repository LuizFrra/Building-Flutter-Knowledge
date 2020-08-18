class DataBaseQueriesCreate {
    Map<String, String> _queries = {
    'gifTable': '''CREATE table gifTable(
                    id NVARCHAR(256) PRIMARY KEY,
                    sourceMain NVARCHAR(512),
                    widthMain INTEGER,
                    heightMain INTEGER,
                    sourceDownsizedStill NVARCHAR(512),
                    widthDownsizedStill NVARCHAR(512),
                    heightDownsizedStill NVARCHAR(512),
                    isFavorite bool DEFAULT TRUE
                    );'''
  };

  Map get getQueries => _queries;
}