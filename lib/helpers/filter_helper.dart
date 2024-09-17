class FilterHelper {
  /*List<Category> filterCategories(List<Category> categories, SortMenu sortMenu, String key) {
    if (!categories.haveList) return [];
    var keyCategories = key.isEmpty ? categories : categories.where((item) => item.title.toKey.contains(key.toKey)).toList();
    if (!keyCategories.haveList) return keyCategories;
    if (sortMenu.ascending) keyCategories.sort((itemA, itemB) => itemA.title.toKey.compareTo(itemB.title.toKey));
    if (sortMenu.descending) keyCategories.sort((itemA, itemB) => itemB.title.toKey.compareTo(itemA.title.toKey));
    if (sortMenu.mostPopular) keyCategories.sort((itemA, itemB) => itemB.popularity.nullToInt.compareTo(itemA.popularity.nullToInt));
    return keyCategories;
  }*/

  /*List<AudioBook> filterBooks(List<AudioBook> books, SortMenu sortMenu) {
    if (!books.haveList) return [];
    // if (sortMenu.lastPlayed) {}
    // if (sortMenu.recentlyAdded) {}
    if (sortMenu.ascending) books.sort((itemA, itemB) => itemA.title.toKey.compareTo(itemB.title.toKey));
    if (sortMenu.descending) books.sort((itemA, itemB) => itemB.title.toKey.compareTo(itemA.title.toKey));
    return books;
  }*/
}
